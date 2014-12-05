<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"content="width=device-width, initial-scale=1"/>
<title>丽人交友网-首页</title>
<link rel="stylesheet" href="/static/public/css/main.css" />
<link rel="stylesheet" href="/static/public/css/style.css" />
<script type="text/javascript" src="/static/public/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/static/public/js/jquery.validate.js"></script>
<script type="text/javascript" src="/static/public/js/common.js"></script>
<script type="text/javascript" src="/static/public/js/input.js"></script>
<script src='/static/public/js/me.js'></script>
<style type="text/css">
	body{
		font-size:12px;
	}
	a:hover{text-decoration:underline;color: #C20C0C;}
</style>
<script type="text/javascript">
	$().ready(function() {
	
		var $inputForm = $("#inputForm");
		// 表单验证
		$inputForm.validate({
			rules: {
				phoneNum: "required"
				,password: "required"
				,enpassword: "required" 
				/*,vCode: "required"*/
			}
		});
		
	});
	</script>
</head>

<body>
	<div class="header">
		<div class="logo">
			<!--<div class="logo_img" style="text-align: right;">
				<img src="images/liren.png" />
			</div>
			<div class="logo_img" style="margin-top: 17px;">
				<img src="images/true.png" />
			</div>-->
			<a href="/">
				<img src="/static/public/images/logo.png" />
			</a>
		</div>
		<div class="login">
			<input type="text" name="username" placeholder="登录ID/手机号" class="text"/>
			<input type="password" name="password" placeholder="密码" class="text"/>
			<input type="button" value="登录" class="submitBtn"/>
			<a href="#" style="margin-right: 30px;color: #999;text-decoration: underline;">忘记密码？</a>
		</div>
	</div>
	
	<div class="center">
		<!--<img src="images/chun.png" style="position: absolute;left: 15%;top: 50%;"/>-->
		<div class="regForm">
		<form id="inputForm" action="/register.jhtml" method="post" enctype="multipart/form-data">
			<table style="height: 100%; width: 80%; margin: 0px auto;">
				<tr>
					<td colspan="3" style="text-align: center; font-weight: bold; font-size: 20px;">
						59秒完成注册，下1秒享受幸福！
					</td>
				</tr>
				<tr>
					<td colspan="3" style="text-align: center;">
						<img src="/static/public/images/huang.png"/>
					</td>
				</tr>
				<tr>
					<td>手机号码：</td>
					<td><input type="text" name="phoneNum" class="login_text"></td>
					<td></td>
				</tr>
				<tr>
					<td>验证码：</td>
					<td><input type="text" name="vCode" class="login_text"></td>
					<td><a href="#">获取验证码</a></td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><input type="password" name="password" class="login_text"></td>
					<td></td>
				</tr>
				<tr>
					<td>确认密码：</td>
					<td><input type="password" name="enpassword" class="login_text"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="3" style="text-align: center;">
						<input type="submit" value="免费注册" class="freeReg"/>
					</td>
				</tr>
			</table>
			</form>
		</div>
    </div>
    
	<div class="footer" style="background-color: #790284;width: 100%;height: 90px;">
		<div style="color: #FFFFFF;font-family: 'microsoft yahei';text-align: center;line-height: 30px;">
			诚信：诚信会员验证&nbsp;&nbsp;&nbsp;严谨：专业的资深红娘队伍&nbsp;&nbsp;&nbsp;安全：真正实名制不泄露
		</div>
		<div style="color: #FFFFFF;font-family: 'microsoft yahei';text-align: center;line-height: 20px;">
			Copyright &copy; 2014-2014 版权所有：武汉市交友网信息技术有限公司
		</div>
		<div style="color: #FFFFFF;font-family: 'microsoft yahei';text-align: center;line-height: 30px;">
			客服热线：400-521-521（周一至周日：9:00-24:00）
		</div>
	</div>
</body>
</html>
