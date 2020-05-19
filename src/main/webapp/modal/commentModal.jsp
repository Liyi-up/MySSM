<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<div class="modal fade" id="commentModal" tabindex="-1" role="dialog" aria-labelledby="commentLabel" lang>
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="commentLabel">评论</h4>
            </div>
            <div class="modal-body">
                <%--@elvariable id="author" type=""--%>
                <form class="form-horizontal" id="commentfrom">
                    <div class="form-group ">t
                        <label for="textComment" class="col-sm-2 control-label">内容:</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" id="textComment" name="content" rows="10"
                                      style="min-width: 90%" placeholder="请输入内容..."></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary col-md-4" onclick="insertComment()">发布</button>
                <button type="button" class="btn btn-default col-md-4 col-md-push-4" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>