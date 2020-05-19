<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="modal fade" id="CommentModal" tabindex="-1" role="dialog" aria-labelledby="insertLabel" lang>
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="insertLabel">评论</h4>
            </div>
            <div class="modal-body">
                <%--@elvariable id="author" type=""--%>
                <form class="form-horizontal" id="commentFrom">
                    <div class="form-group">
                        <label for="commentTime" class="col-sm-2 control-label">当前日期:</label>
                        <div class="col-sm-4">
                            <input type="hidden" style="position: absolute" name="blogId" id="blogId">
                            <input type="text" class="form-control form-control-static" id="commentTime"  name="postdate"
                              readonly>
                        </div>
                    </div>
                    <div class="form-group ">
                        <label for="commentConent" class="col-sm-2 control-label">内容:</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" id="commentConent" name="content" rows="10"
                                      style="min-width: 90%" placeholder="请输入内容..."></textarea>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary col-md-4" onclick="addComment()">保存</button>
                <button type="button" class="btn btn-default col-md-4 col-md-push-4" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<script>
    function addComment() {
        let form = $("#commentFrom").serialize();
        //转码
        let comment = decodeURIComponent(form, true);
        console.log(comment);
        $.ajax({
            url:"Blog/addComment",
            type: "POST",
            data:comment,
            success:res=>{
                $("#commentModal").modal('hide');
                alert("评论成功");
                to_page(currentPage);
            }
        })
    }
</script>