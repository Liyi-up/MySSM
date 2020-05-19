<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%--用户注册模态框--%>
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="insertLabel" lang>
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="updateLabel">编辑博文</h4>
            </div>
            <div class="modal-body">
                <%--@elvariable id="author" type=""--%>
                <form class="form-horizontal" id="updateFrom">
                    <div class="form-group has-feedback " id="divUsername">
                        <label for="updateTitle" class="col-sm-2 control-label">Title:</label>
                        <div class="col-sm-8">
                            <input type="hidden" id="updateId" name="blogId" style="position: absolute">
                            <input type="text" class="form-control" id="updateTitle" placeholder="Title" name="BlogTitle">
                        </div>
                    </div>
                    <div class="form-group ">
                        <label for="updateContent" class="col-sm-2 control-label">Content:</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" id="updateContent" name="content" rows="10"
                                      style="min-width: 90%" placeholder="请输入内容..."></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updateCreateTime" class="col-sm-2 control-label">CreateTime:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="updateCreateTime" placeholder="CreateTime"
                                   name="create_time">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updateType" class="col-sm-2 control-label">Type:</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="updateType" name="type">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary col-md-4" onclick="update()">保存</button>
                <button type="button" class="btn btn-default col-md-4 col-md-push-4" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<script>
function update() {
//拿到表单单中的所有数据
    let form = $("#updateFrom").serialize();
    let authorId = $("#check").attr("authorId");
    //转码
    let blog = decodeURIComponent(form, true);
    console.log(authorId);
    console.log(blog);
//    想控制台请求发送数据
    $.ajax({
        url: "Blog/update/" + authorId,
        data: blog,
        type:"POST",
        success:result=>{
            console.log(result);
            if(result.code==1){
                $("#updateModal").modal('hide');
                to_page(currentPage);
            }else {
                alert("编辑失败");
            }

        }
    })
}
</script>