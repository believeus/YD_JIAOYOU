<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<title>OYE首页</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<link rel="stylesheet" href="/static/public/css/oye.css" />
<link rel="stylesheet" href="/static/public/css/jquery.bxslider.css"/>
<script type="text/javascript" src="/static/public/js/jquery-1.9.1.min.js"></script>
<script src="/static/public/js/jquery.bxslider.min.js"></script>
<!-- <script src="/static/public/js/ckplayer.js"></script> -->

<!--<script type="text/javascript" src="js/bootstrap.min.js"></script>-->
<style type="text/css">
	.banner_main{width:100%;margin:0 auto;position: relative;}
    .banner_nav{width:210px;height:370px;position:absolute;top:0;left:0;z-index:100;background:#cccccc}
    .banner_slider{position: relative;overflow: hidden;height:550px;z-index: 50;}
    .banner_slider img{width:100%;height:550px;}
    .banner_slider .bx-wrapper .bx-controls-direction a{width:40px;height: 40px;background:#000000;opacity: .3;}
    .banner_slider .bx-wrapper .bx-controls-direction a.bx-prev:before{
        content:'';position: absolute;top:8px;left:12px; width: 16px; height: 24px;
        background: url(/static/public/images/zy.png) no-repeat -200px 0;}
    .banner_slider .bx-wrapper .bx-controls-direction a.bx-next:before{
        content:'';position: absolute;top:8px;left:12px; width: 16px;height: 24px;
        background: url(/static/public/images/zy.png) no-repeat -200px -24px; }
    .banner_slider .bx-wrapper .bx-controls-direction a:hover{opacity: .6}
</style>
<style type="">
#product {
	width:1250px;
	height:auto;
	overflow:hidden;
	margin:0 5px 5px 0;
	float:left;
}
#product div#content {
	position:relative;
	width:1170px;
	height:280px;
	/* display:inline-block; */
	overflow:hidden;
	/* float:left; */
	margin: 0 auto;
	left: -15px;
}
#product div#content_list {
	position:absolute;
	width:4000px;
}
#product dl{
	width:279px;
	height:260px;
	float:left;
	margin:10px 4px;
	padding:2px 2px;
	border:1px solid #F1F4F9;
}
#product dl:hover {
	border:1px solid #F94C54;
	/* background:#ccc; */
}
#product dl dt {
	
}
#product dl dt img {
	width:280px;
	height:260px;
	border:none;
}
#product dl dd {
	text-align:center;
}
#product span.prev{
	cursor:pointer;
	display:inline-block;
	width:25px;
	height:42px;
	background:url(/static/public/images/zuo.png) no-repeat left center;
	float:left;
	margin-top: 130px;
}
#product span.next{
	cursor:pointer;
	display:inline-block;
	width:25px;
	height:42px;
	background:url(/static/public/images/you.png) no-repeat left center;
	float:right;
	margin-top: -150px;
}
.img_a1{
    height: 127px;
    left: 557px;
    position: relative;
    top: -1720px;
    width: 374px;
}
.img_a1 span {
    color: #888;
    font-size: 16px;
    left: 30px;
    position: relative;
    top: 60px;
    display: block;
    width:300px;
}
.img_a2{
    height: 305px;
    left: 73px;
    position: relative;
    top: -1785px;
    width: 410px;
}
.img_a2 span {
    color: #ffffff;
    font-size: 16px;
    left: 90px;
    position: relative;
    top: 100px;
    display: block;
    width:300px;
}
.img_a3{
    height: 299px;
    left: 559px;
    position: relative;
    top: -1920px;
    width: 402px;
}
.img_a3 span {
    color: #ffffff;
    font-size: 16px;
    left: 30px;
    position: relative;
    top: 100px;
    display: block;
    width:300px;
}
.img_a4{
    height: 285px;
    left: 90px;
    position: relative;
    top: -2005px;
    width: 394px;
}
.img_a4 span {
    color: #ffffff;
    font-size: 16px;
    left: 70px;
    position: relative;
    top: 100px;
    display: block;
    width:300px;
}
.img_a5{
    height: 327px;
    left: 554px;
    position: relative;
    top: -2090px;
    width: 531px;
}
.img_a5 span {
    color: #ffffff;
    font-size: 16px;
    left: 35px;
    position: relative;
    top: 120px;
    display: block;
    width:300px;
}
.img_a6 {
    height: 236px;
    left: 70px;
    position: relative;
    top: -2197px;
    width: 420px;
}
.img_a6 span {
    color: #ffffff;
    display: block;
    font-size: 16px;
    left: 100px;
    position: relative;
    top: 110px;
    width: 300px;
}
.img {
    text-align: center;
}
.img img{
    border-radius:100px;
}
.anli_class {
    height: 460px;
    width: 100%;
}
.main-ourteam-cont-title a:hover{
	color:#ff5900;
	text-decoration: underline;
}
.main-tp-title a:hover{
	color:#ff5900;
	text-decoration: underline;
}
#bus:hover{
	color:#ff5900;
	text-decoration: underline;
}
.abus img{
	width:100px;
	float:left;
}
</style>
<script src="/static/public/js/jquery.lazyload.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" charset="utf-8">
	//懒加载
	$(function() {
		$("img").lazyload({
			threshold:0,
            failure_limit:0,
            event:"scroll",
            effect:"fadeIn",
            container:window,
            skip_invisible:true
		});
	});
