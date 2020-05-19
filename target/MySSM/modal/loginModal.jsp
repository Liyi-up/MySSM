<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginLabel" lang>
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="loginLabel">用户登录</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="inputUser" class="col-sm-2 control-label">作者:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="inputUser" placeholder="user">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="col-sm-2 control-label">密码:</label>
                        <div class="col-sm-8">
                            <input type="password" class="form-control" id="inputPassword" placeholder="Password">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary col-md-4" onclick="checkLogin()">登录</button>
                <button type="button" class="btn btn-default col-md-4 col-md-push-4" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<script>
    //检查登录
    function checkLogin() {
        //拿取文本框的内容
        let name = $("#inputUser").val();
        let pwd = $("#inputPassword").val();
        $.ajax({
            url: "Blog/login",
            data: {"username": name, "password": pwd},
            type: "POST",
            success: function (result) {
                if (result.code == 1) {
                    // console.log(result);
                    // 拿到作者
                    console.log(result.extend.User[0].username);
                    $("#nametext").append(result.extend.User[0].username);
                    //将作者名和作者id赋值给隐藏的作用域
                    $("#check").attr({"value":result.extend.User[0].username,"authorId":result.extend.User[0].id});
                    //    隐藏模态框
                    $("#loginModal").modal('hide');
                    //    提示
                    alert("登录成功！");

                    //将作者名传递给添加的模态框
                    $("#AuthorName").attr("value", result.extend.User[0].username);
                    //获取所有和作者有关的数据
                    loginInit();
                } else {
                    alert("作者不存在！")
                }

            }

        })
    }
    //条件查询
    function loginInit() {
        var username = $("#check").val();

        $.ajax({
            url: "Blog/loginInit",
            data: "username=" + username,
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
    //用户登录
    function  Login(){
        let user = $("#check").val();
        console.log(user);
        if (user=="") {
            $("#loginModal").modal({
                options:'show',
                backdrop: "static"
            });
        }
    }
    function  EditLogin(){
        var user = $("#check").val();
        if (user != "") {
            $("#nametext").text("作者:");
            //将作者名传递给添加的模态框
            $("#check").val("");
            to_page(1);
        }
    }
</script>