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
<link href="/static/public/css/common_s.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/static/public/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/static/public/js/jquery.validate.js"></script>
<script type="text/javascript" src="/static/public/js/common.js"></script>
<script type="text/javascript" src="/static/public/js/input.js"></script>
<script type="text/javascript" src="/static/public/js/province.js"></script>
<script src='/static/public/js/me.js'></script>
<style type="text/css">
	body{
		font-size:12px;
	}
	a:hover{text-decoration:underline;color: #C20C0C;}
	#inputForm td {
	    line-height: 37px;
	}
	#inputForm select {
	    width: 120px;
	    background:#F0F9E4;
	    border:1px solid #A0A0A0;
	    border-radius:3px;
	    height:23px;
	}
	
	#inputForm input[type="text"] {
	    height:23px;
	    width: 114px;
	    background:#F0F9E4;
	    border:1px solid #A0A0A0;
	    border-radius:3px;
	}
	#inputForm h2 {
		font-size: 19px;
	    font-weight: bold;
	    margin: 0;
	}
	#preview_wrapper {
	    width: 150px;
	}
	.selectImg{
		cursor: pointer;
	    opacity: 0.8;
	    position: relative;
	    top: -60px;
	    width: 150px;
	}
</style>
<script type="text/javascript">
	$().ready(function() {
		//验证身份证号码
		jQuery.validator.addMethod("idCardVali", function (value, element) {
		    //验证身份证号方法
		    var testIdCardNo = function (idcard) {
		        var Errors = new Array("验证通过!", "身份证号码位数不对!", "身份证号码出生日期超出范围或含有非法字符!", "身份证号码校验错误!", "身份证地区非法!");
		        var area = { 11: "北京", 12: "天津", 13: "河北", 14: "山西", 15: "内蒙古", 21: "辽宁", 22: "吉林", 23: "黑龙江", 31: "上海", 32: "江苏", 33: "浙江", 34: "安徽", 35: "福建", 36: "江西", 37: "山东", 41: "河南", 42: "湖北", 43: "湖南", 44: "广东", 45: "广西", 46: "海南", 50: "重庆", 51: "四川", 52: "贵州", 53: "云南", 54: "西藏", 61: "陕西", 62: "甘肃", 63: "青海", 64: "宁夏", 65: "xinjiang", 71: "台湾", 81: "香港", 82: "澳门", 91: "国外" }
		        var idcard, Y, JYM;
		        var S, M;
		        var idcard_array = new Array();
		        idcard_array = idcard.split("");
		        if (area[parseInt(idcard.substr(0, 2))] == null) return Errors[4];
		        switch (idcard.length) {
		            case 15:
		                if ((parseInt(idcard.substr(6, 2)) + 1900) % 4 == 0 || ((parseInt(idcard.substr(6, 2)) + 1900) % 100 == 0 && (parseInt(idcard.substr(6, 2)) + 1900) % 4 == 0)) {
		                    ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/; //测试出生日期的合法性
		                }
		                else {
		                    ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/; //测试出生日期的合法性
		                }
		                if (ereg.test(idcard))
		                    return Errors[0];
		                else
		                    return Errors[2];
		                break;
		            case 18:
		                if (parseInt(idcard.substr(6, 4)) % 4 == 0 || (parseInt(idcard.substr(6, 4)) % 100 == 0 && parseInt(idcard.substr(6, 4)) % 4 == 0)) {
		                    ereg = /^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/; //闰年出生日期的合法性正则表达式
		                }
		                else {
		                    ereg = /^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/; //平年出生日期的合法性正则表达式
		                }
		                if (ereg.test(idcard)) {
		                    S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10])) * 7 + (parseInt(idcard_array[1]) + parseInt(idcard_array[11])) * 9 + (parseInt(idcard_array[2]) + parseInt(idcard_array[12])) * 10 + (parseInt(idcard_array[3]) + parseInt(idcard_array[13])) * 5 + (parseInt(idcard_array[4]) + parseInt(idcard_array[14])) * 8 + (parseInt(idcard_array[5]) + parseInt(idcard_array[15])) * 4 + (parseInt(idcard_array[6]) + parseInt(idcard_array[16])) * 2 + parseInt(idcard_array[7]) * 1 + parseInt(idcard_array[8]) * 6 + parseInt(idcard_array[9]) * 3;
		                    Y = S % 11;
		                    M = "F";
		                    JYM = "10X98765432";
		                    M = JYM.substr(Y, 1);
		                    if (M == idcard_array[17])
		                        return Errors[0];
		                    else
		                        return Errors[3];
		                }
		                else
		                    return Errors[2];
		                break;
		            default:
		                return Errors[1];
		                break;
		        }
		    };
		    return testIdCardNo(value) == '验证通过!';
		}, jQuery.validator.format("非法身份证号"));
		
		var $inputForm = $("#inputForm");
		// 表单验证
		$inputForm.validate({
			rules: {
				nickName: "required"
				,age:"required"
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
					idCardVali:true
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
			}
		,submitHandler:function(form){
    		
        }
		});

	

		 
		var provinceCase=new ProvinceCase("province","city","",""); 
		provinceCase.init(provinceCase);
	});

