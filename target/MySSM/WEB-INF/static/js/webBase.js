//定义一个全局变量来接收查询到的总记录数
let totalRecord;
let currentPage;
//1.当页面加载完成以后，直接去发送ajax请求，要到分页数据
$(function () {
    //默认进入查询到的第一页
    //检测登录
    to_page(1);

    //动态生成类型
    getTypes("#insertModal select");
    getTypes("#updateModal select");
    clickspecial();

});


//动态获取blog类型
function getTypes(ele) {
    $.ajax({
        url: "Blog/types",
        data: "",
        type: "GET",
        success: function (result) {
            // console.log(result);
            // 1.解析json数据并渲染到页面
            console.log(result);
            //显示类型信息
            // $("#insertModal select").append("")
            $.each(result.extend.types, function () {
                var optionEle = $("<option></option>").append(this).attr("value", this);
                $(ele).append(optionEle);
            })

        }

    })
}


//模糊查询你
function titleLike() {
    var title = $("#blogTitle").val();
    $.ajax({
        url: "Blog/title",
        data: "title=" + title,
        type: "GET",
        success: function (result) {
            console.log(result);
            // 1.解析json数据并渲染到页面
            table(result);
            nav_info(result);
            nav(result);
        }

    })

}


//表格
function table(result) {
    //清空缓存
    $("#mytbody").empty();
    let datas = result.extend.PageInfo.list;

    $.each(datas, function (item,) {
        // alert(item.title);
        // console.log(datas);
        // console.log(item);
        var id = $("<td></td>").append(datas[item].id).addClass("text-center").attr("id", datas[item].id);
        var title = $("<td></td>").append(datas[item].title).addClass("text-center");
        var content = $("<td></td>").append(datas[item].content).addClass("text-center");
        var author = $("<td></td>").append(datas[item].author.username).addClass("text-center");
        var createTime = $("<td></td>").append(datas[item].createTime).addClass("text-center");
        var type = $("<td></td>").append(datas[item].type).addClass("text-center");
        var comments;
        //判断数组是否为空数组并做出对应处理
        if (datas[item].comments.length == 0) {
            comments = $("<td></td>").append(datas[item].comments.length).addClass("text-center");
        } else {

            comments = $("<td></td>").append(datas[item].comments.length).addClass("text-center").attr("title", datas[item].comments[0].content);
        }

        // <button class="btn btn-danger btn-sm">
        // <span class="glyphicon glyphicon-floppy-remove"></span>
        // 删除
        // </button>
        var editBtn = $("<button></button>").addClass("bttn btn-primary btn-sm update")
            .append($("<span></span>")).addClass("glyphicon glyphicon-pencil").append("编辑").attr({
                "blogId": datas[item].id,
                "authorId": datas[item].author.id
            });
        var delBtn = $("<button></button>").addClass("bttn btn-danger btn-sm delete")
            .append($("<span></span>")).addClass("glyphicon glyphicon-floppy-remove ").append("删除").attr({
                "blogId": datas[item].id,
                "authorId": datas[item].author.id
            });
        //append方法执行完成后仍然会返回原来的元素
        var commentBtn = $("<button></button>").addClass("bttn btn-success btn-sm addcomment")
            .append($("<span></span>")).addClass("glyphicon glyphicon-pencil comment").append("评论").attr("blogid", datas[item].id);
        var btntd = $("<td></td>").append(editBtn).append("&nbsp;").append(delBtn).append("&nbsp;").append(commentBtn);

        $("<tr></tr>").append(id)
            .append(title)
            .append(content)
            .append(createTime)
            .append(type)
            .append(author)
            .append(comments)
            .append(btntd).appendTo("#mytbody");

    });
}

//给按钮添加点击事件之前
//分页信息
function nav_info(result) {
    $("#nav_info").empty();
    $("#nav_info").append("当前:第" + result.extend.PageInfo.pageNum + "页" +
        "&nbsp;&nbsp;" + "总页数:" + result.extend.PageInfo.pages +
        "&nbsp;&nbsp;" + "总记录数:" + result.extend.PageInfo.total);
    totalRecord = result.extend.PageInfo.total;
    currentPage = result.extend.PageInfo.pageNum;
}

//分页条导航栏,添加点击事件
function nav(result) {
    $("#nav").empty();
    var ul = $("<ul></ul>").addClass("pagination ");
    //构建元素
    var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
    var beforPageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
    if (result.extend.PageInfo.hasPreviousPage == false) {
        firstPageLi.addClass("disabled");
        beforPageLi.addClass("disabled");
    } else {
        //为元素添加点击翻页事件
        //首页点击
        firstPageLi.click(function () {
            to_page(1);
        });
        //上一页点击
        beforPageLi.click(function () {
            to_page(result.extend.PageInfo.pageNum - 1);
        });
    }

    //构建元素
    var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href", "#"));
    var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
    if (result.extend.PageInfo.hasNextPage == false) {
        lastPageLi.addClass("disabled");
        nextPageLi.addClass("disabled");

    } else {
        //下一页点击
        nextPageLi.click(function () {
            to_page(result.extend.PageInfo.pageNum + 1);
        });
        //尾页点击
        lastPageLi.click(function () {
            to_page(result.extend.PageInfo.pages);
        })
    }

    //添加首页和前一页
    ul.append(firstPageLi).append(beforPageLi);
    $.each(result.extend.PageInfo.navigatepageNums, function (index, item) {
        //取出页码号
        var numli = $("<li></li>").append($("<a></a>").append(item));
        //如果是当前页码显示选定状态
        if (result.extend.PageInfo.pageNum == item) {
            numli.addClass("active");
        }
        //给页码添加点击事件
        numli.click(function () {
            to_page(item);
        });
        ul.append(numli);
    });
    // 添加下一页和末页的提示
    ul.append(nextPageLi).append(lastPageLi);
    //把构建好的ul添加到nav中
    var navEle = $("<nav></nav>").append(ul);
    navEle.appendTo("#nav")
}


