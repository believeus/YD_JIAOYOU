<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>添加会员 - Powered By believeus</title>
	<meta name="author" content="believeus Team" />
	<meta name="copyright" content="believeus" />
	<link href="/static/public/css/common_s.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/static/public/js/jquery.js"></script>
	<script type="text/javascript" src="/static/public/js/jquery.validate.js"></script>
	<script type="text/javascript" src="/static/public/js/admin/ueditor1_2_6_2/ueditor.config.js"></script>
	<script type="text/javascript" src="/static/public/js/admin/ueditor1_2_6_2/ueditor.all.js"></script>
	<script type="text/javascript" src="/static/public/js/common.js"></script>
	<script type="text/javascript" src="/static/public/js/input.js"></script>
	<script type="text/javascript" src="/static/public/js/province.js"></script>
	<style type="text/css">
		table.input th {
		    font-size: 13px;
		}
	</style>
	<script type="text/javascript">
	$().ready(function() {
	
		var editor = new UE.ui.Editor();
	    editor.render('editor');
	    editor.addListener('contentchange',function(){
	        this.sync();
	        $('textarea').valid();
	    });
	    
	    var editor1 = new UE.ui.Editor();
	    editor1.render('editor1');
	    editor1.addListener('contentchange',function(){
	        this.sync();
	        $('#editor1').valid();
	    });
	
		var $inputForm = $("#inputForm");
		// 表单验证
		$inputForm.validate({
			rules: {
				nickName: "required"
				,age:{
					required:true,
					minlength:2,
					maxlength:2
				}
				,unitNature:"required"
				,houseCase:"required"
				,email:{
					required:true,
					email:true
				}
				,username:"required"
				,idCard:{
					required:true,
					minlength:18,
					idCardVali:true,
					remote: {
					    url: "/ajaxComValidIdCard.jhtml",     //后台处理程序
					    type: "get",               //数据发送方式
					    dataType: "json",           //接受数据格式  
					    data: {                     //要传递的数据
					    	idCard: function() {
					            return $("#idCard").val();
					        }
					    }
					}
				}
				,phoneNum:{
					isMobile:true,
					required:true,
					remote: {
					    url: "/ajaxMemberExistByPhoneNum.jhtml",     //后台处理程序
					    type: "get",               //数据发送方式
					    dataType: "json",           //接受数据格式  
					    data: {                     //要传递的数据
					    	phoneNum: function() {
					            return $("#phoneNum").val();
					        }
					    }
					}
					
				} 
				,province: "required"
				,city: "required"
				,marriageCase: "required"
				,height: "required"
				,degree: "required"
				,yearSalary: "required"
				,asset: "required"
				,carCase: "required"
				,headerImg1: "required"
				,artImage1: "required"
				,lifeImage1: "required"
				,workImage1: "required"
				,province: "required"
				,city: "required"
				,email: {
					required:true,
					email:true
				}
			}
			,messages: {
				phoneNum:{remote:jQuery.format("已使用")},
				idCard:{remote:jQuery.format("已使用")}
		 }
		});
		
		
		var provinceCase=new ProvinceCase("province","city","",""); 
		provinceCase.init(provinceCase);
	});
	
	</script>
  </head>
  
  <body>
    <div class="path">
		<a href="/admin/manager.jhtml" target="_parent">首页</a> &raquo; 添加会员
	</div>
	<form id="inputForm" action="/admin/member/save.jhtml" method="post" enctype="multipart/form-data">
		<table class="input">
			<tr>
				<th>
					真实姓名:
				</th>
				<td>
					<input name="username"/>
				</td>
			</tr>
			<tr>
				<th>
					昵称:
				</th>
				<td>
					<input name="nickName" />
				</td>
			</tr>
			<tr>
				<th>
					手机号:
				</th>
				<td>
					<input name="phoneNum" id="phoneNum"/>
				</td>
			</tr>
			<tr>
				<th>
					邮箱:
				</th>
				<td>
					<input name="email" id="email"/>
				</td>
			</tr>
			<tr>
				<th>
					工作性质:
				</th>
				<td>
					<select name="unitNature">
						<option value="国企">国企</option>
						<option value="私企">私企</option>
						<option value="民营">民营</option>
						<option value="个体">个体</option>
						<option value="其它">其它</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					职业类型:
				</th>
				<td>
					<select name="career">
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
				</td>
			</tr>
			<tr>
				<th>
					性别:
				</th>
				<td>
					男<input type="radio" value="男" name="sex" checked="checked"/> 女<input type="radio" value="女" name="sex"/>
				</td>
			</tr>
			<tr>
				<th>
					年龄:
				</th>
				<td>
					<input name="age" onkeyup="value=this.value.replace(/\D+/g,'')" maxlength="2" minlegnth="2"/>
				</td>
			</tr>
			<tr>
				<th>
					身份证号:
				</th>
				<td>
					<input name="idCard" id="idCard"/>
				</td>
			</tr>
			<tr>
				<th>
					身高:
				</th>
				<td>
					<select name="height">
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
				</td>
			</tr>
			<tr>
				<th>上传头像：</th>
				<td>
					<div>
						<span style="float:left">
							<div id="preview_wrapper" >    
						        <div id="preview_fake00" >    
						            <img id="preview00" onload="onPreviewLoad(this,190,120)" src="/static/public/images/bg.png"/>
						        </div>    
						    </div>    
						    <br/>    
						    <input class="selectImg" id="headerImg" type="file" name="headerImg1" style="width: 190px" title="请选择头像"  onchange="filename0.value=this.value;onUploadImgChange(this,100,100,'preview00','preview_fake00','preview_size_fake00');"/>  
						    <input type="hidden" id="filename00" name="filename00">
						    <br/>    
						    <img id="preview_size_fake00"/> 
						</span>
					</div>
				</td>
			</tr>
			<tr id="pathTr">
				<th>
					上传照片:
				</th>
				<td>
					<div>
						<span style="float:left">
							<div id="preview_wrapper">    
						        <div id="preview_fake0" >    
						            <img id="preview0" onload="onPreviewLoad(this,190,120)" src="/static/public/images/bg.png"/>
						        </div>    
						    </div>    
						    <br/>    
						    <input id="artImage" type="file" name="artImage1" style="width: 190px" onchange="filename0.value=this.value;onUploadImgChange(this,190,120,'preview0','preview_fake0','preview_size_fake0');"/>  
						    <input type="hidden" id="filename0" name="filename0">
						    <br/>    
						    <img id="preview_size_fake0"/> 
						</span>
					</div>
					<div>
						<span style="float:left">
							<div id="preview_wrapper">    
						        <div id="preview_fake1" >    
						            <img id="preview1" onload="onPreviewLoad(this,190,120)" src="/static/public/images/bg.png"/>
						        </div>    
						    </div>    
						    <br/>    
						    <input id="lifeImage1" type="file" name="lifeImage1" style="width: 190px" onchange="filename0.value=this.value;onUploadImgChange(this,190,120,'preview1','preview_fake1','preview_size_fake1');"/>  
						    <input type="hidden" id="filename1" name="filename1">
						    <br/>    
						    <img id="preview_size_fake1"/> 
						</span>
					</div>
					<div>
						<span style="float:left">
							<div id="preview_wrapper">    
						        <div id="preview_fake2" >    
						            <img id="preview2" onload="onPreviewLoad(this,190,120)" src="/static/public/images/bg.png"/>
						        </div>    
						    </div>    
						    <br/>    
						    <input id="workImage1" type="file" name="workImage1" style="width: 190px" onchange="filename0.value=this.value;onUploadImgChange(this,190,120,'preview2','preview_fake2','preview_size_fake2');"/>  
						    <input type="hidden" id="filename2" name="filename2">
						    <br/>    
						    <img id="preview_size_fake2"/> 
						</span>
					</div>
				</td>
				
			</tr>
			<tr>
			  <th>
				常驻地区:
			  </th>
			  <td>
				<select id="province" name="province">
				<option value="">--请选择--</option>
				</select>
				<select id="city" name="city"></select>
			  </td>
			</tr>
			<tr>
			  <th>
				婚姻情况:
			  </th>
			  <td>
				<select name="marriageCase">
				  <option value="未婚">未婚</option>
				  <option value="离异">离异</option>
				  <option value="丧偶">丧偶</option>
				</select>
			  </td>
			</tr>
			<tr>
			  <th>
				最高学历:
			  </th>
			  <td>
				<select name="degree">
				  <option value="中专或相关学历">中专或相关学历</option>
				  <option value="大专">大专</option>
				  <option value="本科">本科</option>
				  <option value="双学士">双学士</option>
				  <option value="硕士">硕士</option>
				  <option value="博士">博士</option>
				  <option value="博士后">博士后</option>
				</select>
			  </td>
			</tr>
			<tr>
			  <th>
				目前年薪:
			  </th>
			  <td>
				<select name="yearSalary">
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
			  </td>
			</tr>
			<tr>
			  <th>
				目前资产:
			  </th>
			  <td>
				<select name="asset">
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
			  </td>
			</tr>
			<tr>
			  <th>
				购车情况:
			  </th>
			  <td>
				<select name="carCase">
				  <option value="暂时未购车">暂未购车</option>
				  <option value="已购车一辆">已购车一辆</option>
				  <option value="已购多辆车">已购多辆车</option>
				</select>
			  </td>
			</tr>
			<tr>
			  <th>
				购房情况:
			  </th>
			  <td>
				<select name="houseCase">
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
			  </td>
			</tr>
			
			<tr>
				<th>
					&nbsp;
				</th>
				<td colspan="3">
					<input type="submit" class="button" value="确定" />
					<input type="button" class="button" value="返回"  onclick="javascript:window.history.back();"/>
				</td>
			</tr>
		</table>
	</form>
  </body>
</html>
