<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table table-hover">
			  <tr>
			  	<th>权限管理</th>
			  	<th>用户名</th>
			  	<th>是否可用</th>
			  	<th>创建时间</th>
			  	<th>修改时间</th>
			  	<th>操作</th>
			  </tr>
			  <c:forEach items="${users}" var="user">
			  	<tr>
			  		<td><button class="btn btn-default" data-toggle="modal" data-target="#myModal" onclick="search_grant(${user.id});" >权限管理</button></td>
			  		<td>${user.username}</td>
			  		<c:if test="${user.flag eq 1}">
				  		<td>
				  			<input class="btn btn-default" type="button" value="禁用"/>	
				  		</td>
			  		</c:if>
			  		<c:if test="${user.flag eq 0}">
				  		<td>
				  			<input class="btn btn-default" type="button" value="启用"/>	
				  		</td>
			  		</c:if>
			  		<td><fmt:formatDate value="${user.createdate}" pattern="yyyy-MM-dd"/></td>
			  		<td><fmt:formatDate value="${user.updatedate}" pattern="yyyy-MM-dd"/></td>
			  		<td>
			  			<input class="btn btn-default" type="button" value="新增"/>	
			  			<input class="btn btn-default" type="button" value="修改"/>	
			  			<input class="btn btn-default" type="button" value="删除"/>	
			  		</td>
			  	</tr>
			  </c:forEach>
			</table>
		</div>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
         		<div class="modal-header">
            		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            		<h4 class="modal-title" id="myModalLabel">权限管理</h4>
         		</div>
         		<div class="modal-body">
           		 	<jsp:include page="index.jsp"></jsp:include>
         		</div>
         		<div class="modal-footer">
            		<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            		<button type="button" class="btn btn-primary" data-dismiss="modal">提交</button>
         		</div>
      		</div>
		</div>
	</div>
</body>
	<script type="text/javascript">
	</script>
</html>