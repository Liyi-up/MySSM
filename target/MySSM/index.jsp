<%--
  Created by IntelliJ IDEA.
  User: liyi
  Date: 2020/4/3
  Time: 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>首页</title>
</head>
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.bootcss.com/bootstrap-datetimepicker/3.0.1/css/bootstrap-datetimepicker.css" rel="stylesheet">
<link href="https://cdn.bootcss.com/bootstrap-datetimepicker/3.0.1/css/bootstrap-datetimepicker.min.css"
      rel="stylesheet">
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.bootcss.com/moment.js/2.22.1/moment-with-locales.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-datetimepicker/3.0.1/js/bootstrap-datetimepicker.min.js"></script>
<script src="js/bootstrap-datepicker.zh-CN.js"></script>
<script src="js/special.js"></script>
<script src="js/webBase.js"></script>
<link href="css/webBase.css" rel="stylesheet">
<body>
<%--检查登录状态的隐藏域--%>
<input type="hidden"  id="check" style="display: none">
<div style="position: absolute">
    <%--用户注册模态框--%>
    <%@include file="modal/registerModal.jsp" %>
    <%--用户注册模态框--%>

    <%--评论模态框--%>
    <%@include file="modal/commentModal.jsp" %>
    <%--评论模态框--%>
    <%--用户登录模态框--%>
    <%@include file="modal/loginModal.jsp" %>
    <%--用户登录模态框--%>

    <%--新增blog模态框--%>
    <%@include file="modal/addBlogModal.jsp" %>
    <%--新增blog模态框--%>

    <%--    编辑Blog模态框>--%>
    <%@include file="modal/updateModal.jsp" %>
    <%--    编辑Blog模态框>--%>

    <%--    评论模态框>--%>
    <%@include file="modal/addCommentModal.jsp" %>
    <%--    评论模态框>--%>
</div>
<div class="page-header">
    <h2 id="nametext" >作者:</h2>
</div>
<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">博客管理系统</h3>
    </div>
    <div class="panel-body form-inline">

        <Label method="post">
            Title:
            <input type="text" class="form-control" id="blogTitle">
            <input type="button" value="搜索" class='btn btn-primary' onclick="titleLike()">
        </Label>
        <label>
            <input type="button" value="发表博文" class='btn btn-primary' onclick="insertBtn()">
        </label>
        <label>
            <input type="button" value="用户注册" class='btn btn-info' onclick="registerBtn()">
        </label>
        <label>
            <input type="button" value="用户登录" class='btn btn-success' onclick="Login()">
        </label>
        <label>
            <input type="button" value="退出登录" class='btn btn-warning' onclick="EditLogin()">
        </label>
    </div>
</div>
<table class="table table-hover table-bordered table-striped">
    <thead>
    <tr class="text-center">
        <th>Id</th>
        <th>Title</th>
        <th>Content</th>
        <th>Create_time</th>
        <th>Type</th>
        <th>Author</th>
        <th>Comment</th>
        <th>Operation</th>
    </tr>
    </thead>
    <tbody id="mytbody">
    </tbody>
</table>
<%--显示分页信息--%>
<div class="row">
    <%--    分页文字信息--%>
    <div class="col-md-6" id="nav_info"></div>
    <div class="col-md-6 " id="nav"></div>
</div>
</body>

</html>