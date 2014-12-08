<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>​
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>后台登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		body {
			margin-left: 0px;
			margin-top: 0px;
			margin-right: 0px;
			margin-bottom: 0px;
			background-color: #016aa9;
			overflow:hidden;
			background: url("/static/public/images/backbg.jpg") no-repeat scroll center top / 100% auto #fefefe;
		}
		.STYLE1 {
			color: #000000;
			font-size: 12px;
		}
	</style>
  </head>
  
  <body style="overflow-y: hidden;background: url(/static/public/images/backbg1.jpg);">
    <!-- Begin Name:wuqiwei 此处必须加：不加验证之后就不能表单提交了,所以如果已经验证直接跳转到/admin/manager.jhtml页面 -->
     <shiro:authenticated>
      <script type="text/javascript">
        window.location.href ="/admin/manager.jhtml";
      </script>
	</shiro:authenticated>
	<!-- End Name:wuqiwei 此处必须加：不加验证之后就不能表单提交了,所以如果已经验证直接跳转到/admin/manager.jhtml页面 -->
	
	<div class="center" style="width: 100%; height: 1000px;margin: 0 auto;">
		<div style="background-color: #d9e1f4;height: 39px;left: 50%;margin-left: -300px;margin-top: -100px;position: absolute;top: 50%;width: 600px;">
			<form action="/admin/login.jhtml" method="post">
				<div style="float: left;border: 1px solid #A8AFB7;width: 35px;height: 37px;">
					<img src="/static/public/images/user.png" style="width: 20px;height: 20px;margin: 8px 0px 0px 7px;" />
				</div>
				<div style="float: left;">
					<input type="text" name="username" id="username" placeholder="用户名" style="width: 130px;height: 38px;border: none;text-indent: 10px;" />
				</div>
				<div style="float: left;border: 1px solid #A8AFB7;width: 35px;height: 37px;">
					<img src="/static/public/images/lock.png" style="width: 15px;height: 20px;margin: 8px 0px 0px 10px;" />
				</div>
				<div style="float: left;">
					<input type="password" name="password" id="password" placeholder="密码" style="width: 130px;height: 38px;border: none;text-indent: 10px;" />
				</div>
				<div style="margin-left: 141px;">
					<input type="submit"  value="登陆" style="float: left;width: 125px;height: 39px;" />
				</div>
			</form>
		</div>
    </div>
  </body>
</html>
