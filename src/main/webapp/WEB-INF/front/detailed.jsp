<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>丽人交友网-详细资料</title>
<link rel="stylesheet" href="css/main.css" />
<link rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script src='js/me.js'></script>
<style type="text/css">
	body{
		font-size:12px;
	}
	a:hover{text-decoration:underline;color: #C20C0C;}
</style>
</head>

<body>
	<div class="header" style="background-image: url(images/daohang.png);width: 100%;height: 100px;">
		<div style="float: left;margin: 20px 0.5% 20px 16%;">
			<a href="#"><img src="images/liren2.png" /></a>
		</div>
		<div style="float: left;margin: 39px 0.9%;">
			<a href="#"><img src="images/true2.png" /></a>
		</div>
		<div style="float: left;margin: 35px 10px 0 15%;">
			<img src="images/phone.png" />
		</div>
		<div style="float: left;line-height: 96px;font-size: 18px;font-weight: bold;color: #FFFFFF;">
			丽人热线：400-8888-6666
		</div>
	</div>
	
	<div class="center" style="width: 100%; height: auto;margin: 0 auto;background-image: url(images/bg2-1.jpg);">
		<div class="" style="width: 65%; height: 40px;margin: 0 auto;">
			<div style="float: right;font-size: 14px;line-height: 40px;">
				<a href="#" style="color: #790284;">当前页</a>
			</div>
			<div style="color: #790284;float: right;font-size: 14px;line-height: 40px;">&nbsp;>>&nbsp;</div>
			<div style="float: right;font-size: 14px;line-height: 40px;">
				<a href="#" style="color: #790284;">挑选</a>
			</div>
			<div style="color: #790284;float: right;font-size: 14px;line-height: 40px;">&nbsp;>>&nbsp;</div>
			<div style="float: right;font-size: 14px;line-height: 40px;">
				<a href="#" style="color: #790284;">主页</a>
			</div>
		</div>
		<div class="" style="width: 65%; height: 650px;margin: 0 auto;border: 6px solid #E0D7DA;">
			<div style="width: 100%;height: 300px;margin: 0 auto;">
				<div style="font-size: 18px;font-weight: bold;color: #790284;margin: 10px 0 5px 3%;">小雯的资料</div>
				<div style="width: 94%;border: 1px dashed #E0D7DA;margin: 0 0 0 3%;"></div>
				<div style="border: 2px solid #790284;float: left;margin: 20px 8% 20px 3%;">
					<img style="padding: 15px;" src="images/010.png" />
				</div>
				<div style="margin-top: 5px;width: 60%;float: left;">
					<div style="font-size: 18px;line-height: 48px;">昵称：小雯</div>
					<div style="width: 100%;border: 1px dashed #E0D7DA;"></div>
					<div style="font-size: 18px;line-height: 48px;">年龄：20岁</div>
					<div style="width: 100%;border: 1px dashed #E0D7DA;"></div>
					<div style="font-size: 18px;line-height: 48px;">月薪状况：3000-6000元</div>
					<div style="width: 100%;border: 1px dashed #E0D7DA;"></div>
					<div style="font-size: 18px;line-height: 48px;">住房状况：已购3套</div>
					<div style="width: 100%;border: 1px dashed #E0D7DA;"></div>
					<div style="font-size: 18px;line-height: 48px;">工作性质：国有企业</div>
					<div style="width: 100%;border: 1px dashed #E0D7DA;"></div>
				</div>
			</div>
			
			<div style="width: 100%;height: 300px;margin: 0 auto;">
				<div style="font-size: 18px;font-weight: bold;color: #790284;margin: 30px 0 5px 3%;">生活特写</div>
				<div style="width: 94%;border: 1px dashed #E0D7DA;margin: 0 0 0 3%;"></div>
				<div style="margin: 0 auto;">
					<div style="float: left;margin: 20px 3% 20px 3%;">
						<img src="images/005.png" />
					</div>
					<div style="float: left;margin: 20px 3% 20px 3%;">
						<img src="images/006.png" />
					</div>
					<div style="float: left;margin: 20px 3% 20px 3%;">
						<img src="images/007.png" />
					</div>
				</div>
			</div>
		</div>
		<div class="" style="width: 80%; height: auto;margin: 0 auto;">
			<img src="images/horse.png" />
		</div>
    </div>
    
	<div class="footer" style="background-color: #790284;width: 100%;height: 90px;">
		<div style="color: #FFFFFF;text-align: center;line-height: 30px;">
			诚信：诚信会员验证&nbsp;&nbsp;&nbsp;严谨：专业的资深红娘队伍&nbsp;&nbsp;&nbsp;安全：真正实名制不泄露
		</div>
		<div style="color: #FFFFFF;text-align: center;line-height: 20px;">
			Copyright &copy; 2014-2014 版权所有：武汉市交友网信息技术有限公司
		</div>
		<div style="color: #FFFFFF;text-align: center;line-height: 30px;">
			客服热线：400-521-521（周一至周日：9:00-24:00）
		</div>
	</div>
</body>
</html>
