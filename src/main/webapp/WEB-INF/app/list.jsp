<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>丽人交友网-会员列表</title>
    <meta content="target-densitydpi=get-target-densitydpi,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,width=device-width, user-scalable=no" name="viewport">
    <meta content="no" name="apple-touch-fullscreen">
	<meta name="format-detection" content="telephone=no">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
    <link href="/static/public/css/app_css.css" rel="stylesheet"/>
    <style type="text/css">
    	
    </style>
  </head>
  
  <body>
   	<div class="liren-header">
   		<img src="/static/public/images/liren.png" />
   	</div>
   	<div class="liren-main">
   		<form action="/perfectInfo.jhtml" method="post">
   			<input type="text" placeholder="请输入关键字">
   			<input type="submit" value="搜索" class="subBtn">
   		</form>
   		<div class="liren-list">
   			<div class="liren-list-main">
   				<div class="liren-list-main-img">
   					<a href="/memberInfo.jhtml"><img src="/static/public/images/003.png" /></a>
   				</div>
   				<div class="liren-list-main-name">
   					<a href="/memberInfo.jhtml">昵称：张三</a><br/>
   					<a href="/memberInfo.jhtml">年龄：23</a>
				</div>
   			</div>
   			<div class="liren-list-main">
   				<div class="liren-list-main-img">
   					<a href="/memberInfo.jhtml"><img src="/static/public/images/003.png" /></a>
   				</div>
   				<div class="liren-list-main-name">
   					<a href="/memberInfo.jhtml">昵称：张三</a><br/>
   					<a href="/memberInfo.jhtml">年龄：23</a>
				</div>
   			</div>
   			<div class="liren-list-main">
   				<div class="liren-list-main-img">
   					<a href="/memberInfo.jhtml"><img src="/static/public/images/003.png" /></a>
   				</div>
   				<div class="liren-list-main-name">
   					<a href="/memberInfo.jhtml">昵称：张三</a><br/>
   					<a href="/memberInfo.jhtml">年龄：23</a>
				</div>
   			</div>
   			<div class="liren-list-main">
   				<div class="liren-list-main-img">
   					<a href="/memberInfo.jhtml"><img src="/static/public/images/003.png" /></a>
   				</div>
   				<div class="liren-list-main-name">
   					<a href="/memberInfo.jhtml">昵称：张三</a><br/>
   					<a href="/memberInfo.jhtml">年龄：23</a>
				</div>
   			</div>
   		</div>
   	</div>
   	<div class="liren-footer">
   		&copy;丽人交友网
   	</div>
  </body>
</html>
