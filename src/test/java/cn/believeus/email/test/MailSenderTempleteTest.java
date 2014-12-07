package cn.believeus.email.test;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.believeus.common.email.MailBean;
import cn.believeus.common.email.MailSenderTemplete;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/applicationContext.xml")
public class MailSenderTempleteTest {
	@Resource
	private MailSenderTemplete mailSenderTemplete;
	@Test
	public void sendMailTest(){
		MailBean mail=new MailBean();
		mail.setEmailTitle("欢容你好");
		mail.setEmailTo("569009496@qq.com");
		mail.setFromUserName("跨界天下");
		mail.setEmailContent("欢容你好");
		mailSenderTemplete.sendMail(mail);
	}

}
