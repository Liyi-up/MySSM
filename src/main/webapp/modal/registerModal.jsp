
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%--用户注册模态框--%>

<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="insertLabel" lang>
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="registerLabel">用户注册</h4>
            </div>
            <div class="modal-body">
                <%--@elvariable id="author" type=""--%>
                <form class="form-horizontal" id="registerFrom">
                    <div class="form-group has-feedback " id="divUsername">
                        <label class="control-label" for="inputName" id="massageLable"
                               style="visibility: hidden" >用户名已存在</label>
                        <label for="inputName" class="col-sm-2 control-label">UserName:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="inputName" placeholder="用户名" name="username">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPwd" class="col-sm-2 control-label">Password:</label>
                        <div class="col-sm-8">
                            <input type="password" class="form-control" id="inputPwd" name="password">
                        </div>
                    </div>
                    <div class="form-group ">
                        <label for="InputEamil" class="col-sm-2 control-label">Email:</label>
                        <div class="col-sm-8">
                            <input type="email" class="form-control" id="InputEamil" placeholder="@qq.com" name="email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputAddress" class="col-sm-2 control-label">Address:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="inputAddress" placeholder="地址"
                                   name="address">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPhone" class="col-sm-2 control-label">Phone:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="inputPhone" placeholder="联系电话"
                                   name="phone" maxlength="11">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary col-md-4" onclick="register()">注册</button>
                <button type="button" class="btn btn-default col-md-4 col-md-push-4" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<script>
    let isOk;


    //用户注册模态框
    function registerBtn() {
        $("#registerModal").modal({options:'show', backdrop: "static"});
    }



    //    用户名校验
    $("#inputName").change(function () {
        let username = $(this).val();
        console.log(username);
        $.ajax({
            url: "Blog/register/" + username,
            type: "POST",
            success: function (result) {
                console.log(result);
                if (result.code == 0) {
                    $("#divUsername").addClass("has-error");
                    $("#massageLable").css("visibility", "visible");
                    isOk = false;
                } else {
                    $("#divUsername").removeClass("has-error");
                    $("#massageLable").css("visibility", "hidden");
                    isOk = true;
                }
            }
        })
    });

    //用户注册
    function register() {
        //将表单钟的所有数据序列化成字符串
        var form = $("#registerFrom").serialize();
        //转码
        var author = decodeURIComponent(form, true);
        console.log(author);
      if (isOk){
          $.ajax({
              url: "Blog/register",
              type: "POST",
              data: author,
              success: function (result) {
                  if (result.code == 1) {
                      alert("注册成功");
                      $("#registerModal").modal('hide');
                  } else {
                      alert("注册失败");
                  }
              }
          })
      }
    }



</script>
