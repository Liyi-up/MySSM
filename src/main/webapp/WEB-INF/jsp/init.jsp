<%--
  Created by IntelliJ IDEA.
  User: liyi
  Date: 2020/4/3
  Time: 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>首页</title>
</head>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">

<body>
<div class="panel panel-primary">
    
    <div class="panel-heading">
        <h3 class="panel-title">博客管理系统</h3>
    </div>
    <div class="panel-body form-inline">

        <Label method="post">
            Title:
            <input type="text" class="form-control">
            <input type="button" value="搜索" class='btn btn-primary' onclick="">
        </Label>
        <label>
            <input type="button" value="新增" class='btn btn-primary' onclick="">
        </label>
    </div>
</div>

<table class="table table-hover table-bordered table-striped">
    <thead>
    <tr>
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
    <c:forEach items="${pageInfo.list}" var="blog">
        <tr>
            <td>${blog.id}</td>
            <td>${blog.title}</td>
            <td>${blog.content}</td>
            <td>${blog.createTime}</td>
            <td>${blog.type}</td>
            <td>${blog.author.getUsername()}</td>
            <td>${blog.comments.size()}条</td>
            <td>
                <button class="btn btn-danger btn-sm">
                    <span class="glyphicon glyphicon-floppy-remove"></span>
                    删除
                </button>
                <button class="btn btn-primary btn-sm">
                    <span class="glyphicon glyphicon-pencil"></span>
                    更新
                </button>
            </td>&nbsp;
        </tr>
    </c:forEach>
    </tbody>
</table>
<%--显示分页信息--%>
<div class="row">
    <%--    分页文字信息--%>
    <div class="col-md-6">
        当前:第${pageInfo.pageNum}页&nbsp;&nbsp;总页数:${pageInfo.pages}&nbsp;&nbsp;总记录数:${pageInfo.total}
    </div>
    <div class="col-md-6">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <%--                当存在上一>页时才出现上一页--%>
                <li><a href="init?pn=1">首页</a></li>
                <c:if test="${pageInfo.hasPreviousPage}">
                    <li>
                        <a href="init?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>

                <c:forEach items="${pageInfo.navigatepageNums}" var="Num">
                    <%--                    判断是否是当前页,true提高高亮--%>
                    <c:if test="${Num==pageInfo.pageNum}">
                        <li class="active"><a href="#">${Num}</a></li>
                    </c:if>
                    <c:if test="${Num!=pageInfo.pageNum}">
                        <li><a href="init?pn=${Num}">${Num}</a></li>
                    </c:if>
                </c:forEach>
                <c:if test="${pageInfo.hasNextPage}">
                    <li>
                        <a href="init?pn=${pageInfo.pageNum+1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
                <li><a href="init?pn=${pageInfo.pages}">末页</a></li>
            </ul>
        </nav>
    </div>
</div>
<script>
    $(function () {
        const myajax = {
            //    初始化数据
            init: function () {
                $.ajax({})
            }
            //    模糊查询

            //    删除
        }
    })
</script>
</body>
</html>
