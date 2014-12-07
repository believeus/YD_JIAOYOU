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
		<title>丽人交友网-会员列表</title>
		<script type="text/javascript" src="/static/public/js/jquery.js"></script>
		<script type="text/javascript" src="/static/public/js/list.js"></script>
		<script type="text/javascript" src="/static/public/js/province.js"></script>
		<link rel="stylesheet" href="/static/public/css/style.css" />
		<link href="/static/public/css/common_s.css" rel="stylesheet" type="text/css" />
		<style type="text/css">
			a:hover{text-decoration:underline;color: #C20C0C;}
		</style>
	</head>
	<script type="text/javascript">
		$(function(){
			$("#height").val("${height}");
			$("#unitNature").val("${unitNature}");
			$("#career").val("${career}");
			$("#marriageCase").val("${marriageCase}");
			$("#degree").val("${degree}");
			$("#yearSalary").val("${yearSalary}");
			$("#asset").val("${asset}");
			$("#carCase").val("${carCase}");
			$("#houseCase").val("${houseCase}");
			$("#age_range").val("${age_range}");
			$("#height_range").val("${height_range}");
			var provinceCase=new ProvinceCase("province","city","${province}","${city}"); 
			provinceCase.init(provinceCase);
			
			$("#show_cond").click(function(){
				if($("#cond_list").css("display") == "block"){
					$("#cond_list").css("display","none");
					$("#show_cond").text("更多条件>>");
				}else{
					$("#cond_list").css("display","block");
					$("#show_cond").text("收起");
				}
			});
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
		
		<div class="list-main">
			<p class="list-position">
				<a href="#">主页</a>&gt;&gt;<a href="/memberList.jhtml">挑选</a>
			</p>
			<div class="list-main-people">
				<p class="list-title">
					选择您喜爱的那位
				</p>
				<div class="select-conditions">
				<form action="/baseSearch.jhtml" method="post">
					<input type="hidden" name="id" value="${sessionUser.id}"/>
					<span>
						性别:
						<select name="sex" id="sex" style="margin-left: 25px;">
							<option value="">不限</option>
							<option value="男">男</option>
							<option value="女">女</option>
						</select>
					</span>
					<span>
						年龄:
						<select name="age_range" id="age" style="margin-left: 25px;">
							<option value="">不限</option>
							<option value="18-26">18-26</option>
							<option value="27-36">27-36</option>
							<option value="37-46">37-46</option>
							<option value="47-56">47-56</option>
							<option value="57以上">57以上</option>
						</select>
					</span>
					<span>
						身高:
						<select name="height_range" id="height" style="margin-left: 25px;">
							<option value="">不限</option>
							<option value="150-159">150-159cm</option>
							<option value="160-169">160-169cm</option>
							<option value="170-179">170-179cm</option>
							<option value="180-189">180-189cm</option>
						</select>
					</span>
					<span>
						省
						<select id="province" name="province"></select>  
					</span>
					<span>
						市:
						<select id="city" name="city"></select>
					</span>
					<a id="show_cond" href="javascript:void(0);">更多条件&gt;&gt;</a>
					<!-- 更多 -->
					<div id="cond_list" style="margin-top: 10px; line-height: 30px;display:none;">
					<span>
						单位性质:
						<select name="unitNature">
							<option value="">不限</option>
							<option value="国企">国企</option>
							<option value="私企">私企</option>
							<option value="民营">民营</option>
							<option value="个体">个体</option>
							<option value="其它">其它</option>
						</select>
					</span>
					<span>
						职业类型:
						<select name="career">
							<option value="">不限</option>
							<option value="企业家">企业家</option>
							<option value="高级管理">高级管理</option>
							<option value="经理">经理</option>
							<option value="公务员">公务员</option>
							<option value="白领">白领</option>
							<option value="教师">教师</option>
							<option value="教授">教授</option>
							<option value="研究人员">研究人员</option>
							<option value="医生">医生</option>
							<option value="护士">护士</option>
							<option value="空姐">空姐</option>
							<option value="军人">军人</option>
							<option value="警察">警察</option>
							<option value="演员">演员</option>
							<option value="模特">模特</option>
							<option value="大学生">大学生</option>
							<option value="在校读研">在校读研</option>
							<option value="留学生">留学生</option>
							<option value="记者">记者</option>
							<option value="编辑">编辑</option>
							<option value="自由撰稿人">自由撰稿人</option>
							<option value="媒体人士">媒体人士</option>
							<option value="工程师">工程师</option>
							<option value="市场销售">市场销售</option>
							<option value="行政人员">行政人员</option>
							<option value="客服服务">客服服务</option>
							<option value="律师">律师</option>
							<option value="自营业主">自营业主</option>
							<option value="自由职业者">自由职业者</option>
							<option value="作家">作家</option>
							<option value="艺术家">艺术家</option>
							<option value="出租司机">出租司机</option>
							<option value="蓝领工人">蓝领工人</option>
							<option value="海员">海员</option>
							<option value="其他">其他</option>
						</select>
					</span>
					<span>
						婚姻状况:
						<select name="marriageCase">
							<option value="">不限</option>
						  <option value="未婚">未婚</option>
						  <option value="离异">离异</option>
						  <option value="丧偶">丧偶</option>
						</select>
					</span>
					<span>
						最高学历:
						<select name="degree">
						  <option value="">不限</option>
						  <option value="中专或相关学历">中专或相关学历</option>
						  <option value="大专">大专</option>
						  <option value="本科">本科</option>
						  <option value="双学士">双学士</option>
						  <option value="硕士">硕士</option>
						  <option value="博士">博士</option>
						  <option value="博士后">博士后</option>
						</select>
					</span>
					<br/>
					<span>
						目前年薪:
						<select name="yearSalary">
						  <option value="">不限</option>
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
						目前资产:
					  <select name="asset">
					  	  <option value="">不限</option>
						  <option value="50万以下">50万以下</option>
						  <option value="50万-80万">50万-80万</option>
						  <option value="80万-100万">80万-100万</option>
						  <option value="100万-200万">100万-200万</option>
						  <option value="200万-500万">200万-500万</option>
						  <option value="500万-1000万">500万-1000万</option>
						  <option value="1000万-3000万">1000万-3000万</option>
						  <option value="3000万-8000万">3000万-8000万</option>
						  <option value="8000万-1亿">8000万-1亿</option>
						  <option value="1亿-2亿">1亿-2亿</option>
						  <option value="2亿-3亿">2亿-3亿</option>
						  <option value="3亿-5亿">3亿-5亿</option>
						  <option value="5亿-8亿">5亿-8亿</option>
						  <option value="8亿-10亿">8亿-10亿</option>
						  <option value="10亿-30亿">10亿-30亿</option>	
						  <option value="30亿-50亿">30亿-50亿</option>
						  <option value="60亿以上">60亿以上</option>
						</select>
					</span>
					<span>
						购车情况:
						 <select name="carCase">
						 	<option value="">不限</option>
						  <option value="暂时未购车">暂未购车</option>
						  <option value="已购车一辆">已购车一辆</option>
						  <option value="已购多辆车">已购多辆车</option>
						</select>
					</span>
					<span>
						购房情况:
						<select name="houseCase">
						  <option value="">不限</option>
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
					</div>
					<div style="text-align:center; margin-top: 10px;">
						<input type="submit" value="搜索" class="submitBtn">
					</div>
					</form>
				</div>
				<div class="list-content-parent" style="margin-top:20px;">
					<c:forEach items="${memberList}" var="list" varStatus="status">
						<div class="list-content" <c:if test="${(status.index+1)%4==0 }"> style="margin-right:0;"</c:if>>						
							<div class="list-content-img">
								<a href="/memberInfo.jhtml?id=${list.id }">
									<img src="${list.headerImg }" width="200px" height="205px"/>
								</a>
							</div>
							<div class="list-content-name">
								<a href="/memberInfo.jhtml?id=${list.id }">
									<span>${list.username }</span>&nbsp;&nbsp;<span>${list.age }</span>
								</a>
							</div>
						</div>
					</c:forEach>
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