</script>
<script type="text/javascript">
	$(function(){
		$(".main-comp-const-title-list").click(function(){
			$(this).parent().find("div").removeClass("current");
			$(this).addClass("current");
		});
		$('.banner_slider ul').bxSlider({
            auto:true,
            autoHover:true,
             pager:false,
             touch:false
        });
		$("#xx_img01").css("left",$("#list01").offset().left+78);
		$("#xx_img02").css("left",$("#list01").offset().left+78);
		$("#xx_img03").css("left",$("#list01").offset().left+78);
		$("#xx_img04").css("left",$("#list01").offset().left+78);
		/* $(".main-comps-list").click(function(){
			var left = $(this).offset().left + 78;
			$("#xx_img").animate({left:left});
			$("#xx_img").animate({left:$(this).offset().left + 78});
		}); */
		
		$("#shijie").click(function(){
			$("#shijie500qiang").show();
			$("#guoyouqiye").hide();
			$("#shiyedanwei").hide();
			$("#siyouqiye").hide();
		});
		$("#guoyou").click(function(){
			$("#shijie500qiang").hide();
			$("#guoyouqiye").show();
			$("#shiyedanwei").hide();
			$("#siyouqiye").hide();
		});
		$("#shiye").click(function(){
			$("#shijie500qiang").hide();
			$("#guoyouqiye").hide();
			$("#shiyedanwei").show();
			$("#siyouqiye").hide();
		});
		$("#siyou").click(function(){
			$("#shijie500qiang").hide();
			$("#guoyouqiye").hide();
			$("#shiyedanwei").hide();
			$("#siyouqiye").show();
		});
		//-----------------------------
		$("#list01").click(function(){
			$("#compimg01").show();
			$("#compimg02").hide();
			$("#compimg03").hide();
			$("#compimg04").hide();
			$("#xx_img01").animate({left:$(this).offset().left + 78},"fast");
			$("#xx_img01").animate({left:$(this).offset().left + 88},100);
			$("#xx_img01").animate({left:$(this).offset().left + 78},100);
			$("#xx_img01").animate({left:$(this).offset().left + 83},100);
			$("#xx_img01").animate({left:$(this).offset().left + 78},100);
		});
		$("#list02").click(function(){
			$("#compimg01").hide();
			$("#compimg02").show();
			$("#compimg03").hide();
			$("#compimg04").hide();
			$("#xx_img01").animate({left:$(this).offset().left + 78},"fast");
			$("#xx_img01").animate({left:$(this).offset().left + 88},100);
			$("#xx_img01").animate({left:$(this).offset().left + 78},100);
			$("#xx_img01").animate({left:$(this).offset().left + 83},100);
			$("#xx_img01").animate({left:$(this).offset().left + 78},100);
		});
		$("#list03").click(function(){
			$("#compimg01").hide();
			$("#compimg02").hide();
			$("#compimg03").show();
			$("#compimg04").hide();
			$("#xx_img01").animate({left:$(this).offset().left + 78},"fast");
			$("#xx_img01").animate({left:$(this).offset().left + 88},100);
			$("#xx_img01").animate({left:$(this).offset().left + 78},100);
			$("#xx_img01").animate({left:$(this).offset().left + 83},100);
			$("#xx_img01").animate({left:$(this).offset().left + 78},100);
		});
		$("#list04").click(function(){
			$("#compimg01").hide();
			$("#compimg02").hide();
			$("#compimg03").hide();
			$("#compimg04").show();
			$("#xx_img01").animate({left:$(this).offset().left + 78},"fast");
			$("#xx_img01").animate({left:$(this).offset().left + 88},100);
			$("#xx_img01").animate({left:$(this).offset().left + 78},100);
			$("#xx_img01").animate({left:$(this).offset().left + 83},100);
			$("#xx_img01").animate({left:$(this).offset().left + 78},100);
		});
		//-----------------------------
		$("#2list01").click(function(){
			$("#2compimg01").show();
			$("#2compimg02").hide();
			$("#2compimg03").hide();
			$("#2compimg04").hide();
			$("#xx_img02").animate({left:$(this).offset().left + 78},"fast");
			$("#xx_img02").animate({left:$(this).offset().left + 88},100);
			$("#xx_img02").animate({left:$(this).offset().left + 78},100);
			$("#xx_img02").animate({left:$(this).offset().left + 83},100);
			$("#xx_img02").animate({left:$(this).offset().left + 78},100);
		});
		$("#2list02").click(function(){
			$("#2compimg01").hide();
			$("#2compimg02").show();
			$("#2compimg03").hide();
			$("#2compimg04").hide();
			$("#xx_img02").animate({left:$(this).offset().left + 78},"fast");
			$("#xx_img02").animate({left:$(this).offset().left + 88},100);
			$("#xx_img02").animate({left:$(this).offset().left + 78},100);
			$("#xx_img02").animate({left:$(this).offset().left + 83},100);
			$("#xx_img02").animate({left:$(this).offset().left + 78},100);
		});
		$("#2list03").click(function(){
			$("#2compimg01").hide();
			$("#2compimg02").hide();
			$("#2compimg03").show();
			$("#2compimg04").hide();
			$("#xx_img02").animate({left:$(this).offset().left + 78},"fast");
			$("#xx_img02").animate({left:$(this).offset().left + 88},100);
			$("#xx_img02").animate({left:$(this).offset().left + 78},100);
			$("#xx_img02").animate({left:$(this).offset().left + 83},100);
			$("#xx_img02").animate({left:$(this).offset().left + 78},100);
		});
		$("#2list04").click(function(){
			$("#2compimg01").hide();
			$("#2compimg02").hide();
			$("#2compimg03").hide();
			$("#2compimg04").show();
			$("#xx_img02").animate({left:$(this).offset().left + 78},"fast");
			$("#xx_img02").animate({left:$(this).offset().left + 88},100);
			$("#xx_img02").animate({left:$(this).offset().left + 78},100);
			$("#xx_img02").animate({left:$(this).offset().left + 83},100);
			$("#xx_img02").animate({left:$(this).offset().left + 78},100);
		});
		//-------------------------------
		$("#3list01").click(function(){
			$("#3compimg01").show();
			$("#3compimg02").hide();
			$("#3compimg03").hide();
			$("#3compimg04").hide();
			$("#xx_img03").animate({left:$(this).offset().left + 78},"fast");
			$("#xx_img03").animate({left:$(this).offset().left + 88},100);
			$("#xx_img03").animate({left:$(this).offset().left + 78},100);
			$("#xx_img03").animate({left:$(this).offset().left + 83},100);
			$("#xx_img03").animate({left:$(this).offset().left + 78},100);
		});
		$("#3list02").click(function(){
			$("#3compimg01").hide();
			$("#3compimg02").show();
			$("#3compimg03").hide();
			$("#3compimg04").hide();
			$("#xx_img03").animate({left:$(this).offset().left + 78},"fast");
			$("#xx_img03").animate({left:$(this).offset().left + 88},100);
			$("#xx_img03").animate({left:$(this).offset().left + 78},100);
			$("#xx_img03").animate({left:$(this).offset().left + 83},100);
			$("#xx_img03").animate({left:$(this).offset().left + 78},100);
		});
		$("#3list03").click(function(){
			$("#3compimg01").hide();
			$("#3compimg02").hide();
			$("#3compimg03").show();
			$("#3compimg04").hide();
			$("#xx_img03").animate({left:$(this).offset().left + 78},"fast");
			$("#xx_img03").animate({left:$(this).offset().left + 88},100);
			$("#xx_img03").animate({left:$(this).offset().left + 78},100);
			$("#xx_img03").animate({left:$(this).offset().left + 83},100);
			$("#xx_img03").animate({left:$(this).offset().left + 78},100);
		});
		$("#3list04").click(function(){
			$("#3compimg01").hide();
			$("#3compimg02").hide();
			$("#3compimg03").hide();
			$("#3compimg04").show();
			$("#xx_img03").animate({left:$(this).offset().left + 78},"fast");
			$("#xx_img03").animate({left:$(this).offset().left + 88},100);
			$("#xx_img03").animate({left:$(this).offset().left + 78},100);
			$("#xx_img03").animate({left:$(this).offset().left + 83},100);
			$("#xx_img03").animate({left:$(this).offset().left + 78},100);
		});
		//-------------------------------------
		$("#4list01").click(function(){
			$("#4compimg01").show();
			$("#4compimg02").hide();
			$("#4compimg03").hide();
			$("#4compimg04").hide();
			$("#xx_img04").animate({left:$(this).offset().left + 78},"fast");
			$("#xx_img04").animate({left:$(this).offset().left + 88},100);
			$("#xx_img04").animate({left:$(this).offset().left + 78},100);
			$("#xx_img04").animate({left:$(this).offset().left + 83},100);
			$("#xx_img04").animate({left:$(this).offset().left + 78},100);
		});
		$("#4list02").click(function(){
			$("#4compimg01").hide();
			$("#4compimg02").show();
			$("#4compimg03").hide();
			$("#4compimg04").hide();
			$("#xx_img04").animate({left:$(this).offset().left + 78},"fast");
			$("#xx_img04").animate({left:$(this).offset().left + 88},100);
			$("#xx_img04").animate({left:$(this).offset().left + 78},100);
			$("#xx_img04").animate({left:$(this).offset().left + 83},100);
			$("#xx_img04").animate({left:$(this).offset().left + 78},100);
		});
		$("#4list03").click(function(){
			$("#4compimg01").hide();
			$("#4compimg02").hide();
			$("#4compimg03").show();
			$("#4compimg04").hide();
			$("#xx_img04").animate({left:$(this).offset().left + 78},"fast");
			$("#xx_img04").animate({left:$(this).offset().left + 88},100);
			$("#xx_img04").animate({left:$(this).offset().left + 78},100);
			$("#xx_img04").animate({left:$(this).offset().left + 83},100);
			$("#xx_img04").animate({left:$(this).offset().left + 78},100);
		});
		$("#4list04").click(function(){
			$("#4compimg01").hide();
			$("#4compimg02").hide();
			$("#4compimg03").hide();
			$("#4compimg04").show();
			$("#xx_img04").animate({left:$(this).offset().left + 78},"fast");
			$("#xx_img04").animate({left:$(this).offset().left + 88},100);
			$("#xx_img04").animate({left:$(this).offset().left + 78},100);
			$("#xx_img04").animate({left:$(this).offset().left + 83},100);
			$("#xx_img04").animate({left:$(this).offset().left + 78},100);
		});
		//-------------------
		$("#cont-img01").click(function(){
			$("#m_img01").show();
			$("#m_img02").hide();
			$("#m_img03").hide();
			$("#embed01").show();
			$("#embed02").hide();
			$("#embed03").hide();
		});
		$("#cont-img02").click(function(){
			$("#m_img02").show();
			$("#m_img01").hide();
			$("#m_img03").hide();
			$("#embed01").hide();
			$("#embed02").show();
			$("#embed03").hide();
		});
		$("#cont-img03").click(function(){
			$("#m_img01").hide();
			$("#m_img02").hide();
			$("#m_img03").show();
			$("#embed01").hide();
			$("#embed02").hide();
			$("#embed03").show();
		});
	});
