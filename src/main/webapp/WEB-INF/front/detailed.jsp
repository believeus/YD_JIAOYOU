<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>丽人交友网-详细资料</title>
<link rel="stylesheet" href="/static/public/css/main.css" />
<link rel="stylesheet" href="/static/public/css/style.css" />
<script type="text/javascript" src="/static/public/js/jquery-1.9.1.min.js"></script>
<script src='/static/public/js/me.js'></script>
<style type="text/css">
	body{
		font-size:12px;
	}
	a:hover{text-decoration:underline;color: #C20C0C;}
</style>
</head>

<body>
	<div class="header" style="background-image: url(/static/public/images/daohang.png);width: 100%;height: 100px;padding-top:0;position:static;">
		<div style="width: 1000px;margin: 0 auto;">
			<div style="float: left;margin: 20px auto;">
				<a href="/"><img src="/static/public/images/liren2.png" /></a>
			</div>
			<div style="float: left;margin: 39px 15px;">
				<a href="/"><img src="/static/public/images/true2.png" /></a>
			</div>
			<div class="hot-line" style="width:350px;">
				<div class="welcome_liren">
					<span style="color:#fff;">
						${fn:substring(member.nickName, 0, 6)}
						<c:if test="${fn:length(member.nickName) > 6 }">
		   					...
	   					</c:if>
					</span>&nbsp;&nbsp;您好，欢迎来到丽人！
					<a href="/logout.jhtml" style="color:#fff;font-size:13px;">[安全退出]</a>
				</div>
				<div style="width:350px;height:52px;">
					<span>
						<i style="width:28px;height:28px;background:url(/static/public/images/phone.png);display:inline-block;position: relative;top: 6px;"></i>
						丽人热线：400-8888-6666
					</span>
				</div>
			</div>
		</div>
	</div>
	
	<div class="center" style="width: 100%; height: auto;margin: 0 auto;background-image: url(/static/public/images/bg2-1.jpg);">
		<div class="" style="width: 900px; height: 40px;margin: 0 auto;">
			<p class="list-position" style="margin:0;height:40px;line-height:40px;">
				<a href="#">主页</a>&gt;&gt;<a href="/memberList.jhtml">挑选</a>&gt;&gt;<a href="/memberInfo.jhtml?id=${member.id }">当前页</a>
			</p>
		</div>
		<div class="" style="width: 900px; height: auto;margin: 0 auto;border: 6px solid #E0D7DA;">
			<div style="width: 900px;height: 300px;margin: 0 auto;">
				<div style="font-size: 18px;font-weight: bold;margin: 10px 25px 5px 25px;">
					<a href="#" style="color: #790284;">${member.username }的资料</a>
				</div>
				<div style="width: 845px;border: 1px dashed #E0D7DA;margin: 0 auto;"></div>
				<div style="border: 2px solid #790284;float: left;margin: 20px 60px 20px 25px;">
					<a href="#"><img style="padding: 15px;" src="${member.headerImg }?w=205&h=205" /></a>
				</div>
				<div style="margin-top: 5px;width: 545px;float: left;">
					<div style="font-size: 18px;line-height: 48px;"><span style="color:#999;">性别：</span>${member.sex }</div>
					<div style="width: 100%;border: 1px dashed #E0D7DA;"></div>
					<div style="font-size: 18px;line-height: 48px;"><span style="color:#999;">昵称：</span>${member.nickName }</div>
					<div style="width: 100%;border: 1px dashed #E0D7DA;"></div>
					<div style="font-size: 18px;line-height: 48px;"><span style="color:#999;">年龄：</span>${member.age }岁</div>
					<div style="width: 100%;border: 1px dashed #E0D7DA;"></div>
					<div style="font-size: 18px;line-height: 48px;"><span style="color:#999;">年薪状况：</span>${member.yearSalary }</div>
					<div style="width: 100%;border: 1px dashed #E0D7DA;"></div>
					<div style="font-size: 18px;line-height: 48px;"><span style="color:#999;">住房状况：</span>${member.houseCase }</div>
					<div style="width: 100%;border: 1px dashed #E0D7DA;"></div>
				</div>
			</div>
			<div style="">
				<div style="margin:22px 25px 0 25px;font-size: 20px;color: #790284;font-weight:bold;">基本资料</div>
				<div style="width: 845px;border: 1px dashed #E0D7DA;margin: 0 25px;"></div>
				<div style="font-size: 18px;line-height: 48px;margin: 0 25px;"><span style="color:#999;">婚姻状况：</span>${member.marriageCase }</div>
				<div style="width: 845px;border: 1px dashed #E0D7DA;margin: 0 25px;"></div>
				<div style="font-size: 18px;line-height: 48px;margin: 0 25px;"><span style="color:#999;">身高：</span>${member.height }cm</div>
				<div style="width: 845px;border: 1px dashed #E0D7DA;margin: 0 25px;"></div>
				<div style="font-size: 18px;line-height: 48px;margin: 0 25px;"><span style="color:#999;">最高学历：</span>${member.degree }</div>
				<div style="width: 845px;border: 1px dashed #E0D7DA;margin: 0 25px;"></div>
				<div style="font-size: 18px;line-height: 48px;margin: 0 25px;"><span style="color:#999;">目前资产：</span>${member.asset }</div>
				<div style="width: 845px;border: 1px dashed #E0D7DA;margin: 0 25px;"></div>
				<div style="font-size: 18px;line-height: 48px;margin: 0 25px;"><span style="color:#999;">购车情况：</span>${member.carCase }</div>
				<div style="width: 845px;border: 1px dashed #E0D7DA;margin: 0 25px;"></div>
				<div style="font-size: 18px;line-height: 48px;margin: 0 25px;"><span style="color:#999;">职业类型：</span>${member.career }</div>
				<div style="width: 845px;border: 1px dashed #E0D7DA;margin: 0 25px;"></div>
				<div style="font-size: 18px;line-height: 48px;margin: 0 25px;"><span style="color:#999;">工作性质：</span>${member.unitNature }</div>
				<div style="width: 845px;border: 1px dashed #E0D7DA;margin: 0 25px;"></div>
			</div>
			<div style="width: 900px;height: 300px;margin: 0 auto;">
				<div style="font-size: 18px;font-weight: bold;color: #790284;margin: 30px 25px 5px 25px;">
					<a href="#" style="color: #790284;">生活特写</a>
				</div>
				<div style="width: 845px;border: 1px dashed #E0D7DA;margin: 0 auto;"></div>
				<div style="width: 845px;margin: 0 auto;">
					<div style="float: left;margin: 20px 20px;">
						<a href="#"><img src="${member.artImage }?w=205&h=205" /></a>
					</div>
					<div style="float: left;margin: 20px 20px;">
						<a href="#"><img src="${member.lifeImage }?w=205&h=205" /></a>
					</div>
					<div style="float: left;margin: 20px 20px;">
						<a href="#"><img src="${member.workImage }?w=205&h=205" /></a>
					</div>
				</div>
			</div>
		</div>
		<div class="" style="width: 1000px; height: auto;margin: 30px auto 0px;">
			<img style="width: 1000px;" src="/static/public/images/horse.png" />
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
