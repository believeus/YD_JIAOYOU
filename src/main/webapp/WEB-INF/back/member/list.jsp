<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>会员列表 - Powered By believeus</title>
	<meta name="author" content="believeus Team" />
	<meta name="copyright" content="believeus" />
	<link href="/static/public/css/common_s.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/static/public/js/jquery.js"></script>
	<script type="text/javascript" src="/static/public/js/common.js"></script>
	<script type="text/javascript" src="/static/public/js/list.js"></script>
	<style type="text/css">
		table.list td {
		    font-size: 13px;
		}
	</style>
	<script type="text/javascript">
	$().ready(function() {
		
	});
	</script>

  </head>
  
  <body>
    <div class="path">
		<a href="/admin/manager.jhtml" target="_parent">首页</a> &raquo; 内容列表 <span>共${size}条记录</span>
	</div>
	<div>
		<div class="bar">
			<a href="/admin/member/add.jhtml" class="iconButton">
				<span class="addIcon">&nbsp;</span>添加
			</a>
		<div class="buttonWrap">
			<a href="javascript:;" id="deleteButton" class="iconButton disabled">
				<span class="deleteIcon">&nbsp;</span>删除
			</a>
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>刷新
				</a>
			</div>
		</div>
		<table id="listTable" class="list">
			<tr>
				<th>
					<a href="javascript:;" class="sort" name="id">昵称</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="id">姓名</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="title">职业类型</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="title">身份证</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="title">身高</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="title">婚姻情况</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="title">学历</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="top">手机号</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="top">年薪</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="top">资产</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="top">购车情况</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="top">购房情况</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="top">艺术照</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="top">生活照</a>
				</th>
				<th>
					<a href="#"  class="sort">操作</a>
				</th>
				
			</tr>
			<c:forEach var="member" items="${members}" varStatus="status">
				<tr>
					<td>
						${member.nickName}
					</td>
					<td>${member.username}</td>
					<td>
						${member.career}	
					</td>
					<td>
						${member.idCard}
					</td>
					<td>
					   ${member.height}
					</td>
					<td>
					   ${member.marriageCase}
					</td>
					<td>
					   ${member.degree}
					</td>
					<td>
					   ${member.phoneNum}
					</td>
					<td>
					   ${member.yearSalary}
					</td>
					<td>
					   ${member.asset}
					</td>
					<td>
					   ${member.carCase}
					</td>
					<td>
					   ${member.houseCase}
					</td>
					<td>
					   <img  src="/${member.artImage}?w=100&h=100"/>
					</td>
					<td>
					   <img  src="/${member.lifeImage}?w=100&h=100"/>
					</td>
					<td>
						<a href="/admin/member/edit.jhtml?memberId=${member.id}">[修改]</a>
						<a href="/admin/member/delete.jhtml?memberId=${member.id}">[刪除]</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<form action="/admin/news/list.jhtml" id="listForm">
			<jsp:include page="/WEB-INF/include/pagination.jsp" flush="true" />
		</form>
	</div>
  </body>
</html>
