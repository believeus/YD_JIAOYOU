package cn.believeus.controller;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.believeus.util.JsonOutToBrower;

import cn.believeus.model.Tmember;
import cn.believeus.service.BaseService;

/**
 * 首页面
 * */
@Controller
public class ControllerIndex {
	
	@Resource
	private BaseService baseService;

	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request) {
		return "/WEB-INF/front/index.jsp";
	}
	
	@RequestMapping(value="/register")
	public void register(Tmember member,HttpSession session,HttpServletResponse response){
		Tmember tmember = (Tmember)baseService.findObject(Tmember.class, "phoneNum", member.getPhoneNum());
		Map<String, Object> message=new HashMap<String, Object>();
		if (tmember!=null) {
			message.put("message","手机号码已经注册！");
			JsonOutToBrower.out(message, response);
			return;
		}
/*		String password = DigestUtils.md5Hex(member.getPassword());
		member.setPassword(password);*/
		baseService.saveOrUpdata(member);
		session.setAttribute("member", member);
		message.put("message","success");
		JsonOutToBrower.out(message, response);
	}
	
	@RequestMapping(value="/ajaxComValidReg")
	public @ResponseBody String ajaxComValidReg(String phoneNum){
		Tmember tmember = (Tmember)baseService.findObject(Tmember.class, "phoneNum", phoneNum);
		if (tmember!=null) {
			return "false";
		}
		return "true";
	}
	
	@RequestMapping(value="/login")
	public void login(HttpServletRequest request,HttpSession session,HttpServletResponse response){
		String phoneNum = request.getParameter("phoneNum");
		String password = request.getParameter("password");
		/*String password = DigestUtils.md5Hex(request.getParameter("password"));*/
		Map<String, Object> message=new HashMap<String, Object>();
		Tmember member = (Tmember)baseService.findObject(Tmember.class, "phoneNum", phoneNum);
		if (member==null) {
			message.put("message","0");// 用户名不存在
			JsonOutToBrower.out(message, response);
			return;
		}
		if (!password.equals(member.getPassword())) {
			message.put("message","1");//密码错误！
			JsonOutToBrower.out(message, response);
			return;
		}
		session.setAttribute("member", member);
		message.put("message","success");
		JsonOutToBrower.out(message, response);
	}

}