</script>

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
			<div style="float: left;margin: 0 0 0 150px;">
				<div style="float: left; width: 388px; height: 50px; margin: 25px 0; line-height: 50px;color:#fff;line-height:50px;font-size:20px;">
					<span>
						<i style="width:28px;height:28px;background:url(/static/public/images/phone.png);display:inline-block;position: relative;top: 6px;"></i>
						丽人热线：400-8888-6666
					</span>
					<span style="color:#00f;">${member.nickName }</span>&nbsp;&nbsp;&nbsp;您好，欢迎来到丽人！
					<a href="/logout.jhtml" style="color:red;font-size:13px;">[退出]</a>
				</div>
			</div>
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
		<div class="" style="width: 722px; height: auto;margin: 0 auto;border: 12px solid #E0D7DA;">
			<form id="inputForm" action="/savePerfectInfo.jhtml" method="post" enctype="multipart/form-data">
				<input type="hidden" name="id" value="${member.id }"/>
				<div style="background:url(/static/public/images/11.jpg);width:722px;height:534px;">
					<div style="width:400px;height:400px;margin-left:30px;padding-top:35px;">
						<table>
							<tr>
								<td colspan="2">
									<h2 style="margin:0;">基本资料</h2>
								</td>
							</tr>
							<tr>
								<td>昵称：</td>
								<td>
									<input type="text" name="nickName" />
								</td>
							</tr>
							<tr>
								<td>性别：</td>
								<td>
									<label>男<input type="radio" name="sex" value="男" checked="checked"/></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label>女<input type="radio" name="sex" value="女"/></label>
								</td>
							</tr>
							<!-- <tr>
								<td>常驻地区：</td>
								<td>
									<select id="province" name="province">
										<option value="">--请选择--</option>
									</select>
									<select id="city" name="city">
										<option value="">--请选择--</option>
									</select>
								</td>
							</tr> -->
							<tr>
								<td>年龄：</td>
								<td>
									<input type="text" name="age" onkeyup="value=this.value.replace(/\D+/g,'')" maxlength="2" minlegnth="2"/>
								</td>
							</tr>
							<tr>
								<td>
									工作性质:
								</td>
								<td>
									<select name="unitNature" >
										<option value="">--请选择--</option>
										<option value="国企">国企</option>
										<option value="私企">私企</option>
										<option value="民营">民营</option>
										<option value="个体">个体</option>
										<option value="其它">其它</option>
									</select>
								</td>
							</tr>
							<tr>
							  <td>
								购房情况:
							  </td>
							  <td>
								<select name="houseCase">
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
							  </td>
							</tr>
							
							<tr>
								<td>婚姻状况：</td>
								<td>
									<select name="marriageCase">
									  <option value="">--请选择--</option>
									  <option value="未婚">未婚</option>
									  <option value="离异">离异</option>
									  <option value="丧偶">丧偶</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>身高：</td>
								<td>
									<select name="height">
									    <option value="">--请选择--</option>
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
					  			<td>
									最高学历:
							 	 </td>
								 <td>
									<select name="degree">
									  <option value="">--请选择--</option>
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
							  <td>
								目前年薪:
							  </td>
							  <td>
								<select name="yearSalary">
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
							  </td>
							</tr>
							<tr>
							  <td>
								目前资产:
							  </td>
							  <td>
								<select name="asset">
								  <option value="">--请选择--</option>
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
							  <td>
								购车情况:
							  </td>
							  <td>
								<select name="carCase">
								  <option value="">--请选择--</option>
								  <option value="暂时未购车">暂未购车</option>
								  <option value="已购车一辆">已购车一辆</option>
								  <option value="已购多辆车">已购多辆车</option>
								</select>
							  </td>
							</tr>
							
						</table>
					</div>
				</div>
				
				<div style="background:url(/static/public/images/22.jpg);width:722px;height:236px;">
					<div style="width:400px;height:210px;margin-left:30px;padding-top:40px;">
						<table class="zhanghao_table">
							<tr>
								<td colspan="2">
									<h2 style="margin:0;">帐号信息</h2>
								</td>
							</tr>
							<tr>
								<td>邮箱：</td>
								<td>
									<input type="text" name="email" />
								</td>
							</tr>
							<tr>
								<td>真实姓名：</td>
								<td>
									<input type="text" name="username" />
								</td>
							</tr>
							<tr>
								<td>身份证号：</td>
								<td>
									<input type="text" name="idCard" id="idCard" onkeyup="value=this.value.replace(/\D+/g,'')" maxlength="18" minlegnth="18"/>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div style="background:url(/static/public/images/33.jpg);width:722px;height:371px;">
					<div style="width:700px;height:300px;margin-left:30px;padding-top:15px;">
						<table>
							<tr>
								<td colspan="2">
									<h2 style="margin:0;">上传照片</h2>
								</td>
							</tr>
							<tr>
								<td>上传头像：</td>
								<td style="padding-top: 10px;">
									<div style="text-align:center;">
										<span style="float:left">
											<div id="preview_wrapper" style="width:100px;height:100px;">    
										        <div id="preview_fake00" >    
										            <img id="preview00" onload="onPreviewLoad(this,100,100)" src="/static/public/images/bg.png"/>
										        </div>    
										    </div>    
										    <br/>    
										    <input class="selectImg" id="headerImg" type="file" name="headerImg1" title="请选择头像" style="width: 62px;" onchange="filename0.value=this.value;onUploadImgChange(this,100,100,'preview00','preview_fake00','preview_size_fake00');"/>  
										    <input type="hidden" id="filename00" name="filename00">
										    <br/>    
										    <img id="preview_size_fake00"/> 
										</span>
									</div>
								</td>
							</tr>
							<tr>
								<td>上传照片：</td>
								<td>
									<div style="float:left;margin-right:50px;text-align:center;">
										<span style="float:left">
											<div id="preview_wrapper">    
										        <div id="preview_fake0" >    
										            <img id="preview0" onload="onPreviewLoad(this,150,120)" src="/static/public/images/bg.png"/>
										        </div>    
										    </div>    
										    <br/>    
										    <input class="selectImg" id="artImage" type="file" name="artImage1" title="请选择艺术照" style="width:62px;" onchange="filename0.value=this.value;onUploadImgChange(this,150,120,'preview0','preview_fake0','preview_size_fake0');"/>  
										    <input type="hidden" id="filename0" name="filename0">
										    <br/>    
										    <img id="preview_size_fake0"/> 
										</span>
									</div>
									<div style="float:left;margin-right:50px;text-align:center;">
										<span style="float:left">
											<div id="preview_wrapper">    
										        <div id="preview_fake1" >    
										            <img id="preview1" onload="onPreviewLoad(this,150,120)" src="/static/public/images/bg.png"/>
										        </div>    
										    </div>    
										    <br/>    
										    <input class="selectImg" id="lifeImage" type="file" name="lifeImage1" title="请选择生活照" style="width:62px;" onchange="filename0.value=this.value;onUploadImgChange(this,150,120,'preview1','preview_fake1','preview_size_fake1');"/>  
										    <input type="hidden" id="filename1" name="filename1">
										    <br/>    
										    <img id="preview_size_fake1"/> 
										</span>
									</div>
									<div style="float:left;text-align:center;">
										<span style="float:left">
											<div id="preview_wrapper">    
										        <div id="preview_fake2" >    
										            <img id="preview2" onload="onPreviewLoad(this,150,120)" src="/static/public/images/bg.png"/>
										        </div>    
										    </div>    
										    <br/>    
										    <input class="selectImg" id="workImage" type="file" name="workImage1" title="请选择工作照" style="width:62px;" onchange="filename0.value=this.value;onUploadImgChange(this,150,120,'preview2','preview_fake2','preview_size_fake2');"/>  
										    <input type="hidden" id="filename2" name="filename2">
										    <br/>    
										    <img id="preview_size_fake2" /> 
										</span>
									</div>
								</td>
							</tr>
						</table>
					</div>
					<div style="width:722px;height:60px;text-align:right;">
						<input type="submit" value="完善资料" class="submitBtn" style="padding: 10px 50px; margin-right: 60px; margin-top: 10px;"/>
					</div>
				</div>
				
			</form>
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
