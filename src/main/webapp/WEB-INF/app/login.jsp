<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>丽人交友网-登陆</title>
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
        		}else{
        			var url="/app/ajaxPass.jhtml?phoneNum="+$("#phoneNum").val()+"&password="+$("#password").val();
     		    	  $.post(url,function(data){
     		    		  if(data=="unexist"){
     		    			  $("#msg2").text("密码错误");
     		    	    	  $("#msg2").css("display","block");
     		    	    	  $("#msg2").delay(1500).fadeOut("fast"); 
     		    		  }else{
    		    			  location.href="/perfectInfo.jhtml";
    		    		  }
     		    	  });
     		    	 return false;
        		}
    		});
    		$("#phoneNum").blur(function(){
    	    	if($("#phoneNum").val().match(/^1[3|4|5|8][0-9]\d{4,8}$/)){
    		    	  var url="/app/ajaxUser.jhtml?phoneNum="+$("#phoneNum").val();
    		    	  $.post(url,function(data){
    		    		  if(data=="unexist"){
    		    			  $("#msg2").text("手机号不存在");
    		    	    	  $("#msg2").css("display","block");
    		    	    	  $("#msg2").delay(1500).fadeOut("fast"); 
    		    		  }
    		    	  });
   			    }
   	       });
    	$("#password").blur(function(){
	    	  var url="/app/ajaxPass.jhtml?phoneNum="+$("#phoneNum").val()+"&password="+$("#password").val();
	    	  $.post(url,function(data){
	    		  if(data=="flase"){
	    			  $("#msg2").text("密码错误");
	    	    	  $("#msg2").css("display","block");
	    	    	  $("#msg2").delay(1500).fadeOut("fast"); 
	    		  }
	    	  });
   	       });
    	});
    </script>
  </head>
  
  <body>
   	<div class="liren-header">
   		<img src="/static/public/images/liren.png" />
   	</div>
   	<div class="liren-main">
   		<form id="inputForm" action="/perfectInfo.jhtml" method="post">
   			<input type="text" id="phoneNum" name="phoneNum" placeholder="请输入手机号码"/>
   			<input type="password" id="password" name="password" placeholder="请输入密码"/>
   			<input id="subBtn" type="submit" value="登陆" class="subBtn">
   			<input type="button" value="忘记密码，前往找回" class="subBtn" onclick="location.href=''">
   		</form>
   	</div>
   	<div id="msg2"></div>
   	<div class="liren-footer">
   		&copy;丽人交友网
   	</div>
  </body>
</html>
