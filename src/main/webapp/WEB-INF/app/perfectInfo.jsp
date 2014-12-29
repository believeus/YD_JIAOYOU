<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>丽人交友网-完善资料</title>
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
   		});
    </script>
  </head>
  
  <body>
   	<div class="liren-header">
   		<img src="/static/public/images/liren.png" />
   	</div>
   	<div class="liren-main">
   		<form action="/savePerfectInfo.jhtml" method="post">
   			<h3>基本资料</h3>
   			<input type="text" name="nickName" placeholder="请输入昵称（必填）"/>
   			<input type="text" name="age" placeholder="请输入年龄（必填）"/>
   			<select name="sex">
   				<option value="">请选择性别（必填）</option>
   				<option value="boy">男</option>
   				<option value="girl">女</option>
   			</select>
   			<select name="unitNature" >
				<option value="">请选择工作性质（必填）</option>
				<option value="国企">国企</option>
				<option value="私企">私企</option>
				<option value="民营">民营</option>
				<option value="个体">个体</option>
				<option value="其它">其它</option>
			</select>
			<select name="houseCase">
			  <option value="">请选择购房情况（必填）</option>
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
			<select name="carCase">
			  <option value="">请选择购车情况（必填）</option>
			  <option value="暂时未购车">暂未购车</option>
			  <option value="已购车一辆">已购车一辆</option>
			  <option value="已购多辆车">已购多辆车</option>
			</select>
			<select name="marriageCase">
			  <option value="">请选择婚姻状况（必填）</option>
			  <option value="未婚">未婚</option>
			  <option value="离异">离异</option>
			  <option value="丧偶">丧偶</option>
			</select>
			<select name="career" id="career">
			 	<option value="">请选择职业类型（可不填）</option>
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
			<select name="height">
			    <option value="">请选择身高（可不填）</option>
				<option value="150">150cm</option>
				<option value="151">151cm</option>
				<option value="152">152cm</option>
				<option value="153">153cm</option>
				<option value="154">154cm</option>
				<option value="155">155cm</option>
				<option value="156">156cm</option>
				<option value="157">157cm</option>
				<option value="158">158cm</option>
				<option value="159">159cm</option>
				<option value="160">160cm</option>
				<option value="161">161cm</option>
				<option value="162">162cm</option>
				<option value="163">163cm</option>
				<option value="164">164cm</option>
				<option value="165">165cm</option>
				<option value="166">166cm</option>
				<option value="167">167cm</option>
				<option value="168">168cm</option>
				<option value="169">169cm</option>
				<option value="170">170cm</option>
				<option value="171">171cm</option>
				<option value="172">172cm</option>
				<option value="173">173cm</option>
				<option value="174">174cm</option>
				<option value="175">175cm</option>
				<option value="176">176cm</option>
				<option value="177">177cm</option>
				<option value="178">178cm</option>
				<option value="179">179cm</option>
				<option value="180">180cm</option>
				<option value="180">180cm以上</option>
			</select>
			<select name="degree">
			  <option value="">请选择最高学历（可不填）</option>
			  <option value="中专或相关学历">中专或相关学历</option>
			  <option value="大专">大专</option>
			  <option value="本科">本科</option>
			  <option value="双学士">双学士</option>
			  <option value="硕士">硕士</option>
			  <option value="博士">博士</option>
			  <option value="博士后">博士后</option>
			</select>
			<select name="yearSalary">
			  <option value="">请选择年薪（可不填）</option>
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
			<select name="asset">
			  <option value="">请选择目前资产（可不填）</option>
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
			<h3>账号信息</h3>
			<input type="text" name="email" placeholder="请输入邮箱（可不填）"/>
			<input type="text" name="username" placeholder="请输入真实姓名（可不填）"/>
			<input type="text" name="idCard" placeholder="请输入身份证号（可不填）"/>
			<input type="text" name="province" placeholder="请输入常驻地址（可不填）"/>
			<h3>上传照片</h3>
   			<div class="liren-imgs"><span>头像：</span><input type="file" name="headerImg1"/></div>
   			<div class="liren-imgs"><span>艺术照：</span><input type="file" name="artImage1"/></div>
   			<div class="liren-imgs"><span>生活照：</span><input type="file" name="lifeImage1"/></div>
   			<div class="liren-imgs"><span>工作照：</span><input type="file" name="workImage1"/></div>
   			<input id="subBtn" type="submit" value="完善资料" class="subBtn">
   		</form>
   		<div class="liren-footer">
	   		&copy;丽人交友网
	   	</div>
   	</div>
  </body>
</html>