</script>
<script type="text/javascript">
	$(function(){
		var page = 1;
		var i = 4; //每版放4个图片
		//向后 按钮
		$("span.next").click(function(){    //绑定click事件
			 var content = $("div#content"); 
			 var content_list = $("div#content_list");
			 var v_width = content.width();
			 var len = content.find("dl").length;
			 var page_count = Math.ceil(len / i) ;   //只要不是整数，就往大的方向取最小的整数
			 if( !content_list.is(":animated") ){    //判断“内容展示区域”是否正在处于动画
				  if( page == page_count ){  //已经到最后一个版面了,如果再向后，必须跳转到第一个版面。
					content_list.animate({ left : '0px'}, "slow"); //通过改变left值，跳转到第一个版面
					page = 1;
				  }else{
					content_list.animate({ left : '-='+v_width }, "slow");  //通过改变left值，达到每次换一个版面
					page++;
				 }
			 }
	   });
		//往前 按钮
		$("span.prev").click(function(){
			 var content = $("div#content"); 
			 var content_list = $("div#content_list");
			 var v_width = content.width();//1170px
			 var len = content.find("dl").length;
			 var page_count = Math.ceil(len / i) ;   //只要不是整数，就往大的方向取最小的整数
			 if(!content_list.is(":animated") ){    //判断“内容展示区域”是否正在处于动画
				 if(page == 1 ){  //已经到第一个版面了,如果再向前，必须跳转到最后一个版面。
					content_list.animate({ left : '-='+v_width*(page_count-1) }, "slow");
					page = page_count;
				}else{
					content_list.animate({ left : '+='+v_width }, "slow");
					page--;
				}
			}
		});
		//------------锚点滚动
		$("#busId").click(function(){
			$("html,body").animate({scrollTop: $("#bus").offset().top - 82}, 500);
		});
		$("#anliId").click(function(){
			$("html,body").animate({scrollTop: $("#anli").offset().top - 82}, 500);
		});
		/* $("#zhizhiId").click(function(){
			$("html,body").animate({scrollTop: $("#zhizhi").offset().top}, 500);
		}); */
		$("#custId").click(function(){
			$("html,body").animate({scrollTop: $("#cust").offset().top - 82}, 500);
		});
		$("#liuchengId").click(function(){
			$("html,body").animate({scrollTop: $("#liucheng").offset().top - 82}, 500);
		});
		$("#newsId").click(function(){
			$("html,body").animate({scrollTop: $("#news").offset().top - 82}, 500);
		});
		$("#zixunId").click(function(){
			$("html,body").animate({scrollTop: $("#zixun").offset().top - 82}, 500);
		});
		
		//var swidth = window.screen.width;
		//banner宽度
		//alert(window.screen.width);
		$("#banner_img").css("width",window.screen.width);
		$(".banner_slider img").css("width",window.screen.width);
		if(window.screen.width >= 2000){
			$("#banner_img").css("width",2000);
			$(".banner_slider img").css("width",2000);
		}
	});
