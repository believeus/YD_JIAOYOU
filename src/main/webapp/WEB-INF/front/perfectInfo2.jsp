<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>丽人交友网-详细资料填写</title>
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
				nickName: "required"
				,yearSalary: "required"
				,houseCase: "houseCase"
				,unitNature: "required"
			}
		});
		
	});
</script>
</head>

<body>
	<div class="header" style="background-image: url(/static/public/images/daohang.png);width: 100%;height: 100px;padding-top:0;">
		<div style="float: left;margin: 20px 0.5% 20px 16%;">
			<a href="/"><img src="/static/public/images/liren2.png" /></a>
		</div>
		<div style="float: left;margin: 39px 0.9%;">
			<a href="/"><img src="/static/public/images/true2.png" /></a>
		</div>
		<div style="float: left;margin: 0 0 0 6%;">
			<form action="#" method="post">
				<div style="float: left;margin: 34px 3%;width: 32%;">
					<input style="width: 100%;height: 30px;border-style: none;border-radius: 2px;" 
						type="text" name="username"  id="username" placeholder="登录ID/手机号" />
				</div>
				<div style="float: left;margin: 34px 3%;width: 32%;">
					<input style="width: 100%;height: 30px;border-style: none;border-radius: 2px;" 
						type="password" name="password" id="password" placeholder="密码" />
				</div>
				<div style="float: left;margin: 35px 3%;width: 18%;">
					<input style="width: 100%;height: 30px;border-style: none;border-radius: 2px;color: #770284;cursor: pointer;" 
						type="submit" value="登 录"/>
				</div>
			</form>
		</div>
		<div style="float: left;line-height: 100px;">
			<a style="color: #FFFFFF;text-decoration: underline;" href="#">忘记密码？</a>
		</div>
	</div>
	
	<div class="center" style="width: 100%; height: auto;margin: 0 auto;background-image: url(/static/public/images/bg2-1.jpg);">
		<div class="" style="width: 1000px; height: 40px;margin: 0 auto;">
			<div style="float: right;font-size: 14px;line-height: 40px;">
				<a href="#" style="color: #790284;">完善资料</a>
			</div>
			<div style="color: #790284;float: right;font-size: 14px;line-height: 40px;">&nbsp;>>&nbsp;</div>
			<div style="float: right;font-size: 14px;line-height: 40px;">
				<a href="#" style="color: #790284;">主页</a>
			</div>
		</div>
		<div class="" style="width: 722px; height: 629px;margin: 0 auto;border: 12px solid #E0D7DA;background-image: url(/static/public/images/bg2-2.jpg);">
			<div style="font-size: 16px;text-align: center; margin-top: 108px;font-weight: bold;">我的资料</div>
			<form id="inputForm" action="/savePerfectInfo.jhtml" method="post" enctype="multipart/form-data">
				<input type="hidden" name="id" value="${member.id }"/>
				<div style="font-size: 14px;margin-top: 44px;margin-left: 35px;">
					昵&nbsp;称：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input style="width: 20%;height: 20px;border: 1px solid #A0A0A0;border-radius: 2px;" type="text" name="nickName"  id="nickName" />
				</div>
				<div style="font-size: 14px;margin-top: 28px;margin-left: 35px;">
					性&nbsp;别：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="sex" checked="checked"/>男
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio"  name="sex" />女
				</div>
				<div style="font-size: 14px;margin-top: 24px;margin-left: 35px;">
					年&nbsp;薪：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select style="width: 21%;height: 25px;border: 1px solid #A0A0A0;border-radius: 2px;" type="text" name="yearSalary"  id="yearSalary">
						  <option value="">--请选择--</option>
						  <option value="36000以下">36000以下</option>
						  <option value="3.6万-6万">3.6万-6万</option>
						  <option value="6万-9.6万">6万-9.6万</option>
						  <option value="9.6万-14.4万">9.6万-14.4万</option>
						  <option value="14.4万-24万">14.4万-24万</option>
						  <option value="24万-36万">24万-36万</option>
						  <option value="36万-60万">36万-60万</option>
						  <option value="60万-96万">60万-96万</option>
						  <option value="96万-120万">96万-120万</option>
						  <option value="120万-360万">120万-360万</option>
						  <option value="360万-600万">360万-600万</option>
						  <option value="600万-600万">600万-600万</option>
						  <option value="600万-1.2亿">600万-1.2亿</option>
						  <option value="1.2亿-24亿">1.2亿-24亿</option>
						  <option value="24亿-60亿">24亿-60亿</option>	
						  <option value="60亿以上">60亿以上</option>
					</select>
				</div>
				<div style="font-size: 14px;margin-top: 24px;margin-left: 35px;">
					住房状况：
					<select style="width: 21%;height: 25px;border: 1px solid #A0A0A0;border-radius: 2px;" type="text" name="houseCase"  id="houseCase">
						<option value="">--请选择--</option>
						<option value="暂时未购车">暂未购车</option>
				  		<option value="已购车一辆">已购车一辆</option>
				  		<option value="已购多辆车">已购多辆车</option>
					</select>
				</div>
				<div style="font-size: 14px;margin-top: 24px;margin-left: 35px;">
					单位性质：
					<select style="width: 21%;height: 25px;border: 1px solid #A0A0A0;border-radius: 2px;" type="text" name=unitNature  id="unitNature">
						<option value="">--请选择--</option>
						<option value="国企">国企</option>
						<option value="私企">私企</option>
						<option value="民营">民营</option>
						<option value="个体">个体</option>
						<option value="其它">其它</option>
					</select>
				</div>
				<div style="font-size: 14px;margin-top: 110px;margin-left: 430px;">
					<input style="width: 200px;height: 46px;border-style: none;border-radius: 2px;cursor: pointer;background-color: #790284;color: #FFFFFF;font-weight: bold;font-size: 14px；" 
						type="submit" value="完善资料"/>
				</div>
			</form>
		</div>
		<div class="" style="width: 80%; height: auto;margin: 0 auto;">
			<img src="/static/public/images/horse.png" />
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
