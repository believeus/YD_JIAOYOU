<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>丽人交友网-注册</title>
    <meta content="target-densitydpi=get-target-densitydpi,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,width=device-width, user-scalable=no" name="viewport">
    <meta content="no" name="apple-touch-fullscreen">
	<meta name="format-detection" content="telephone=no">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
    <link href="/static/public/css/app_css.css" rel="stylesheet"/>
    <script type="text/javascript" src="/static/public/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
    	$(function(){
    		$("#msg").delay(1500).fadeOut("fast");
    		$("#subBtn").click(function(){
    			if($("#phoneNum").val() == ""){
        			$("#msg2").text("请输入手机号码");
    		    	$("#msg2").css("display","block");
    		    	$("#msg2").delay(1500).fadeOut("fast");
    		    	return false;
        		}else if(!$("#phoneNum").val().match(/^1[3|4|5|8][0-9]\d{4,8}$/)){
	      	    	  $("#msg2").text("请正确输入手机号");
	    	    	  $("#msg2").css("display","block");
	    	    	  $("#msg2").delay(1500).fadeOut("fast");
	    	    	  return false;
    	      	}else if($("#password").val() == ""){
        			$("#msg2").text("请输入密码");
    		    	$("#msg2").css("display","block");
    		    	$("#msg2").delay(1500).fadeOut("fast");
    		    	return false;
        		}else if($("#enpassword").val() == ""){
        			$("#msg2").text("请输入确认密码");
    		    	$("#msg2").css("display","block");
    		    	$("#msg2").delay(1500).fadeOut("fast");
    		    	return false;
        		}else if($("#enpassword").val() != $("#password").val()){
        			$("#msg2").text("两次密码不一致");
    		    	$("#msg2").css("display","block");
    		    	$("#msg2").delay(1500).fadeOut("fast");
    		    	return false;
        		}else{
        			location.href="/perfectInfo.jhtml";
        		}
    		});
    		
    		$("#phoneNum").blur(function(){
    	    	if($("#phoneNum").val().match(/^1[3|4|5|8][0-9]\d{4,8}$/)){
    		    	  var url="/app/ajaxPhone.jhtml?phoneNum="+$("#phoneNum").val();
    		    	  $.post(url,function(data){
    		    		  if(data=="exist"){
    		    			  $("#msg2").text("手机号已注册");
    		    	    	  $("#msg2").css("display","block");
    		    	    	  $("#msg2").delay(1500).fadeOut("fast"); 
    		    	    	  //$("#phoneNum").val("");
    		    		  }
    		    	  });

    			  }
   	       });
    		$("#enpassword").blur(function(){
    			if($("#enpassword").val() != $("#password").val()){
        			$("#msg2").text("两次密码不一致");
    		    	$("#msg2").css("display","block");
    		    	$("#msg2").delay(1500).fadeOut("fast");
    		    	return false;
        		}
    		});
    	});
    </script>
  </head>
  
  <body>
   	<div class="liren-header">
   		<img src="/static/public/images/liren.png" />
   	</div>
   	<div class="liren-main">
   		<form id="inputForm" action="/register.jhtml" method="post">
   			<input type="text" id="phoneNum" name="phoneNum" placeholder="请输入手机号码"/>
   			<!-- <input type="text" name="" placeholder="请输入验证码"/> -->
   			<input type="password" id="password" name="password" placeholder="请输入密码"/>
   			<input type="password" id="enpassword" name="enpassword" placeholder="请输入确认密码"/>
   			<input id="subBtn" type="submit" value="免费注册" class="subBtn">
   			<input type="button" value="已有账号，前往登陆" class="subBtn" onclick="location.href='/login.jhtml'">
   		</form>
   	</div>
   	<div id="msg2"></div>
   	<div class="liren-footer">
   		&copy;丽人交友网
   	</div>
  </body>
</html>
