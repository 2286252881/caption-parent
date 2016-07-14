<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ include file="../../tag.jsp"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>表单验证</title>
<link rel="stylesheet"
	href="${baseurl}/bootstrap_form/vendor/bootstrap/css/bootstrap.css" />
<link rel="stylesheet"
	href="${baseurl}/bootstrap_form/dist/css/bootstrapValidator.css" />

<script type="text/javascript"
	src="${baseurl}/bootstrap_form/vendor/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="${baseurl}/bootstrap_form/vendor/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${baseurl}/bootstrap_form/dist/js/bootstrapValidator.js"></script>
</head>
<body>
	<!-- class都是bootstrap定义好的样式，验证是根据input中的name值 -->
	<form id="defaultForm" method="post" class="form-horizontal">
		<!-- 下面这个div必须要有，插件根据这个进行添加提示 -->
		<div class="form-group">
			<label class="col-lg-3 control-label">Username</label>
			<div class="col-lg-5">
				<input type="text" class="form-control" name="username" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-lg-3 control-label">Password</label>
			<div class="col-lg-5">
				<input type="text" class="form-control" name="password" />
			</div>
		</div>
		<!-- 表单按钮 -->
		<div class="form-group">
			<div class="col-lg-9 col-lg-offset-3">
				<button type="submit" class="btn btn-primary">Sign up</button>
			</div>
		</div>
	</form>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("input[name='username']").focus();
		$('#defaultForm').bootstrapValidator({
			message : 'This value is not valid',
			feedbackIcons : {/*输入框不同状态，显示图片的样式*/
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {/*验证*/
				/*用户名*/
				username : {/*键名username和input name值对应*/
					message : 'The username is not valid',
					validators : {
						notEmpty : {/*非空提示*/
							message : '用户名不能为空'
						},
						regexp: {/* 只需加此键值对，包含正则表达式，和提示 */
                            regexp: /^[a-zA-Z0-9_\.]+$/,
                            message: '只能是数字和字母_.'
                        },
						stringLength : {/*长度提示*/
							min : 6,
							max : 30,
							message : '用户名长度必须在6到30之间'
						}
					}
				},
				/*密码*/
				password: {
					message:'密码无效',
	                 validators: {
	                	 notEmpty: {
	                         message: '密码不能为空'
	                     },
	                     stringLength: {
	                         min: 6,
	                         max: 30,
	                         message: '用户名长度必须在6到30之间'
	                     }
	                 }
				}
			}
		});
	});
</script>
</html>