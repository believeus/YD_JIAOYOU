;(function(window,$){
	$(function(){
		 var index=1,
		 	 wid = $('#uls li:first').outerWidth( true ),
		 	 timer,
		 	 str='',
		 	 li=$('#uls li'),
		 	 len=$('#uls li').size(),
		 	 step=1;
//初始化按钮
	for( var i=1; i<=len; i++ ){
		if( i==1){
			str += '<li class="cur">'+'</li>';
		}else{
			str += '<li>'+'</li>';
		}
	} 
	$('#yuan').append( str );

	li.slice(0,step).clone().appendTo( $('#uls') );
	li.slice(-step).clone().prependTo( $('#uls') );
	$('#uls').css({marginLeft:-wid});
//点击左按钮图右移
	$('.left').bind('click',function(){ play( index-1) });
//点击右按钮图左移
	$('.right').bind('click',function(){ play( index+1) });

//动画函数
	function play( num ){
		//if(!$('#uls').is(':animated')){
			var dir = num>index ?-1:1;
		
			$('#uls').animate({marginLeft:'+='+wid*dir},300,function(){
				
					if( num>len ){
						num=1;
						$('#uls').css({marginLeft:-wid});
					}else if( num<=0 ){
						num=len;
						$('#uls').css({marginLeft:-wid*len});
					}
					index=num;
				$('#yuan li').eq( index - 1).addClass( 'cur').siblings().removeClass('cur');
				$('.text').html( li.eq(index - 1).find('img').attr('pic'));
				 
			});
	//}
	}

	});	
})(window,jQuery)