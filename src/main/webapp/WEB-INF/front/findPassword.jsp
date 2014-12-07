<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>丽人交友网-找回密码</title>
		<link rel="stylesheet" href="/static/public/css/style.css" />
		<link href="/static/public/css/common_s.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="/static/public/js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="/static/public/js/jquery.validate.js"></script>
		<script type="text/javascript" src="/static/public/js/common.js"></script>
		<script type="text/javascript" src="/static/public/js/input.js"></script>
		<style type="text/css">
			.list-main tr {
			    line-height: 50px;
			}
			.list-main tr {
				text-align:center;
			}
		</style>
	</head>
	<script type="text/javascript">
	$().ready(function() {
		
			var $findpasswordForm = $("#findpasswordForm");
			$findpasswordForm.validate({
				rules: {
					phoneNum:{
						required:true
					} 
					,email:{
						required:true,
						email:true
					} 
				},
				submitHandler:function(form){
					$.post("/mailSend.jhtml?"+$("#findpasswordForm").serialize(),function(data){
						window.location.href="/";
					});
				}
			});
			
			$("#phoneNum").change(function(){
				$.post("/ajaxMemberExist.jhtml?phoneNum="+$("#phoneNum").val(),function(data){
					if(data=="unExist"){
						$("#phoneNum").val("");
						alert("用户不存在请注册");
					}
				});
			});
		});
	</script>
	<body style="background: url(/static/public/images/bg2-1.jpg);overflow-x:hidden;">
		<div class="list-header">
			<div class="list-header-logo">
				<div class="logo-img-left">
					<div class="logoImg">
						<a href="/"><img src="/static/public/images/liren2.png" /></a>
					</div>
					<div class="logoImg" style="margin-top: 42px; margin-left: 20px;">
						<a href="/"><img src="/static/public/images/true2.png" /></a>
					</div>
				</div>
				<div class="hot-line">
					<span>
						<i style="width:28px;height:28px;background:url(/static/public/images/phone.png);display:inline-block;position: relative;top: 6px;"></i>
						丽人热线：400-8888-6666
					</span>
				</div>
			</div>
		</div>
		
		<div class="list-main" style="height:300px;text-align:center;padding-top: 100px;">
			<div style="padding-left: 311px;">
				<h2 style="text-align:left;">忘记了我的密码？</h2>
				<p style="width:500px;line-height: 22px;text-align: left;">
					首先感谢您访问交友网，如果您忘记了密码，请在下面输入您的用户名（手机号），我们会将修改密码的网址发送到您的邮箱，那么您就可自行修改密码。如果您还不是交友网会员，请先在这里&nbsp;&nbsp;&nbsp;<a href="/" style="color: #6f165d;font-family: 宋体;font-weight: bold;">注册>></a>
				</p>
			</div>
			<form action="/mailSend.jhtml" method="post" id="findpasswordForm">
				<table style="margin: 0px auto;">
					<tr>
						<td style="text-align: left;width: 80px;"><span style="font-size: 20px;">用户名:</span></td>
						<td style="width:300px;text-align: left;">
							<input name="phoneNum" id="phoneNum" type="text" placeholder="手机号"  onkeyup="value=this.value.replace(/\D+/g,'')" maxlength="11" minlegnth="11"  class="text">
						</td>
					</tr>
					<tr>
						<td style="text-align: left;width: 80px;"><span style="font-size: 20px;">邮箱:</span></td>
						<td style="width:300px;text-align: left;">
							<input type="text" name="email" id="email" placeholder="填写邮箱"  class="text">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input id="subminEmail" class="submitBtn" type="submit" value="确定" style="margin-right:20px;" >
							<input class="submitBtn" type="button" value="返回" style="margin-right: 95px;" onclick="javascript:window.history.back();">
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div class="horse">
			<img src="/static/public/images/horse.png" />
		</div>
		<div class="footer" style="background-color: #790284;width: 100%;height: 90px;">
			<div style="width: 1000px;height:90px;background: #790284;margin: 0 auto;">
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
		</div>
	</body>
</html>
