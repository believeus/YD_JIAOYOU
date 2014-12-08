/*
 * 
 * 
 * 
 * 
 * JavaScript - Input
 * Version: 3.0
 */

$().ready( function() {
	
	var $backButton = $("#backButton");
	
	if ($.tools != null) {
		var $tab = $("#tab");
		var $title = $("#inputForm :input[title], #inputForm label[title]");

		// Tab效果
		$tab.tabs("table.tabContent, div.tabContent", {
			tabs: "input"
		});
	
		// 表单提示
		$title.tooltip({
			position: "center right",
			offset: [0, 4],
			effect: "fade"
		});
	}
	
	// 返回上一页
	$backButton.click( function() {
		location.href = window.history.back();
		return false;
	});

	// 验证消息
	if($.validator != null) {
		$.extend($.validator.messages, {
		    required: message("必填"),
			email: message("admin.validate.email"),
			url: message("admin.validate.url"),
			date: message("admin.validate.date"),
			dateISO: message("admin.validate.dateISO"),
			pointcard: message("admin.validate.pointcard"),
			number: message("只允许输入数字"),
			digits: message("只允许输入整数"),
			minlength: $.validator.format(message("长度不允许小于{0}")),
			maxlength: $.validator.format(message("admin.validate.maxlength")),
			rangelength: $.validator.format(message("admin.validate.rangelength")),
			min: $.validator.format(message("不允许小于{0}")),
			max: $.validator.format(message("admin.validate.max")),
			range: $.validator.format(message("admin.validate.range")),
			accept: message("admin.validate.accept"),
			equalTo: message("admin.validate.equalTo"),
			remote: message("admin.validate.remote"),
			integer: message("admin.validate.integer"),
			positive: message("admin.validate.positive"),
			negative: message("admin.validate.negative"),
			decimal: message("admin.validate.decimal"),
			pattern: message("admin.validate.pattern"),
			extension: "文件格式错误"
		});
		
		$.validator.setDefaults({
			errorClass: "fieldError",
			ignore: ".ignore",
			ignoreTitle: true,
			errorPlacement: function(error, element) {
				var fieldSet = element.closest("span.fieldSet");
				if (fieldSet.size() > 0) {
					error.appendTo(fieldSet);
				} else {
					error.insertAfter(element);
				}
			},
			submitHandler: function(form) {
				$(form).find(":submit").prop("disabled", true);
				form.submit();
			}
		});
	}

	// 手机号码验证
	jQuery.validator.addMethod("isMobile", function(value, element) {
	  var length = value.length;
	  var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
	  return this.optional(element) || (length == 11 && mobile.test(value));
	}, "格式错误"); 
	
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
});

// 编辑器
if(typeof(KindEditor) != "undefined") {
	KindEditor.ready(function(K) {
		editor = K.create("#editor", {
			height: "350px",
			items: [
				"source", "|", "undo", "redo", "|", "preview", "print", "template", "cut", "copy", "paste",
				"plainpaste", "wordpaste", "|", "justifyleft", "justifycenter", "justifyright",
				"justifyfull", "insertorderedlist", "insertunorderedlist", "indent", "outdent", "subscript",
				"superscript", "clearhtml", "quickformat", "selectall", "|", "fullscreen", "/",
				"formatblock", "fontname", "fontsize", "|", "forecolor", "hilitecolor", "bold",
				"italic", "underline", "strikethrough", "lineheight", "removeformat", "|", "image",
				"flash", "media", "insertfile", "table", "hr", "emoticons", "baidumap", "pagebreak",
				"anchor", "link", "unlink"
			],
			langType: e3dmall.locale,
			syncType: "form",
			filterMode: false,
			pagebreakHtml: '<hr class="pageBreak" \/>',
			allowFileManager: true,
			filePostName: "file",
			uploadJson: "/EUpload.jhtml",
			uploadImageExtension: setting.uploadImageExtension,
			uploadFlashExtension: setting.uploadFlashExtension,
			uploadMediaExtension: setting.uploadMediaExtension,
			uploadFileExtension: setting.uploadFileExtension,
			extraFileUploadParams: {
				token: getCookie("token")
			},
			afterChange: function() {
				this.sync();
			}
		});
	});
}

// 图片预览
	function onUploadImgChange(sender,offsetWidth,offsetHeight,preview,preview_fake,preview_size_fake){     
	    if(!sender.value.match( /.jpg|.gif|.png|.bmp/i)){     
	        alert('图片格式无效！');     
	        $(sender).after($(sender).clone().val(""));
			$(sender).remove(); 	
	        return false;     
	    }     
	         
	    var objPreview = document.getElementById(preview);     
	    var objPreviewFake = document.getElementById(preview_fake);     
	    var objPreviewSizeFake = document.getElementById(preview_size_fake);    
	    if( sender.files &&  sender.files[0] ){  
	        var reader = new FileReader();
			reader.onload = function(evt){objPreview.src = evt.target.result;}
	        reader.readAsDataURL(sender.files[0]);	   
	        
	    }else if(objPreviewFake.filters){    
	        // IE7,IE8 在设置本地图片地址为 img.src 时出现莫名其妙的后果     
	        //（相同环境有时能显示，有时不显示），因此只能用滤镜来解决        
	        // IE7, IE8因安全性问题已无法直接通过 input[file].value 获取完整的文件路径     
	        sender.select();     
	        window.parent.document.body.focus();
	        var imgSrc = document.selection.createRange().htmlText;     
	        objPreviewFake.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = imgSrc;     
	        objPreviewSizeFake.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = imgSrc;     
	        autoSizePreview(objPreviewFake,offsetWidth,offsetHeight);     
	        objPreview.style.display = 'none';     
	    }     
	}     
	  
	function onPreviewLoad(sender,offsetWidth,offsetHeight){    
	    autoSizePreview( sender, offsetWidth, offsetHeight );     
	}     
	    
	function autoSizePreview( objPre, originalWidth, originalHeight ){     
	    var zoomParam = clacImgZoomParam( originalWidth, originalHeight, originalWidth, originalHeight );     
	    objPre.style.width = zoomParam.width + 'px';     
	    objPre.style.height = zoomParam.height + 'px';     
	}     
	    
	function clacImgZoomParam( maxWidth, maxHeight, width, height ){     
	    var param = { width:width, height:height, top:0, left:0 };     
	         
	    if( width>maxWidth || height>maxHeight ){     
	        rateWidth = width / maxWidth;     
	        rateHeight = height / maxHeight;     
	             
	        if( rateWidth > rateHeight ){     
	            param.width =  maxWidth;     
	            param.height = height / rateWidth;     
	        }else{     
	            param.width = width / rateHeight;     
	            param.height = maxHeight;     
	        }     
	    }     
	         
	    param.left = (maxWidth - param.width) / 2;     
	    param.top = (maxHeight - param.height) / 2;     
	         
	    return param;     
	}      
