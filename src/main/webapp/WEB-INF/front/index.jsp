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
		background: url(/static/public/images/bg.jpg) no-repeat scroll #790284;
/* 		background: url(/static/public/images/bg.jpg) no-repeat scroll center top / 100% auto #790284; */
	    height: 100%;
	    position: relative;
	}
	a:hover{text-decoration:underline;color: #C20C0C;}
	.yzmBtn{
		background:#790284;
		border:1px solid #790284;
		color:#fff;
		border-radius:4px;
		padding: 2px 6px;
		cursor:pointer;
		font-size:12px;
	}
</style>
<script type="text/javascript">
function timeCountDown(obj,wait){
	if(wait == 0){
		$(obj).removeAttr("disabled");
		$(obj).val("免费获取验证码");
		$(obj).css({"background":"#790284","border":"1px solid #790284"});
		wait=60;
		}else{
		$(obj).attr("disabled","false");
		$(obj).val("("+wait+"秒后重新获取)");
		$(obj).css({"background":"#42B1DC","color":"#D6E9EF","border":"1px solid #42B1DC"});
		wait--;
		setTimeout(function(){
		timeCountDown(obj,wait);
		},1000)
	}
}
	$().ready(function() {
		//alert(window.screen.width);
		if(window.screen.width > 1440 || window.screen.width == 1920){
			$(".footer").css("position","fixed");
			$(".regForm").css({"margin":"-58px 0 0 134px"});
		}else if(window.screen.width == 1366){
			$(".center").css({"height":"565px"});
		}else if(window.screen.width == 1280){
			$(".center").css({"height":"560px"});
		}else if(window.screen.width == 1280 && window.screen.height == 800){
			$(".center").css({"height":"575px"});
		}
		
		//短信验证
		$(".yzmBtn").click(function(){
			if($("#inputForm").validate().element($("#phoneNum"))){
				timeCountDown(this,60);
				var phoneNumber=$("#phoneNum").val();
				$("#numberCode").next().text("");
				$(".yzmBtn").attr('disabled',"false");
				//将手机号码发送给webserivce,获取手机验证码
				$.get("/generateValidCode.jhtml", {phoneNum: phoneNumber},function(data){
					if(/[0-9]{4}/.test(data.returnCode)){
						$(".yzmBtn").attr('disabled',"true");
					}else{
						$(".yzmBtn").attr('disabled',"false");
						$("#numberCode").next().text("获取验证码失败,请重新获取").css("color","red");
					}
				},"json");
			}
		});
		
		var $inputForm = $("#inputForm");
		// 表单验证
		$inputForm.validate({
			rules: {
				phoneNum:{
					isMobile:true,
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
				,password:{
					required:true,
					minlength:3,
					maxlength:16
				} 
				,enpassword: {
				    required: true,
				    equalTo: "#password",
			    	minlength:3,
					maxlength:16
				   }
				,vCode:{
					required:true,
			        remote:{
			               url: "/validateNumberCode.jhtml",            
			               type: "get",
			               dataType: "json", 
			               data:{
			            	  vCode:function(){return $("#vCode").val();}
			               } 
		              } 
			     }
			},
			messages: {
				phoneNum:{remote:jQuery.format("已注册")}
			    ,veryCode:  {required:"请输入验证码",remote:jQuery.format("验证码错误")}
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

		var $loginForm = $("#loginForm");
		$loginForm.validate({
			rules: {
				LphoneNum: {
					isMobile:true,
					required:true
				}
				,Lpassword:{
					required:true,
					minlength:3,
					maxlength:16
				} 
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
							}else if(data.message=="0"){
								alert("用户名不存在!");
							}else if(data.message=="1"){
								alert("密码错误!");
							}
						}
					});
			}
		});
		$("#codeImg").click(function(){
			
			$("#codeImg").attr("src","/jpgCode.do?f="+new Date().getTime());
			
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
			<input type="password" name="Lpassword" id="Lpassword" placeholder="密码" class="text" maxlength="16"/>
			<input type="submit" value="登录" class="submitBtn"/>
			<a href="/findpassword.jhtml" style="margin-right: 30px;color: #999;text-decoration: underline;">忘记密码？</a>
		 </form>
		</div>
	</div>
	
	<div class="center">
		<!--<img src="images/chun.png" style="position: absolute;left: 15%;top: 50%;"/>-->
		<div class="regForm">
		<form id="inputForm" action="/register.jhtml" method="post" enctype="multipart/form-data">
			<table style="height: 100%; width: 90%; margin: 0px auto;">
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
					<td><input type="text" placeholder="请填写" name="phoneNum" id="phoneNum" class="login_text" onkeyup="value=this.value.replace(/\D+/g,'')" maxlength="11" minlegnth="11" /></td>
					<td></td>
				</tr>
				<tr>
					<td>验证码：</td>
					<td>
						<input id="vCode" type="text" name="vCode" placeholder="验证码" class="login_text" />
					</td>
					<td>
						<!-- <input type="button" class="yzmBtn" value="获取验证码" /> -->
						<img src="/jpgCode.do" id="codeImg" />
					</td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><input type="password" placeholder="密码" name="password" id="password" class="login_text" style="font-size: 13px;" maxlength="16" /></td>
					<td></td>
				</tr>
				<tr>
					<td>确认密码：</td>
					<td colspan="2">
					<input type="password" placeholder="确认密码" name="enpassword" class="login_text" style="font-size: 13px;" maxlength="16" /></td>
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