// 跳转页面
function to_page(pn) {
    $.ajax({
        url: "Blog/init",
        data: "pn=" + pn,
        type: "GET",
        success: function (result) {
            // console.log(result);
            // 1.解析json数据并渲染到页面
            table(result);
            nav_info(result);
            nav(result);
        }

    })
}

//    获取当前时间
function getDate() {
//判断是否在前面加0
    function getNow(s) {
        return s < 10 ? '0' + s : s;
    }

    var myDate = new Date();

    var year = myDate.getFullYear();        //获取当前年
    var month = myDate.getMonth() + 1;   //获取当前月
    var date = myDate.getDate();            //获取当前日
    var h = myDate.getHours();              //获取当前小时数(0-23)
    var m = myDate.getMinutes();          //获取当前分钟数(0-59)
    var s = myDate.getSeconds();

    var now = year + '-' + getNow(month) + "-" + getNow(date) + " " + getNow(h) + ':' + getNow(m) + ":" + getNow(s);
}


//1.我们按钮是动态创建的，所以click事件是绑定不上的
//2.旧版本的jquery可以通过live对后来渲染的元素进行事件绑定
//3.新版本通过 移除掉了live，使用on替代
// 使用 on() 方法添加的事件处理程序适用于当前及未来的元素（比如由脚本创建的新元素）
//$(selector).on(event,childSelector,data,function)
//更新按钮操作
$(document).on("click", ".update", function () {
        let id = $(this).attr("blogId");
        let authorId = $(this).attr("AuthorId");
        let authorName = $("#check").val();
        let checkAuthorId = $("#check").attr("authorId");
        console.log(checkAuthorId);
        //编辑前判断用户是否登录
        if (authorName == "") {
            $("#loginModal").modal({
                backdrop: "static"
            });
        } else {
            $.ajax({
                url: "Blog/toUpdate/" + id,
                type: "GET",
                success: result => {
                    if (authorId == checkAuthorId) {
                        setValues(result);
                        $("#updateModal").modal({backdrop: "static"})
                    } else {
                        alert("暂无权限");
                    }


                }

            });
        }
    }
);


//    追加数据到模态框
function setValues(result) {
    console.log(result);
    setdate("#updateCreateTime");
    $("#updateId").val(result.extend.blog.id);
    $("#updateTitle").val(result.extend.blog.title);
    $("#updateContent").val(result.extend.blog.content);
    $("#updateCreateTime").val(result.extend.blog.createTime);
    $("#updateType").val(result.extend.blog.type);

}

//删除按钮
$(document).on("click", ".delete", function () {
    let id = $(this).attr("blogId");
    let authorId = $(this).attr("AuthorId");
    let authorName = $("#check").val();
    let checkAuthorId = $("#check").attr("authorId");
    //删除前判断用户是否登录
    console.log(id);
    if (authorName == "") {
        $("#loginModal").modal({
            backdrop: "static"
        });
    } else {
        if (authorId == checkAuthorId) {
            $.ajax({
                url: "Blog/delete/" + id,
                type: "GET",
                success: result => {
                    console.log(result);
                    to_page(currentPage);
                }
            })
        } else {
            alert("暂无权限");
        }
    }

});


function getDate(ele) {
    var today = new Date();
    var date = today.getFullYear() + "-" + twoDigits(today.getMonth() + 1) + "-" + twoDigits(today.getDate()) + "";
    // var week = " 星期" + "日一二三四五六 ".charAt(today.getDay());
    // var time = twoDigits(today.getHours()) + ": " + twoDigits(today.getMinutes()) + ": " + twoDigits(today.getSeconds());
    $(ele).val(date);
    // console.log(today.getHours())
}

function twoDigits(val) {//如果当前处于0-9点则在前面追加一个“0”
    if (val < 10) return "0" + val;
    return val;
}

//评论按钮
$(document).on("click", ".addcomment", function () {
    let id = $(this).attr("blogId");
    $("#commentModal").modal({
        backdrop: "static"
    });
    //初始化评论框数据
    getDate("#commentTime");
    $("#blogId").val(id);
});


function setdate(ele) {
    $(ele).datetimepicker({
        format: "YYYY-MM-DD ",
        language: "zh-CN",
        startDate: new Date(), // 窗口可选时间从今天开始
        autoclose: true,
        todayBtn: true, // 如果此值为true 或 "linked"，则在日期时间选择器组件的底部显示一个 "Today" 按钮用以选择当前日期。
        opens: "Top", //日期选择框的弹出位置
    }).blur(function () {
        $(this).data("DateTimePicker").hide();
    });
    $(ele).on('dp.change', function (ev) {
        var newDateTime = ev.date ? ev.date.format('yyyy-MM-dd HH:mm:ss') : "";
        var oldDateTime = ev.oldDate ? ev.oldDate.format('yyyy-MM-dd HH:mm:ss') : "";
        if (newDateTime != oldDateTime) {
            $(this).data("DateTimePicker").hide();
        }
    });

}
