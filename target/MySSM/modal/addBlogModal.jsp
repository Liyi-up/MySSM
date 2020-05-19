<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="modal fade" id="insertModal" tabindex="-1" role="dialog" aria-labelledby="insertLabel" lang>
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="insertLabel">添加博文</h4>
            </div>
            <div class="modal-body">
                <%--@elvariable id="author" type=""--%>
                <form class="form-horizontal" id="insertfrom">
                    <div class="form-group ">
                        <label for="AuthorName" class="col-sm-2 control-label">作者:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control form-control-static" id="AuthorName" placeholder="author" name="author">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="addTitle" class="col-sm-2 control-label">标题:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="addTitle" placeholder="title" name="title">
                        </div>
                    </div>
                    <div class="form-group ">
                        <label for="addConent" class="col-sm-2 control-label">内容:</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" id="addConent" name="content" rows="10"
                                      style="min-width: 90%" placeholder="请输入内容..."></textarea>

                        </div>
                    </div>
                    <div class="form-group">
                        <label for="addCreateTime" class="col-sm-2 control-label">发布时间:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="addCreateTime" placeholder="CreateTime"
                                   name="create_time">
                            <span class="add-on"><i class="icon-th"></i></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="addType" class="col-sm-2 control-label">类型:</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="addType" name="type">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary col-md-4" onclick="insertblog()">添加</button>
                <button type="button" class="btn btn-default col-md-4 col-md-push-4" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<script>
    //新增blog
    function insertblog() {
        //将表单钟的所有数据序列化成字符串
        let form = $("#insertfrom").serialize();
        //转码
        let blog = decodeURIComponent(form, true);
        console.log(blog);
        var author_name = $("#AuthorName").val();

        $.ajax({
            url: "Blog/addBlog/" + author_name,
            type: "POST",
            data: blog,
            success: function (result) {
                console.log(result);
                if (result.code == 1) {
                    //    员工保持成功后关闭模态框
                    $("#insertModal").modal('hide');
                    //    跳转到最后一页
                    //    发送ajax
                    alert("添加成功");
                    to_page(totalRecord);
                }
            }
        })
    }
    // 时间发生改变则关闭时间选择器
    // $(this).datetimepicker({
    //     format: "YYYY-MM-DD ",
    //     language: "zh-CN",
    // }).on('dp.change', function (ev) {
    //     var newDateTime = ev.date ? ev.date.format('yyyy-MM-dd') : "";
    //     var oldDateTime = ev.oldDate ? ev.oldDate.format('yyyy-MM-dd') : "";
    //     if (newDateTime != oldDateTime) {
    //         $(this).data("DateTimePicker").hide();
    //     }

    //时间选择器
    setdate("#addCreateTime");
    //检查用户是否登录
    function insertBtn() {
        //检查是否已经登录
        var user = $("#check").val();
        if (user == "") {
            $("#loginModal").modal({
                //未登录显示登录框
                backdrop: "static"
                //    动态生成类型
            });

         }else {
            $("#insertModal").modal({
                backdrop: "static"
            })
        }
                // else {
        //     //用户已经登录则显示新增框
        //     $("#insertModal").modal({
        //         backdrop: "static"
        //     });
        //
        // }
    }
</script>