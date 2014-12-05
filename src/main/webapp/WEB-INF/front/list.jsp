<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>丽人交友网-美女列表</title>
		<link rel="stylesheet" href="css/style.css" />
	</head>
	<body style="background: url(images/bg2-1.jpg);overflow-x:hidden;">
		<div class="list-header">
			<div class="list-header-logo">
				<div class="logo-img-left">
					<div class="logoImg">
						<img src="images/liren2.png" />
					</div>
					<div class="logoImg" style="margin-top: 42px; margin-left: 20px;">
						<img src="images/true2.png" />
					</div>
				</div>
				<div class="hot-line">
					<span>
						<i style="width:28px;height:28px;background:url(images/phone.png);display:inline-block;position: relative;top: 6px;"></i>
						丽人热线：400-8888-6666
					</span>
				</div>
			</div>
		</div>
		
		<div class="list-main">
			<p class="list-position">
				<a href="#">主页</a>&gt;&gt;<a href="#">挑选</a>
			</p>
			<div class="list-main-people">
				<p class="list-title">
					选择您喜爱的那位
				</p>
				<div class="select-conditions">
					<span>
						性别:
						<label>男<input type="radio" name="sex" value="boy"/></label>&nbsp;
						<label>女<input type="radio" name="sex" value="girl"/></label>
					</span>
					<span>
						年龄:
						<select name="">
							<option value="">18-26</option>
							<option value="">27-36</option>
							<option value="">37-46</option>
							<option value="">47-56</option>
							<option value="">57以上</option>
						</select>
					</span>
					<span>
						月薪:
						<select name="">
							<option value="">1000-2999</option>
							<option value="">3000-4999</option>
							<option value="">5000-7999</option>
							<option value="">8000-10000</option>
							<option value="">10000以上</option>
						</select>
					</span>
					<span>
						住房:
						<select name="">
							<option value="">已购房</option>
							<option value="">租房</option>
							<option value="">其它</option>
						</select>
					</span>
					<span>
						工作性质:
						<select name="">
							<option value="">国企</option>
							<option value="">私企</option>
							<option value="">民营</option>
							<option value="">个体</option>
							<option value="">其它</option>
						</select>
					</span>
				</div>
				<div class="list-content-parent">
					<div class="list-content">
						<div class="list-content-img">
							<a href="#">
								<img src="images/001.png" width="200px" height="205px"/>
							</a>
						</div>
						<div class="list-content-name">
							<a href="#">
								<span>小雯</span>&nbsp;&nbsp;<span>20</span>
							</a>
						</div>
					</div>
					<div class="list-content">
						<div class="list-content-img">
							<a href="#">
								<img src="images/002.png" width="200px" height="205px"/>
							</a>
						</div>
						<div class="list-content-name">
							<a href="#">
								<span>小雯</span>&nbsp;&nbsp;<span>20</span>
							</a>
						</div>
					</div>
					<div class="list-content">
						<div class="list-content-img">
							<a href="#">
								<img src="images/003.png" width="200px" height="205px"/>
							</a>
						</div>
						<div class="list-content-name">
							<a href="#">
								<span>小雯</span>&nbsp;&nbsp;<span>20</span>
							</a>
						</div>
					</div>
					<div class="list-content" style="margin-right: 0;">
						<div class="list-content-img">
							<a href="#">
								<img src="images/004.png" width="200px" height="205px"/>
							</a>
						</div>
						<div class="list-content-name">
							<a href="#">
								<span>小雯</span>&nbsp;&nbsp;<span>20</span>
							</a>
						</div>
					</div>
					<div class="list-content">
						<div class="list-content-img">
							<a href="#">
								<img src="images/005.png" width="200px" height="205px"/>
							</a>
						</div>
						<div class="list-content-name">
							<a href="#">
								<span>小雯</span>&nbsp;&nbsp;<span>20</span>
							</a>
						</div>
					</div>
					<div class="list-content">
						<div class="list-content-img">
							<a href="#">
								<img src="images/006.png" width="200px" height="205px"/>
							</a>
						</div>
						<div class="list-content-name">
							<a href="#">
								<span>小雯</span>&nbsp;&nbsp;<span>20</span>
							</a>
						</div>
					</div>
					<div class="list-content">
						<div class="list-content-img">
							<a href="#">
								<img src="images/007.png" width="200px" height="205px"/>
							</a>
						</div>
						<div class="list-content-name">
							<a href="#">
								<span>小雯</span>&nbsp;&nbsp;<span>20</span>
							</a>
						</div>
					</div>
					<div class="list-content" style="margin-right: 0;">
						<div class="list-content-img">
							<a href="#">
								<img src="images/008.png" width="200px" height="205px"/>
							</a>
						</div>
						<div class="list-content-name">
							<a href="#">
								<span>小雯</span>&nbsp;&nbsp;<span>20</span>
							</a>
						</div>
					</div>
					<div class="list-content">
						<div class="list-content-img">
							<a href="#">
								<img src="images/009.png" width="200px" height="205px"/>
							</a>
						</div>
						<div class="list-content-name">
							<a href="#">
								<span>小雯</span>&nbsp;&nbsp;<span>20</span>
							</a>
						</div>
					</div>
					<div class="list-content">
						<div class="list-content-img">
							<a href="#">
								<img src="images/010.png" width="200px" height="205px"/>
							</a>
						</div>
						<div class="list-content-name">
							<a href="#">
								<span>小雯</span>&nbsp;&nbsp;<span>20</span>
							</a>
						</div>
					</div>
					<div class="list-content">
						<div class="list-content-img">
							<a href="#">
								<img src="images/011.png" width="200px" height="205px"/>
							</a>
						</div>
						<div class="list-content-name">
							<a href="#">
								<span>小雯</span>&nbsp;&nbsp;<span>20</span>
							</a>
						</div>
					</div>
					<div class="list-content" style="margin-right: 0;">
						<div class="list-content-img">
							<a href="#">
								<img src="images/012.png" width="200px" height="205px"/>
							</a>
						</div>
						<div class="list-content-name">
							<a href="#">
								<span>小雯</span>&nbsp;&nbsp;<span>20</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="horse">
			<img src="images/horse.png" />
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
