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
		background: url(/static/public/images/bg.jpg) no-repeat scroll center top / 100% auto #D3E9F6;
	    height: 100%;
	    position: relative;
	}
	a:hover{text-decoration:underline;color: #C20C0C;}
</style>
<script type="text/javascript">
	$().ready(function() {
		if(window.screen.width > 1440){
			$(".footer").css("position","fixed");
		}else if(window.screen.width == 1366){
			$(".center").css({"height":"565px"});
		}else if(window.screen.width == 1280){
			$(".center").css({"height":"560px"});
		}else if(window.screen.width == 1280 && window.screen.height == 800){
			$(".center").css({"height":"575px"});
		}
		
		var $inputForm = $("#inputForm");
		// 表单验证
		$inputForm.validate({
			rules: {
				phoneNum:{
					required:true,
					remote: {
					    url: "/ajaxComValidReg.jhtml",     //后台处理程序
					    type: "get",               //数据发送方式
					    dataType: "json",           //接受数据格式  
					    data: {                     //要传递的数据
					    	phoneNum: function() {
					            return $("#phoneNum").val();
					        }
					    }
					}
					
				} 
				,password: "required"
				,enpassword: {
				    required: true,
				    equalTo: "#password"
				   }
				/* ,vCode:{
					required:true,
			        remote:{
			               type:"POST",
			               url:"valCodeAction",            
			               data:{
			            	  vCode:function(){return $("#vCode").val();}
			               } 
			              } 
			     } */
			},
			messages: {
				phoneNum:{remote:jQuery.format("已注册")}
			    /*  ,veryCode:  {required:"请输入验证码",remote:jQuery.format("验证码错误")} */
			 }
			,submitHandler:function(form){
	    		$.ajax({
	    			url: "/register.jhtml",
	    			type: "get",
	    			data: {
	    				phoneNum:$("#phoneNum").val(),
	    				password:$("#password").val(),
	    				vCode:$("vCode").val()
	    				},
	    			dataType: "json",
	    			cache: false,
	    			success: function(data) {
	    					// 如果注册成功，则进行跳转
	    					if(data.message=="success"){
	    						window.location.href="/perfectInfo.jhtml";
	    					}else{
	    						alert(data.message);
	    					}
	    				}
	    			});
	        }    
		});

		/* // 用户名验证。
		$("#phoneNum").change(function(){
			$.ajax({
				url: "/ajaxComValidReg.jhtml",
				type: "get",
				data: {
					phoneNum:$(this).val()
					},
				dataType: "json",
				cache: false,
				success: function(data) {
						// 如果注册成功，则进行跳转
						if(data.message!="success"){
							$("#phoneNum").val("");
							alert(data.message);
						}
					}
				});
		}); */
		
		
		var $loginForm = $("#loginForm");
		$loginForm.validate({
			rules: {
				LphoneNum: "required"
				,Lpassword: "required"
			},
			submitHandler:function(form){
				$.ajax({
					url: "/login.jhtml",
					type: "get",
					data: {
						phoneNum:$("#LphoneNum").val(),
						password:$("#Lpassword").val()
						},
					dataType: "json",
					cache: false,
					success: function(data) {
							// 如果注册成功，则进行跳转
							if(data.message=="success"){
								window.location.href="/perfectInfo.jhtml";
							}else{
								alert(data.message);
							}
						}
					});
			}
		});
		
	});
	
	</script>
</head>

<body >
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
		  <form id="loginForm" action="" method="post">
			<input type="text" name="LphoneNum" id="LphoneNum" placeholder="手机号" class="text" onkeyup="value=this.value.replace(/\D+/g,'')" maxlength="11" minlegnth="11"/>
			<input type="password" name="Lpassword" id="Lpassword" placeholder="密码" class="text"/>
			<input type="submit" value="登录" class="submitBtn"/>
			<a href="/findpassword.jhtml" style="margin-right: 30px;color: #999;text-decoration: underline;">忘记密码？</a>
		 </form>
		</div>
	</div>
	
	<div class="center">
		<!--<img src="images/chun.png" style="position: absolute;left: 15%;top: 50%;"/>-->
		<div class="regForm">
		<form id="inputForm" action="/register.jhtml" method="post" enctype="multipart/form-data">
			<table style="height: 100%; width: 80%; margin: 0px auto;">
				<tr>
					<td colspan="3" style="text-align: center; font-weight: bold; font-size: 20px;line-height:30px;">
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
					<td><input type="text" placeholder="请填写" name="phoneNum" id="phoneNum" class="login_text" onkeyup="value=this.value.replace(/\D+/g,'')" maxlength="11" minlegnth="11"></td>
					<td></td>
				</tr>
				<tr>
					<td>验证码：</td>
					<td><input type="text" name="vCode" class="login_text"><a href="#" style="font-size:12px;">获取验证码</a></td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><input type="password" placeholder="密码" name="password" id="password" class="login_text" style="font-size: 13px;"></td>
					<td></td>
				</tr>
				<tr>
					<td>确认密码：</td>
					<td colspan="2">
					<input type="password" placeholder="确认密码" name="enpassword" class="login_text" style="font-size: 13px;"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="3" style="text-align: center;">
						<input type="submit" value="免费注册" class="freeReg" style="margin-top: 10px;"/>
					</td>
				</tr>
			</table>
			</form>
		</div>
    </div>
    
	<div class="footer" style="background-color: #790284;width: 100%;height: 80px;position:static;bottom:0;">
		<div style="color: #FFFFFF;font-family: 'microsoft yahei';text-align: center;line-height: 20px;padding-top: 10px;">
			诚信：诚信会员验证&nbsp;&nbsp;&nbsp;严谨：专业的资深红娘队伍&nbsp;&nbsp;&nbsp;安全：真正实名制不泄露
		</div>
		<div style="color: #FFFFFF;font-family: 'microsoft yahei';text-align: center;line-height: 20px;">
			Copyright &copy; 2014-2014 版权所有：武汉市交友网信息技术有限公司
		</div>
		<div style="color: #FFFFFF;font-family: 'microsoft yahei';text-align: center;line-height: 20px;">
			客服热线：400-521-521（周一至周日：9:00-24:00）
		</div>
	</div>
</body>
</html>
