package cn.believeus.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.believeus.common.email.MailBean;
import cn.believeus.common.email.MailSenderTemplete;
import cn.believeus.model.Tmember;
import cn.believeus.service.BaseService;
import cn.believeus.variables.Variables;

@Controller
public class ControllerSendMail {

	@Resource
	private MailSenderTemplete mailSenderTemplete;
	@Resource
	private BaseService baseService;
	@RequestMapping(value="/mailSend")
	public  @ResponseBody String sendMailTest(String phoneNum,String email){
		Tmember member=(Tmember)baseService.findObject(Tmember.class, Variables.PHONE_NUM, phoneNum);
		if(member!=null){
			MailBean mail=new MailBean();
			mail.setEmailTitle("查看密码");
			mail.setEmailTo(email);
			mail.setFromUserName("跨界天下");
			mail.setEmailContent("您好："+member.getNickName()+"您的密码是:"+member.getPassword());
			mailSenderTemplete.sendMail(mail);
		}
		return "您的密码已经发送到您的邮箱";
		
	}


}
