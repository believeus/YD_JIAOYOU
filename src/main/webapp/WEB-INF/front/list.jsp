<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>丽人交友网-美女列表</title>
		<script type="text/javascript" src="/static/public/js/jquery.js"></script>
		<script type="text/javascript" src="/static/public/js/list.js"></script>
		<link rel="stylesheet" href="/static/public/css/style.css" />
		<link href="/static/public/css/common_s.css" rel="stylesheet" type="text/css" />
	</head>
	<script type="text/javascript">
		$(function(){
			$("#ageRange").val("${ageRange}");
			$("#yearSalary").val("${yearSalary}");
			$("#houseCase").val("${houseCase}");
			$("#unitNature").val("${unitNature}");
		});
	</script>
	<body style="background: url(/static/public/images/bg2-1.jpg);overflow-x:hidden;">
		<div class="list-header">
			<div class="list-header-logo">
				<div class="logo-img-left">
					<div class="logoImg">
						<a href="/">
							<img src="/static/public/images/liren2.png" />
						</a>
					</div>
					<div class="logoImg" style="margin-top: 42px; margin-left: 20px;">
						<a href="/">
							<img src="/static/public/images/true2.png" />
						</a>
					</div>
				</div>
				<div class="hot-line" style="width:350px;">
					<span>
						<i style="width:28px;height:28px;background:url(/static/public/images/phone.png);display:inline-block;position: relative;top: 6px;"></i>
						丽人热线：400-8888-6666
					</span>
					<a href="/logout.jhtml" style="color:red;font-size:13px;">[退出]</a>
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
					<form action="/search.jhtml" method="post">
					<span>
						性别:
						<label>男<input type="radio" name="sex" value="男" <c:if test="${sex=='男'}">checked="checked"</c:if> /></label>&nbsp;
						<label>女<input type="radio" name="sex" value="女" <c:if test="${sex=='女'}">checked="checked"</c:if> /></label>
					</span>
					<span>
						年龄:
						<select name="ageRange" id="ageRange">
							<option value="">--请选择--</option>
							<option value="18-26">18-26</option>
							<option value="27-36">27-36</option>
							<option value="37-46">37-46</option>
							<option value="47-56">47-56</option>
							<option value="57以上">57以上</option>
						</select>
					</span>
					<span>
						年薪:
						<select name="yearSalary" id="yearSalary">
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
					</span>
					<span>
						住房:
						<select name="houseCase" id="houseCase">
							<option value="">--请选择--</option>
							<option value="暂未购房">暂未购房</option>
							  <option value="已购一室一厅">已购一室一厅</option>
							  <option value="已购二室一厅">已购二室一厅</option>
							  <option value="已购二室二厅">已购二室二厅</option>
							  <option value="已购三室一厅">已购三室一厅</option>
							  <option value="已购三室二厅">已购三室二厅</option>
							  <option value="已购复式住房">已购复式住房</option>
							  <option value="已购别墅">已购别墅</option>
							  <option value="已购多套住房">已购多套住房</option>
							  <option value="与人合租">与人合租</option>
							  <option value="与父母同住">与父母同住</option>
							  <option value="住亲朋家">住亲朋家</option>
							  <option value="住单位房">住单位房</option>	
							  <option value="打算婚后购房">打算婚后购房</option>
						</select>
					</span>
					<span>
						工作性质:
						<select name="unitNature" id="unitNature">
							<option value="">--请选择--</option>
							<option value="国企">国企</option>
							<option value="私企">私企</option>
							<option value="民营">民营</option>
							<option value="个体">个体</option>
							<option value="其它">其它</option>
						</select>
					</span>
					<input type="submit" value="确定" class="submitBtn">
					</form>
				</div>
				<div class="list-content-parent">
					<c:forEach items="${memberList}" var="list" varStatus="status">
						<div class="list-content" <c:if test="${(status.index+1)%4==0 }"> style="margin-right:0;"</c:if>>						
							<div class="list-content-img">
								<a href="/memberInfo.jhtml?id=${list.id }">
									<img src="${list.artImage }" width="200px" height="205px"/>
								</a>
							</div>
							<div class="list-content-name">
								<a href="/memberInfo.jhtml?id=${list.id }">
									<span>${list.username }</span>&nbsp;&nbsp;<span>${list.age }</span>
								</a>
							</div>
						</div>
					</c:forEach>
					<!-- <div class="list-content">
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
					</div> -->
				</div>
				<form action="/memberList.jhtml" id="listForm">
					<jsp:include page="/WEB-INF/include/pagination.jsp" flush="true" />
				</form>
			</div>
		</div>
		<div class="horse">
			<img src="/static/public/images/horse.png" />
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