</script>
</head>
<body>
	<!--
       	作者：1213569843@qq.com
       	时间：2014-11-04
       	描述：页头
       -->
	<jsp:include page="header.jsp" />
	<div class="main">
		<div id="banner_img" style="width:2000px;height:auto;overflow:hidden;margin:0 auto;">
		<div class="main-img">
			<div class="banner_slider">
                <ul>
                	<c:if test="${bannersSize!=0 }">
	                	<c:forEach items="${banners }" var="banner">
		                    <li>
		                    	<a href="${banner.link }" title="${banner.link }">
		                    		<img data-original="${banner.path }" src="/static/public/images/grey.gif" width="100%"/>
	                    		</a>
	                   		</li>
	                	</c:forEach>
                	</c:if>
                	<c:if test="${bannersSize==0 }">
	                    <li>
	                    	<a href="http://www.believeus.cn" title="http://www.believeus.cn" target="_blank">
	                    		<img data-original="/static/public/images/img1.jpg" src="/static/public/images/grey.gif" width="100%"/>
                    		</a>
                   		</li>
	                    <li>
	                    	<a href="http://www.believeus.cn" title="http://www.believeus.cn" target="_blank">
	                    		<img data-original="/static/public/images/img1.jpg" src="/static/public/images/grey.gif" width="100%"/>
                    		</a>
                   		</li>
	                    <li>
	                    	<a href="http://www.believeus.cn" title="http://www.believeus.cn" target="_blank">
	                    		<img data-original="/static/public/images/img1.jpg" src="/static/public/images/grey.gif" width="100%"/>
                    		</a>
                   		</li>
	                    <li>
	                    	<a href="http://www.believeus.cn" title="http://www.believeus.cn" target="_blank">
	                    		<img data-original="/static/public/images/img1.jpg" src="/static/public/images/grey.gif" width="100%"/>
                    		</a>
                   		</li>
                	</c:if>
                </ul>
            </div>
		</div>
		</div>
		<div class="main-service">
			<p class="">
				<!-- <i style="width: 64px; height: 63px; background: url(/static/public/images/ser.png); display: inline-block; position: relative; top: 22px; margin-right: 5px;"></i> -->
				<img src="/static/public/images/ser.png" style="width: 35px; position: relative; top: 8px;"/>
				<a id="bus" style="font-size: 24px;" href="/ourBussiness.jhtml" target="_blank">服务范围Our Business</a>
			</p>
			<div class="main-service-list">
				<c:if test="${bsize!=0 }">
					<c:forEach items="${businesses }" var="bus" varStatus="status">
						<c:if test="${status.index < 6}">
							<div class="main-service-cont" <c:if test="${(status.index+1)%3==0 }">style="margin-right:0;"</c:if>>
								<div class="main-service-cont-img">
									<img data-original="${bus.path }" src="/static/public/images/grey.gif" width="99" height="99"/>
								</div>
								<div class="main-service-cont-name">
									${fn:substring(bus.title, 0, 12)}
									<c:if test="${fn:length(bus.title) > 12 }">
					   					...
				   					</c:if>
								</div>
								<div class="main-service-cont-dis">
									${fn:substring(bus.description, 0, 100)}
									<c:if test="${fn:length(bus.description) > 100 }">
					   					...
				   					</c:if>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</c:if>
				<c:if test="${bsize==0 }">
					<div class="main-service-cont">
						<div class="main-service-cont-img">
							<img data-original="/static/public/images/bgs.png" src="/static/public/images/grey.gif" width="99" height="99"/>
						</div>
						<div class="main-service-cont-name">
							办公室整体清洁及空气治理
						</div>
						<div class="main-service-cont-dis">
							办公室搬迁根据企业所需提供全面或局部搬迁，和企业性质，提出搬迁过程中所需注意事项，并向企业提出详细完整搬迁计划书
						</div>
					</div>
					<div class="main-service-cont">
						<div class="main-service-cont-img">
							<img data-original="/static/public/images/cc.png" src="/static/public/images/grey.gif" width="99" height="99"/>
						</div>
						<div class="main-service-cont-name">
							仓储
						</div>
						<div class="main-service-cont-dis">
							办公室搬迁根据企业所需提供全面或局部搬迁，和企业性质，提出搬迁过程中所需注意事项，并向企业提出详细完整搬迁计划书
						</div>
					</div>
					<div class="main-service-cont" style="margin-right:0;">
						<div class="main-service-cont-img">
							<img data-original="/static/public/images/es.png" src="/static/public/images/grey.gif" width="99" height="99"/>
						</div>
						<div class="main-service-cont-name">
							二手家具回收及出售
						</div>
						<div class="main-service-cont-dis">
							办公室搬迁根据企业所需提供全面或局部搬迁，和企业性质，提出搬迁过程中所需注意事项，并向企业提出详细完整搬迁计划书
						</div>
					</div>
					<div class="main-service-cont">
						<div class="main-service-cont-img">
							<img data-original="/static/public/images/people.png" src="/static/public/images/grey.gif" width="99" height="99"/>
						</div>
						<div class="main-service-cont-name">
							国内市内私人搬迁
						</div>
						<div class="main-service-cont-dis">
							办公室搬迁根据企业所需提供全面或局部搬迁，和企业性质，提出搬迁过程中所需注意事项，并向企业提出详细完整搬迁计划书
						</div>
					</div>
					<div class="main-service-cont">
						<div class="main-service-cont-img">
							<img data-original="/static/public/images/phone.png" src="/static/public/images/grey.gif" width="99" height="99"/>
						</div>
						<div class="main-service-cont-name">
							办公室搬迁
						</div>
						<div class="main-service-cont-dis">
							办公室搬迁根据企业所需提供全面或局部搬迁，和企业性质，提出搬迁过程中所需注意事项，并向企业提出详细完整搬迁计划书
						</div>
					</div>
					<div class="main-service-cont" style="margin-right:0;">
						<div class="main-service-cont-img">
							<img data-original="/static/public/images/sys.png" src="/static/public/images/grey.gif" width="99" height="99"/>
						</div>
						<div class="main-service-cont-name">
							实验室搬迁
						</div>
						<div class="main-service-cont-dis">
							办公室搬迁根据企业所需提供全面或局部搬迁，和企业性质，提出搬迁过程中所需注意事项，并向企业提出详细完整搬迁计划书
						</div>
					</div>
				</c:if>
			</div>
		</div>
		<div class="main-ourteam-cont-title">
			<!-- <i style="width: 64px; height: 58px; background: url(/static/public/images/al.png); display: inline-block; position: relative; top: 0px; margin-right: 5px;"></i> -->
			<img src="/static/public/images/al.png" style="width: 35px; position: relative; top: 8px;"/>
			<a id="anli" href="/caseList.jhtml" style="font-size: 24px; position: relative; top: 0px;" target="_blank">我们的案例</a>
		</div>
		<div class="main-comp-const">
			<div class="main-comp-const-title" style="width:460px;">
				<div id="shijie" class="main-comp-const-title-list current" style="width: 130px;">世界500强</div>
				<div id="guoyou" class="main-comp-const-title-list">国有企业</div>
				<div id="shiye" class="main-comp-const-title-list">事业单位</div>
				<div id="siyou" class="main-comp-const-title-list">私有企业</div>
			</div>
			
			<c:if test="${examplesSize!=0 }">
			<div id="shijie500qiang" class="anli_class">
				<c:forEach items="${examples1 }" var="example" varStatus="status">
					<div class="main-comp-const-img" id="compimg0${status.index+1 }" <c:if test="${status.index>0 }">style="display:none;"</c:if>>
						<div id="product">
							<span class="prev"></span>
							<div id="content">
								<div id="content_list">
									<c:forEach items="${fn:split(example.paths, '#') }" var="url" varStatus="status">
										<dl>
											<dt><img data-original="${url }" src="/static/public/images/grey.gif"/></dt>
										</dl>
									</c:forEach>
								</div>
							</div>
							<span class="next"></span>
						</div>
					</div>
				</c:forEach>
				<div class="ico">
					<div style="width:100%;height:28px;border-top:5px solid #000;margin-top: 30px;">
						<img id="xx_img01" data-original="/static/public/images/xx.png" src="/static/public/images/grey.gif" style="position: relative; top: -5px;"/>
					</div>
				</div>
				<div class="main-comps">
					<c:forEach items="${examples1 }" var="example" varStatus="status">
						<c:if test="${status.index<5 }">
							<div class="main-comps-list" id="list0${status.index+1 }">
								<img src="/static/public/images/cry.png" />
								<img data-original="${example.logo }" src="/static/public/images/grey.gif" width="88" height="30" style="position: relative; top: -65px;"/>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<div id="guoyouqiye" style="display:none;" class="anli_class">
				<c:forEach items="${examples2 }" var="example" varStatus="status">
					<div class="main-comp-const-img" id="2compimg0${status.index+1 }" <c:if test="${status.index>0 }">style="display:none;"</c:if>>
						<div id="product">
							<span class="prev"></span>
							<div id="content">
								<div id="content_list">
									<c:forEach items="${fn:split(example.paths, '#') }" var="url" varStatus="status">
										<dl>
											<dt><img src="${url }"/></dt>
										</dl>
									</c:forEach>
								</div>
							</div>
							<span class="next"></span>
						</div>
					</div>
				</c:forEach>
				<div class="ico">
					<div style="width:100%;height:28px;border-top:5px solid #000;margin-top: 30px;">
						<img id="xx_img02" src="/static/public/images/xx.png" style="position: relative; top: -5px;"/>
					</div>
				</div>
				<div class="main-comps">
					<c:forEach items="${examples2 }" var="example" varStatus="status">
						<c:if test="${status.index<5 }">
							<div class="main-comps-list" id="2list0${status.index+1 }">
								<img src="/static/public/images/cry.png" />
								<img src="${example.logo }" width="88" height="30" style="position: relative; top: -65px;"/>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<div id="shiyedanwei" style="display:none;" class="anli_class">
				<c:forEach items="${examples3 }" var="example" varStatus="status">
					<div class="main-comp-const-img" id="3compimg0${status.index+1 }" <c:if test="${status.index>0 }">style="display:none;"</c:if>>
						<div id="product">
							<span class="prev"></span>
							<div id="content">
								<div id="content_list">
									<c:forEach items="${fn:split(example.paths, '#') }" var="url" varStatus="status">
										<dl>
											<dt><img src="${url }"/></dt>
										</dl>
									</c:forEach>
								</div>
							</div>
							<span class="next"></span>
						</div>
					</div>
				</c:forEach>
				<div class="ico">
					<div style="width:100%;height:28px;border-top:5px solid #000;margin-top: 30px;">
						<img id="xx_img03" src="/static/public/images/xx.png" style="position: relative; top: -5px;"/>
					</div>
				</div>
				<div class="main-comps">
					<c:forEach items="${examples3 }" var="example" varStatus="status">
						<c:if test="${status.index<5 }">
							<div class="main-comps-list" id="3list0${status.index+1 }">
								<img src="/static/public/images/cry.png" />
								<img src="${example.logo }" width="88" height="30" style="position: relative; top: -65px;"/>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<div id="siyouqiye" style="display:none;" class="anli_class">
				<c:forEach items="${examples4 }" var="example" varStatus="status">
					<div class="main-comp-const-img" id="4compimg0${status.index+1 }" <c:if test="${status.index>0 }">style="display:none;"</c:if>>
						<div id="product">
							<span class="prev"></span>
							<div id="content">
								<div id="content_list">
									<c:forEach items="${fn:split(example.paths, '#') }" var="url" varStatus="status">
										<dl>
											<dt><img src="${url }" /></dt>
										</dl>
									</c:forEach>
								</div>
							</div>
							<span class="next"></span>
						</div>
					</div>
				</c:forEach>
				<div class="ico">
					<div style="width:100%;height:28px;border-top:5px solid #000;margin-top: 30px;">
						<img id="xx_img04" src="/static/public/images/xx.png" style="position: relative; top: -5px;"/>
					</div>
				</div>
				<div class="main-comps">
					<c:forEach items="${examples4 }" var="example" varStatus="status">
						<c:if test="${status.index<5 }">
							<div class="main-comps-list" id="4list0${status.index+1 }">
								<img src="/static/public/images/cry.png" />
								<img src="${example.logo }" width="88" height="30" style="position: relative; top: -65px;"/>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			</c:if>
			<c:if test="${examplesSize==0 }">
				<div id="shijie500qiang" class="anli_class">
					<div class="main-comp-const-img" id="compimg01">
						<div id="product">
							<span class="prev"></span>
							<div id="content">
								<div id="content_list">
									<dl>
										<dt><img data-original="/static/public/images/b1.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
									<dl>
										<dt><img data-original="/static/public/images/b2.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
									<dl>
										<dt><img data-original="/static/public/images/b3.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
									<dl>
										<dt><img data-original="/static/public/images/b4.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
								</div>
							</div>
							<span class="next"></span>
						</div>
					</div>
					<div class="main-comp-const-img" id="compimg02" style="display:none;">
						<div id="product">
							<span class="prev"></span>
							<div id="content">
								<div id="content_list">
									<dl>
										<dt><img data-original="/static/public/images/b1.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
									<dl>
										<dt><img data-original="/static/public/images/b2.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
									<dl>
										<dt><img data-original="/static/public/images/b3.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
									<dl>
										<dt><img data-original="/static/public/images/b4.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
								</div>
							</div>
							<span class="next"></span>
						</div>
					</div>
					<div class="main-comp-const-img" id="compimg03" style="display:none;">
						<div id="product">
							<span class="prev"></span>
							<div id="content">
								<div id="content_list">
									<dl>
										<dt><img data-original="/static/public/images/b1.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
									<dl>
										<dt><img data-original="/static/public/images/b2.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
									<dl>
										<dt><img data-original="/static/public/images/b3.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
									<dl>
										<dt><img data-original="/static/public/images/b4.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
								</div>
							</div>
							<span class="next"></span>
						</div>
					</div>
					<div class="main-comp-const-img" id="compimg04" style="display:none;">
						<div id="product">
							<span class="prev"></span>
							<div id="content">
								<div id="content_list">
									<dl>
										<dt><img data-original="/static/public/images/b1.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
									<dl>
										<dt><img data-original="/static/public/images/b2.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
									<dl>
										<dt><img data-original="/static/public/images/b3.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
									<dl>
										<dt><img data-original="/static/public/images/b4.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
								</div>
							</div>
							<span class="next"></span>
						</div>
					</div>
					<div class="ico">
						<div style="width:100%;height:28px;border-top:5px solid #000;margin-top: 30px;">
							<img id="xx_img01" src="/static/public/images/xx.png" style="position: relative; top: -5px;"/>
						</div>
					</div>
					<div class="main-comps">
						<div class="main-comps-list" id="list01">
							<img src="/static/public/images/cry.png" />
							<img src="/static/public/images/lenovo.png" width="88" height="30" style="position: relative; top: -65px;"/>
						</div>
						<div class="main-comps-list" id="list02">
							<img src="/static/public/images/cry.png" />
							<img src="/static/public/images/lenovo.png" width="88" height="30" style="position: relative; top: -65px;"/>
						</div>
						<div class="main-comps-list" id="list03">
							<img src="/static/public/images/cry.png" />
							<img src="/static/public/images/lenovo.png" width="88" height="30" style="position: relative; top: -65px;"/>
						</div>
						<div class="main-comps-list" id="list04">
							<img src="/static/public/images/cry.png" />
							<img src="/static/public/images/lenovo.png" width="88" height="30" style="position: relative; top: -65px;"/>
						</div>
					</div>
				</div>
				<div id="guoyouqiye" style="display:none;" class="anli_class">
					<div class="main-comp-const-img" id="2compimg01">
						<div id="product">
							<span class="prev"></span>
							<div id="content">
								<div id="content_list">
									<dl>
										<dt><img data-original="/static/public/images/b1.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
									<dl>
										<dt><img data-original="/static/public/images/b2.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
									<dl>
										<dt><img data-original="/static/public/images/b3.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
									<dl>
										<dt><img data-original="/static/public/images/b4.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
								</div>
							</div>
						</div>
					</div>
					<div class="main-comp-const-img" id="2compimg02" style="display:none;">
						<div id="product">
							<span class="prev"></span>
							<div id="content">
								<div id="content_list">
									<dl>
										<dt><img data-original="/static/public/images/b1.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
									<dl>
										<dt><img data-original="/static/public/images/b2.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
									<dl>
										<dt><img data-original="/static/public/images/b3.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
									<dl>
										<dt><img data-original="/static/public/images/b4.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
								</div>
							</div>
						</div>
					</div>
					<div class="main-comp-const-img" id="2compimg03" style="display:none;">
						<div id="product">
							<span class="prev"></span>
							<div id="content">
								<div id="content_list">
									<dl>
										<dt><img data-original="/static/public/images/b1.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
									<dl>
										<dt><img data-original="/static/public/images/b2.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
									<dl>
										<dt><img data-original="/static/public/images/b3.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
									<dl>
										<dt><img data-original="/static/public/images/b4.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
								</div>
							</div>
						</div>
					</div>
					<div class="main-comp-const-img" id="2compimg04" style="display:none;">
						<div id="product">
							<span class="prev"></span>
							<div id="content">
								<div id="content_list">
									<dl>
										<dt><img data-original="/static/public/images/b1.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
									<dl>
										<dt><img data-original="/static/public/images/b2.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
									<dl>
										<dt><img data-original="/static/public/images/b3.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
									<dl>
										<dt><img data-original="/static/public/images/b4.jpg" src="/static/public/images/grey.gif"/></dt>
									</dl>
								</div>
							</div>
						</div>
					</div>
					<div class="ico">
						<div style="width:100%;height:28px;border-top:5px solid #000;margin-top: 30px;">
							<img id="xx_img02" src="/static/public/images/xx.png" style="position: relative; top: -5px;"/>
						</div>
					</div>
					<div class="main-comps">
						<div class="main-comps-list" id="2list01">
							<img src="/static/public/images/cry.png" />
							<img src="/static/public/images/lenovo.png" width="88" height="30" style="position: relative; top: -65px;"/>
						</div>
						<div class="main-comps-list" id="2list02">
							<img src="/static/public/images/cry.png" />
							<img src="/static/public/images/lenovo.png" width="88" height="30" style="position: relative; top: -65px;"/>
						</div>
						<div class="main-comps-list" id="2list03">
							<img src="/static/public/images/cry.png" />
							<img src="/static/public/images/lenovo.png" width="88" height="30" style="position: relative; top: -65px;"/>
						</div>
						<div class="main-comps-list" id="2list04">
							<img src="/static/public/images/cry.png" />
							<img src="/static/public/images/lenovo.png" width="88" height="30" style="position: relative; top: -65px;"/>
						</div>
					</div>
				</div>
				<div id="shiyedanwei" style="display:none;" class="anli_class">
					<div class="main-comp-const-img" id="3compimg01">
						<div id="product">
							<span class="prev"></span>
							<div id="content">
								<div id="content_list">
									<dl>
										<dt><img src="/static/public/images/b1.jpg"/></dt>
									</dl>
									<dl>
										<dt><img src="/static/public/images/b2.jpg"/></dt>
									</dl>
									<dl>
										<dt><img src="/static/public/images/b3.jpg"/></dt>
									</dl>
									<dl>
										<dt><img src="/static/public/images/b4.jpg"/></dt>
									</dl>
								</div>
							</div>
							<span class="next"></span>
						</div>
					</div>
					<div class="main-comp-const-img" id="3compimg02" style="display:none;">
						<div id="product">
							<span class="prev"></span>
							<div id="content">
								<div id="content_list">
									<dl>
										<dt><img src="/static/public/images/b1.jpg"/></dt>
									</dl>
									<dl>
										<dt><img src="/static/public/images/b2.jpg"/></dt>
									</dl>
									<dl>
										<dt><img src="/static/public/images/b3.jpg"/></dt>
									</dl>
									<dl>
										<dt><img src="/static/public/images/b4.jpg"/></dt>
									</dl>
								</div>
							</div>
							<span class="next"></span>
						</div>
					</div>
					<div class="main-comp-const-img" id="3compimg03" style="display:none;">
						<div id="product">
							<span class="prev"></span>
							<div id="content">
								<div id="content_list">
									<dl>
										<dt><img src="/static/public/images/b1.jpg"/></dt>
									</dl>
									<dl>
										<dt><img src="/static/public/images/b2.jpg"/></dt>
									</dl>
									<dl>
										<dt><img src="/static/public/images/b3.jpg"/></dt>
									</dl>
									<dl>
										<dt><img src="/static/public/images/b4.jpg"/></dt>
									</dl>
								</div>
							</div>
							<span class="next"></span>
						</div>
					</div>
					<div class="main-comp-const-img" id="3compimg04" style="display:none;">
						<div id="product">
							<span class="prev"></span>
							<div id="content">
								<div id="content_list">
									<dl>
										<dt><img src="/static/public/images/b1.jpg"/></dt>
									</dl>
									<dl>
										<dt><img src="/static/public/images/b2.jpg"/></dt>
									</dl>
									<dl>
										<dt><img src="/static/public/images/b3.jpg"/></dt>
									</dl>
									<dl>
										<dt><img src="/static/public/images/b4.jpg"/></dt>
									</dl>
								</div>
							</div>
							<span class="next"></span>
						</div>
					</div>
					<div class="ico">
						<div style="width:100%;height:28px;border-top:5px solid #000;margin-top: 30px;">
							<img id="xx_img03" src="/static/public/images/xx.png" style="position: relative; top: -5px;"/>
						</div>
					</div>
					<div class="main-comps">
						<div class="main-comps-list" id="3list01">
							<img src="/static/public/images/cry.png" />
							<img src="/static/public/images/lenovo.png" width="88" height="30" style="position: relative; top: -65px;"/>
						</div>
						<div class="main-comps-list" id="3list02">
							<img src="/static/public/images/cry.png" />
							<img src="/static/public/images/lenovo.png" width="88" height="30" style="position: relative; top: -65px;"/>
						</div>
						<div class="main-comps-list" id="3list03">
							<img src="/static/public/images/cry.png" />
							<img src="/static/public/images/lenovo.png" width="88" height="30" style="position: relative; top: -65px;"/>
						</div>
						<div class="main-comps-list" id="3list04">
							<img src="/static/public/images/cry.png" />
							<img src="/static/public/images/lenovo.png" width="88" height="30" style="position: relative; top: -65px;"/>
						</div>
					</div>
				</div>
				<div id="siyouqiye" style="display:none;" class="anli_class">
					<div class="main-comp-const-img" id="4compimg01">
						<div id="product">
							<span class="prev"></span>
							<div id="content">
								<div id="content_list">
									<dl>
										<dt><img src="/static/public/images/b1.jpg"/></dt>
									</dl>
									<dl>
										<dt><img src="/static/public/images/b2.jpg"/></dt>
									</dl>
									<dl>
										<dt><img src="/static/public/images/b3.jpg"/></dt>
									</dl>
									<dl>
										<dt><img src="/static/public/images/b4.jpg"/></dt>
									</dl>
								</div>
							</div>
							<span class="next"></span>
						</div>
					</div>
					<div class="main-comp-const-img" id="4compimg02" style="display:none;">
						<div id="product">
							<span class="prev"></span>
							<div id="content">
								<div id="content_list">
									<dl>
										<dt><img src="/static/public/images/b1.jpg"/></dt>
									</dl>
									<dl>
										<dt><img src="/static/public/images/b2.jpg"/></dt>
									</dl>
									<dl>
										<dt><img src="/static/public/images/b3.jpg"/></dt>
									</dl>
									<dl>
										<dt><img src="/static/public/images/b4.jpg"/></dt>
									</dl>
								</div>
							</div>
							<span class="next"></span>
						</div>
					</div>
					<div class="main-comp-const-img" id="4compimg03" style="display:none;">
						<div id="product">
							<span class="prev"></span>
							<div id="content">
								<div id="content_list">
									<dl>
										<dt><img src="/static/public/images/b1.jpg"/></dt>
									</dl>
									<dl>
										<dt><img src="/static/public/images/b2.jpg"/></dt>
									</dl>
									<dl>
										<dt><img src="/static/public/images/b3.jpg"/></dt>
									</dl>
									<dl>
										<dt><img src="/static/public/images/b4.jpg"/></dt>
									</dl>
								</div>
							</div>
							<span class="next"></span>
						</div>
					</div>
					<div class="main-comp-const-img" id="4compimg04" style="display:none;">
						<div id="product">
							<span class="prev"></span>
							<div id="content">
								<div id="content_list">
									<dl>
										<dt><img src="/static/public/images/b1.jpg"/></dt>
									</dl>
									<dl>
										<dt><img src="/static/public/images/b2.jpg"/></dt>
									</dl>
									<dl>
										<dt><img src="/static/public/images/b3.jpg"/></dt>
									</dl>
									<dl>
										<dt><img src="/static/public/images/b4.jpg"/></dt>
									</dl>
								</div>
							</div>
							<span class="next"></span>
						</div>
					</div>
					<div class="ico">
						<div style="width:100%;height:28px;border-top:5px solid #000;margin-top: 30px;">
							<img id="xx_img04" src="/static/public/images/xx.png" style="position: relative; top: -5px;"/>
						</div>
					</div>
					<div class="main-comps">
						<div class="main-comps-list" id="4list01">
							<img src="/static/public/images/cry.png" />
							<img src="/static/public/images/lenovo.png" width="88" height="30" style="position: relative; top: -65px;"/>
						</div>
						<div class="main-comps-list" id="4list02">
							<img src="/static/public/images/cry.png" />
							<img src="/static/public/images/lenovo.png" width="88" height="30" style="position: relative; top: -65px;"/>
						</div>
						<div class="main-comps-list" id="4list03">
							<img src="/static/public/images/cry.png" />
							<img src="/static/public/images/lenovo.png" width="88" height="30" style="position: relative; top: -65px;"/>
						</div>
						<div class="main-comps-list" id="4list04">
							<img src="/static/public/images/cry.png" />
							<img src="/static/public/images/lenovo.png" width="88" height="30" style="position: relative; top: -65px;"/>
						</div>
					</div>
				</div>
			</c:if>
		</div>
		<div class="main-ourteam-cont-title">
			<!-- <i style="width: 56px; height: 64px; background: url(/static/public/images/ic2.png); display: inline-block; position: relative; top: 5px; margin-right: 5px;"></i> -->
			<img src="/static/public/images/ic2.png" style="width:35px; position: relative; top: 13px;"/>
			<a id="cust" href="/cust.jhtml" style="font-size: 24px; position: relative;" target="_blank">客户感言见证</a>
		</div>
		<div style="width:1920px;height:380px;overflow:hidden;margin:0 auto;">
			<div class="main-partner">
				<div class="partner_img">
				<!-- <img src="/static/public/images/img03.jpg" width="1366" /> -->
				<c:if test="${partnersSize!=0 }">
					<c:forEach items="${partners }" var="partner" varStatus="status">
						<c:if test="${status.index < 3}">
							<div id="embed0${status.index+1 }" <c:if test="${status.index > 0 }">style="display:none;"</c:if> class="video_div">
								<c:if test="${partner.videoLink ==null || partner.videoLink =='' }">
									 <embed id="ckplayer_a1" align="middle" width="352" height="201" 
										pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" name="ckplayer_a1" 
										flashvars="f=${www_prefix}/${partner.video }" 
										src="http://www.ckplayer.com/ckplayer/6.5/ckplayer.swf" wmode="transparent" bgcolor="#FFF" 
										quality="high" allowfullscreen="true" allowscriptaccess="always" style="position: relative; left: 13px; top: 13px;"/>
								</c:if>
								<c:if test="${partner.videoLink !=null && partner.videoLink !='' }">
									<embed src="${partner.videoLink }" style="width:352px;height:201px;" style="position: relative; top: 13px; left: 13px;"/>
								</c:if>
							</div>
							<div id="m_img0${status.index+1 }" <c:if test="${status.index > 0 }">style="display:none;"</c:if> class="video_img">
								<img data-original="${partner.path }" src="/static/public/images/grey.gif" width="123" height="160"/>
							</div>
						</c:if>
					</c:forEach>
				</c:if>
				<img src="/static/public/images/pingjiawenzi.png" style="position: relative; top: -450px; left: 90px;"/>
				<a href="/cust.jhtml" target="_blank">
					<div class="more_partner" title="更多">&nbsp;</div>
				</a>
				</div>
			</div>
		</div>
		<div class="main-evaluation">
			<div class="main-evaluation-list">
				<c:if test="${partnersSize!=0 }">
					<c:forEach items="${partners }" var="partner" varStatus="status">
						<c:if test="${status.index < 3}">
							<div class="main-evaluation-list-cont">
								<div id="cont-img0${status.index+1 }" class="main-evaluation-list-cont-img">
									<img data-original="${partner.logo }" src="/static/public/images/grey.gif" width="115" height="50" style="margin-top: 40px;" />
								</div>
								<div class="main-evaluation-list-cont-dis" style="height:130px;">
									<p class="main-cont-dis-title">${partner.name }</p>
									<p class="main-cont-dis-conts">
										${fn:substring(partner.content, 0, 20)}
										<c:if test="${fn:length(partner.content) > 20 }">
						   					...
					   					</c:if>
									</p>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</c:if>
				<c:if test="${partnersSize==0 }">
					<div class="main-evaluation-list-cont">
						<div id="cont-img01" class="main-evaluation-list-cont-img">
							<img src="/static/public/images/66.jpg" width="115" height="50" style="margin-top: 40px;" />
						</div>
						<div class="main-evaluation-list-cont-dis">
							<p class="main-cont-dis-title"> 而阿强发生范德萨发大水</p>
							<p class="main-cont-dis-conts">分公司范德萨罚多少高峰时段罚多少过分的是</p>
						</div>
					</div>
					<div id="embed01" class="em_video">
						<embed type="application/x-shockwave-flash" width="372" height="215" 
							src="http://player.youku.com/player.php/sid/XMzI1ODcwODQw/v.swf" allowfullscreen="true" 
							quality="high" allowscriptaccess="always" align="middle" />
					</div>
					<div id="m_img01" style="width: 132px; height: 174px; position: absolute; top: 2121px; left: 1045px;">
						<img src="/static/public/images/b2.jpg" width="132" height="174"/>
					</div>
					<div class="main-evaluation-list-cont">
						<div id="cont-img02" class="main-evaluation-list-cont-img">
							<img src="/static/public/images/44.jpg" width="115" height="50" style="margin-top: 40px;" />
						</div>
						<div class="main-evaluation-list-cont-dis">
							<p class="main-cont-dis-title"> 而阿强发生范德萨发大水</p>
							<p class="main-cont-dis-conts">分公司范德萨罚多少高峰时段罚多少过分的是</p>
						</div>
					</div>
					<div id="embed02" class="em_video">
						<embed type="application/x-shockwave-flash" width="372" height="215" 
							src="http://player.youku.com/player.php/sid/XMzI1ODcwODQw/v.swf" allowfullscreen="true" 
							quality="high" allowscriptaccess="always" align="middle" />
					</div>
					<div id="m_img02" style="width: 132px; height: 174px; position: absolute; top: 2121px; left: 1045px;">
						<img src="/static/public/images/b3.jpg" width="132" height="174"/>
					</div>
					<div class="main-evaluation-list-cont">
						<div id="cont-img03" class="main-evaluation-list-cont-img">
							<img src="/static/public/images/55.jpg" width="115" height="50" style="margin-top: 40px;" />
						</div>
						<div class="main-evaluation-list-cont-dis">
							<p class="main-cont-dis-title"> 而阿强发生范德萨发大水</p>
							<p class="main-cont-dis-conts">分公司范德萨罚多少高峰时段罚多少过分的是</p>
						</div>
					</div>
					<div id="embed03" class="em_video">
						<embed type="application/x-shockwave-flash" width="372" height="215" 
							src="http://player.youku.com/player.php/sid/XMzI1ODcwODQw/v.swf" allowfullscreen="true" 
							quality="high" allowscriptaccess="always" align="middle" />
					</div>
					<div id="m_img03" style="width: 132px; height: 174px; position: absolute; top: 2121px; left: 1045px;">
						<img src="/static/public/images/b1.jpg" width="132" height="174"/>
					</div>
				</c:if>
			</div>
		</div>
		<div class="main-ourteam">
			<div class="main-ourteam-cont">
				<div class="main-ourteam-cont-title">
					<!-- <i style="width: 54px; height: 65px; background: url(/static/public/images/hxtd.png); display: inline-block; position: relative; top: 5px; margin-right: 5px;"></i> -->
					<img src="/static/public/images/hxtd.png" style="width: 35px; position: relative; top: 10px;" />
					<a href="/teamList.jhtml" target="_blank" style="font-size: 24px; position: relative; ">我们的核心团队</a>
				</div>
				<div class="main-ourteam-cont-const">
					<c:if test="${tsize!=0 }">
						<c:forEach items="${teams }" var="team" varStatus="status">
							<c:if test="${status.index < 4 }">
								<div class="main-ourteam-cont-const-list" <c:if test="${status.index ==3 }">style="margin-right:0;"</c:if>>
									<div class="img">
										<img data-original="${team.path }" src="/static/public/images/grey.gif" width="165" height="165" style="margin-top: 35px;" />
									</div>
									<div class="name">
										<span style="font-size: 18px;">${team.name } | ${team.ehName }</span>
										<p>${team.position }</p>
									</div>
									<div class="dis" title="${team.content }">
										${fn:substring(team.content, 0, 50)}
										<c:if test="${fn:length(team.content) > 50 }">
						   					...
					   					</c:if>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</c:if>
					<c:if test="${tsize==0 }">
						<div class="main-ourteam-cont-const-list">
							<div class="img">
								<img src="/static/public/images/img04.jpg" style="margin-top: 35px;" />
							</div>
							<div class="name">
								<span style="font-size: 18px;">张三 | zhangsan</span>
								<p>总经理</p>
							</div>
							<div class="dis">
								大厦范德萨范德萨房东宾馆饭店你会感到该罚的
							</div>
						</div>
						<div class="main-ourteam-cont-const-list">
							<div class="img">
								<img src="/static/public/images/img04.jpg" style="margin-top: 35px;" />
							</div>
							<div class="name">
								<span style="font-size: 18px;">张三 | zhangsan</span>
								<p>总经理</p>
							</div>
							<div class="dis">
								大厦范德萨范德萨房东宾馆饭店你会感到该罚的
							</div>
						</div>
						<div class="main-ourteam-cont-const-list">
							<div class="img">
								<img src="/static/public/images/img04.jpg" style="margin-top: 35px;" />
							</div>
							<div class="name">
								<span style="font-size: 18px;">张三 | zhangsan</span>
								<p>总经理</p>
							</div>
							<div class="dis">
								大厦范德萨范德萨房东宾馆饭店你会感到该罚的
							</div>
						</div>
						<div class="main-ourteam-cont-const-list" style="margin-right:0;">
							<div class="img">
								<img src="/static/public/images/img04.jpg" style="margin-top: 35px;" />
							</div>
							<div class="name">
								<span style="font-size: 18px;">张三 | zhangsan</span>
								<p>总经理</p>
							</div>
							<div class="dis">
								大厦范德萨范德萨房东宾馆饭店你会感到该罚的
							</div>
						</div>
					</c:if>
					<img id="zuojiantou" src="/static/public/images/a.png" />
					<img id="youjiantou" src="/static/public/images/b.png" />
					<div id="hengxian"></div>
				</div>
			</div>			
		</div>
		<div class="main-tp">
			<div class="main-tp-cont">
				<p class="main-tp-title">
					<i style="width: 31px; height: 28px; background: url(/static/public/images/lc.png); display: inline-block; position: relative; top: 5px; margin-right: 5px;"></i>
					<a id="liucheng" style="font-size: 24px;" href="/serviceProcess.jhtml" target="_blank">我们的流程</a>
				</p>
				<div style="">
					<img src="/static/public/images/img06.png" style="position: relative; left: 500px;" />
					<img data-original="/static/public/images/a1.jpg" src="/static/public/images/grey.gif"  style="position: relative; left: 507px; top: -965px;"/>
					<img data-original="/static/public/images/a2.jpg" src="/static/public/images/grey.gif"   style="margin-top: 50px; position: relative; top: -725px; left: -355px;"/>
					<img data-original="/static/public/images/a3.jpg" src="/static/public/images/grey.gif"   style="position: relative; left: 560px; top: -870px;"/>
			 		<img data-original="/static/public/images/a4.jpg" src="/static/public/images/grey.gif"   style="position: relative; left: -315px; top: -660px;"/>
					<img data-original="/static/public/images/a5.jpg" src="/static/public/images/grey.gif"   style="position: relative; top: -760px; left: 555px;"/>
					<img data-original="/static/public/images/a6.jpg" src="/static/public/images/grey.gif"   style="position: relative; left: -437px; top: -615px;"/>
				</div>
				<c:if test="${prosSize!=0 }">
					<c:forEach items="${pros }" var="pro" varStatus="status">
						<div class="img_a${status.index+1 }">
							<span>
								${fn:substring(pro.cn, 0, 30)}
								<c:if test="${fn:length(pro.cn) > 30 }">
				   					...
			   					</c:if>
							</span>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${prosSize==0 }">
					<div class="img_a1">
						<span>控制流程</span>
					</div>
					<div class="img_a2">
						<span>第一步</span>tep</span>
					</div>
					<div class="img_a3">
						<span>第二步</span>
					</div>
					<div class="img_a4">
						<span>第三步</span>
					</div>
					<div class="img_a5">
						<span>第四步</span>
					</div>
					<div class="img_a6">
						<span>第五步</span>
					</div>
				</c:if>
			</div>
		</div>
		<%-- <div class="main-oye">
			<div style="width:1100px;height:auto;overflow:hidden;margin:0 auto 30px;">
				<div class="main-ourteam-cont-title">
					<i style="width: 31px; height: 28px; background: url(/static/public/images/lc.png); display: inline-block; position: relative; top: 5px; margin-right: 5px;"></i>
					<a id="zhizhi" href="/contactusInfo.jhtml" target="_blank" style="font-size: 24px;">关于欧耶</a>
				</div>
				<div class="main-oye-content">
					${oyEInfo.content }
				</div>
			</div>
		</div> --%>
		<div class="main-cust">
			<div style="width:1100px;height:435px;overflow:hidden;margin:0 auto 30px;">
				<div class="main-ourteam-cont-title">
					<!-- <i style="width: 64px; height: 54px; background: url(/static/public/images/3333.png); display: inline-block; position: relative; top: 5px; margin-right: 5px;"></i> -->
					<img src="/static/public/images/3333.png" style="width:35px;" />
					<a href="/customerList.jhtml" target="_blank" style="font-size: 24px; position: relative;top: -8px;">我们的客户</a>
				</div>
				<c:if test="${customersSize!=0 }">
					<div class="main-ourteam-cont-list">
						<c:forEach items="${customerType1}" var="cust1" varStatus="status">
							<c:if test="${status.index < 6 }">
								<div class="ot">
									<div class="main-ourteam-cont-list-img">
										<a href="${cust1.clink }" title="${cust1.clink }" target="_blank">
											<img data-original="${cust1.url }" src="/static/public/images/grey.gif" width="95" height="50"/>
										</a>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<div class="main-ourteam-cont-list" style="margin-top: -20px; width: 735px;">
						<c:forEach items="${customerType2}" var="cust1" varStatus="status">
							<c:if test="${status.index < 5 }">
								<div class="ot">
									<div class="main-ourteam-cont-list-img">
										<a href="${cust1.clink }" title="${cust1.clink }" target="_blank">
											<img data-original="${cust1.url }" src="/static/public/images/grey.gif" width="95" height="50"/>
										</a>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<div class="main-ourteam-cont-list" style="margin-top: -20px;">
						<c:forEach items="${customerType3}" var="cust1" varStatus="status">
							<c:if test="${status.index < 6 }">
								<div class="ot">
									<div class="main-ourteam-cont-list-img">
										<a href="${cust1.clink }" title="${cust1.clink }" target="_blank">
											<img data-original="${cust1.url }" src="/static/public/images/grey.gif" width="95" height="50"/>
										</a>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</c:if>
				<c:if test="${customersSize==0 }">
					<img data-original="/static/public/images/Customer.jpg" src="/static/public/images/grey.gif" width="1100px"/>
				</c:if>
			</div>
		</div>
		<div class="main-aboutus" style="background: #505050;height: auto;">
			<div style="width: 1180px;height: auto;overflow: hidden;margin: 0 auto;">
				<div class="aboutus" style="width: 380px;height: auto;overflow: hidden;float: left; margin-bottom: 50px;">
					<div style="height: 45px;line-height: 45px;color: #EF738B;border-bottom: 1px solid #868686;">
						<div style="float:left;width: 80px;height:45px;line-height: 45px;border-bottom: 1px solid #EF738B;text-align: center;">
							关于欧耶
						</div>
						<div style="float:right;width:50px;">
							<a href="/oyeInfo.jhtml" style="color:#fff;" target="_blank">更多&gt;&gt;</a>
						</div>
					</div>
						<div style="">
							<c:if test="${contactusInfo!=null }">
								<img data-original="${contactusInfo.path }" src="/static/public/images/grey.gif" width="185" height="130" style="float: left;margin: 15px 15px 15px 0;" />
								<span class="abus" style="color: #d6d6d6;line-height: 27px;">
									${fn:substring(contactusInfo.content, 0, 120)}
									<c:if test="${fn:length(contactusInfo.content) > 120 }">
					   					...
				   					</c:if>
								</span>
							</c:if>
							<c:if test="${contactusInfo==null }">
								<img data-original="/static/public/images/img08.jpg" src="/static/public/images/grey.gif" width="185" height="130" style="float: left;margin: 15px 15px 15px 0;" />
								<span style="color: #d6d6d6;line-height: 27px;">萨芬的该罚的过分的是光的反射热二期飞洒范德萨发大水地方撒电范德萨发大水芬的该罚的过分的是光的反射热二期飞洒范德萨发大水地方撒电范德萨发大水芬的该罚的过分的是光的反射热二期飞洒范德萨发大水地方撒电范德萨发大水芬的该萨发大水地方撒电范德萨发大水地方撒电范德萨发大水地方撒电范德萨发大水地方撒电范德萨发大水地方撒电风扇</span>
							</c:if>
						</div>
				</div>
				<div class="aboutus" style="width: 360px;height: auto;overflow: hidden;float: left;">
					<div style="height: 45px;line-height: 45px;color: #EF738B;border-bottom: 1px solid #868686;">
						<div style="width: 80px;height:45px;line-height: 45px;border-bottom: 1px solid #EF738B;text-align: center;">
							<a id="news" style="color:#ef738b;">最新动态</a>
						</div>
						<a href="/newsList.jhtml?type=0" target="_blank" style="float: right; position: relative; top: -46px;color:#fff;">更多&gt;&gt;</a>
					</div>
					<div style="">
						<c:if test="${newsSize!=0 }">
							<c:forEach items="${news }" var="news" varStatus="status">
								<c:if test="${status.index < 3 }">
									<div style="width: 365px;height: auto;overflow: hidden;">
										<img data-original="${news.path }" src="/static/public/images/grey.gif" width="100" height="80" style="float: left; margin: 15px 20px 10px 0px;"/>
										<div style="float: left;width: 240px;margin-top: 10px;">
											<p style="color: #FBFBFB;font-size: 15px;">${news.title }</p>
											<p style="color: #FBFBFB;font-size: 14px;">
												<%-- ${news.content } --%>
												${fn:substring(news.content, 0, 30)}...
											</p>
											<div style="background: #FF6569;color: #FFFFFF;width: 75px;height: 27px;line-height: 27px;text-align: center;border-radius: 4px;float: right;margin-right: 20px;">
												<a href="/newsInfo.jhtml?id=${news.id }" title="更多">
													<img src="/static/public/images/more.jpg" height="27"/>
												</a>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</c:if>
						<c:if test="${newsSize==0 }">
							<div style="width: 365px;height: auto;overflow: hidden;">
								<img src="/static/public/images/img08.jpg" width="100" height="80" style="float: left; margin: 15px 20px 10px 0px;"/>
								<div style="float: left;width: 240px;margin-top: 10px;">
									<p style="color: #FBFBFB;font-size: 15px;">房贷首付是的萨芬</p>
									<p style="color: #FBFBFB;font-size: 14px;">
										三大法该罚的好地方法倒萨范德萨放大发大水的萨芬打算范德萨萨芬...
									</p>
									<div style="background: #FF6569;color: #FFFFFF;width: 75px;height: 27px;line-height: 27px;text-align: center;border-radius: 4px;float: right;margin-right: 20px;">
										<a href="#" title="更多">
											<img src="/static/public/images/more.jpg" height="27"/>
										</a>
									</div>
								</div>
							</div>
							<div style="width: 365px;height: auto;overflow: hidden;">
								<img src="/static/public/images/img08.jpg" width="100" height="80" style="float: left; margin: 15px 20px 10px 0px;"/>
								<div style="float: left;width: 240px;margin-top: 10px;">
									<p style="color: #FBFBFB;font-size: 15px;">房贷首付是的萨芬</p>
									<p style="color: #FBFBFB;font-size: 14px;">
										三大法该罚的好地方法倒萨范德萨放大发大水的萨芬打算范德萨萨芬...
									</p>
									<div style="background: #FF6569;color: #FFFFFF;width: 75px;height: 27px;line-height: 27px;text-align: center;border-radius: 4px;float: right;margin-right: 20px;">
										<a href="#" title="更多">
											<img src="/static/public/images/more.jpg" height="27"/>
										</a>
									</div>
								</div>
							</div>
							<div style="width: 365px;height: auto;overflow: hidden;">
								<img src="/static/public/images/img08.jpg" width="100" height="80" style="float: left; margin: 15px 20px 10px 0px;"/>
								<div style="float: left;width: 240px;margin-top: 10px;">
									<p style="color: #FBFBFB;font-size: 15px;">房贷首付是的萨芬</p>
									<p style="color: #FBFBFB;font-size: 14px;">
										三大法该罚的好地方法倒萨范德萨放大发大水的萨芬打算范德萨萨芬...
									</p>
									<div style="background: #FF6569;color: #FFFFFF;width: 75px;height: 27px;line-height: 27px;text-align: center;border-radius: 4px;float: right;margin-right: 20px;">
										<a href="#" title="更多">
											<img src="/static/public/images/more.jpg" height="27"/>
										</a>
									</div>
								</div>
							</div>
						</c:if>
					</div>
				</div>
				<div class="aboutus" style="width: 380px;height: auto;overflow: hidden;float: left;margin-right: 0;">
					<div style="height: 45px;line-height: 45px;color: #EF738B;border-bottom: 1px solid #868686;">
						<div style="width: 80px;height:45px;line-height: 45px;border-bottom: 1px solid #EF738B;text-align: center;">
							<a id="zixun" style="color:#ef738b;">在线咨询</a>
						</div>
					</div>
					<div style="text-align: center;">
						<input class="input" type="text" id="name" name="name" placeholder="姓名" style="margin-top: 10px;" />
						<input class="input" type="text" id="phone" name="phone" placeholder="手机" />
						<input class="input" type="text" id="email" name="email" placeholder="邮箱" />
						<input class="input" type="text" id="title" name="title" placeholder="标题" />
						<textarea class="input" id="content_a" name="content" maxlength="1000" style="height: 125px;resize: none;overflow-y: hidden;" placeholder="内容填写"></textarea>
						<input class="botton" type="submit" value="提交" />
						<script type="text/javascript">
							$(function(){
								$("input[type=submit]").click(function(){
									if($("#name").val() ==""){
										alert("请输入姓名");
									}else if($("#phone").val() == ""){
										alert("请输入手机号");
									}else if(!$("#phone").val().match(/^1[3|4|5|8][0-9]\d{4,8}$/)){
										alert("手机号格式不正确");
									}else if($("#email").val() == ""){
										alert("请输入邮箱");
									}else if (!$("#email").val().match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/)){
										alert("邮箱格式不正确");
									}else if($("#title").val() == ""){
										alert("请输入标题");
									}else if($("#content_a").val() == ""){
										alert("请输入内容");
									}else{
										$.ajax({
											type : "post",
											url : "/message/add.jhtml",
											dataType : "json",
											contentType:"application/x-www-form-urlencoded",
											data :{"name":$("#name").val(),"phone":$("#phone").val(),"email":$("#email").val(),"title":$("#title").val(),"content":$("#content_a").val()} ,
											success : function(map) {
												alert(map.msg);
											}
										});
										alert("提交成功，等待审核!");
									}
								});
								$(".bx-prev").css("margin-left","100px");
								$(".bx-next").css("margin-right","100px");
								//alert(screen.width);
							});
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--
       	作者：1213569843@qq.com
       	时间：2014-11-04
       	描述：页尾
       -->
	<jsp:include page="footer.jsp" />
</body>
</html>
