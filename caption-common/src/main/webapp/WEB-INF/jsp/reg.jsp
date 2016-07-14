<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<!-- 表单验证 -->
<link rel="stylesheet" href="http://libs.useso.com/js/font-awesome/4.2.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="${baseurl}/caption-common/js/Bootstrup_jQuery_validate_form/vendor/bootstrap/css/bootstrap.css"/>
<link rel="stylesheet" href="${baseurl}/caption-common/js/Bootstrup_jQuery_validate_form/dist/css/formValidation.css"/>
<link rel="stylesheet" type="text/css" href="${baseurl}/caption-common/js/Bootstrup_jQuery_validate_form/css/default.css">
<!-- 表单验证 -->

<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<form id="login_from" method="post" action="${baseurl}/caption-common/doReg.action"  class="form-horizontal">
					<fieldset>
						<div class="form-group">
							<label class="col-lg-3 control-label">用户名</label>
							<div class="col-lg-5">
								<input type="text" class="form-control" name="username" />
							</div>
						</div>
					</fieldset>
					<fieldset>
						<div class="form-group">
							<label class="col-lg-3 control-label">Password</label>
							<div class="col-lg-5">
								<input type="password" class="form-control" name="password" />
	                        </div>
		              	</div>
		              	<div class="form-group">
							<label class="col-lg-3 control-label">重复密码</label>
							<div class="col-lg-5">
								<input type="password" class="form-control" name="confirmPassword" />
	                        </div>
		              	</div>
					</fieldset>
					<div class="form-group">
						<span class="col-lg-9 col-lg-offset-3">
							<button type="submit" class="btn btn-primary">注册</button>
							<input class="btn btn-default" type="button" onclick="window.location='${baseurl}/caption-common/tologin.action'" value="登录">
						</span>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
	<script type="text/javascript" src="${baseurl}/caption-common/js/Bootstrup_jQuery_validate_form/vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${baseurl}/caption-common/js/Bootstrup_jQuery_validate_form/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${baseurl}/caption-common/js/Bootstrup_jQuery_validate_form/dist/js/formValidation.js"></script>
    <script type="text/javascript" src="${baseurl}/caption-common/js/Bootstrup_jQuery_validate_form/dist/js/framework/bootstrap.js"></script>
    <script type="text/javascript" src="${baseurl}/caption-common/js/Bootstrup_jQuery_validate_form/dist/js/language/zh_CN.js"></script>
	<script type="text/javascript">
		$(function(){
			$("input[name='username']").focus();
			$('#login_from').formValidation({
				message: '该项未验证',
				icon: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		        	username: {
		        		message: '用户名没有验证!',
		        		validators: {
		        			notEmpty: {
		        				message: '用户名不能为空!'
		        			},
		        			stringLength: {
		                        min: 6,
		                        max: 30,
		                        message: '用户名的长度必须在6-30个字符之间!'
		                    },
		                    regexp: {
		                    	regexp: /^[a-zA-Z0-9_\.]+$/,
		                    	message: '用户名只能由字母、数字、点和下划线组成!'
		                    }
		        		}
		        	},
		        	password: {
		                validators: {
		                    notEmpty: {
		                        message: '密码不能是空的!'
		                    }
		                }
		            },
		            confirmPassword: {
		                validators: {
		                    notEmpty: {
		                        message: '重复密码不能为空!'
		                    },
		                    identical: {
		                        field: 'password',
		                        message: '两次输入的密码不一致'
		                    }
		                }
		            }
		        }
			});
		});
	</script>
</html>