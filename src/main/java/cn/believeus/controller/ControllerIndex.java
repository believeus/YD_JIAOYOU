package cn.believeus.controller;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String register(Tmember member,HttpSession session){
		String password = DigestUtils.md5Hex(member.getPassword());
		member.setPassword(password);
		baseService.saveOrUpdata(member);
		session.setAttribute("member", member);
		return "redirect:/perfectInfo.jhtml";
	}
	
	@RequestMapping(value="/login")
	public void login(HttpServletRequest request,HttpSession session,HttpServletResponse response){
		String phoneNum = request.getParameter("phoneNum");
		String password = DigestUtils.md5Hex(request.getParameter("password"));
		Map<String, Object> message=new HashMap<String, Object>();
		Tmember member = (Tmember)baseService.findObject(Tmember.class, "phoneNum", phoneNum);
		if (member==null) {
			message.put("message","用户名不存在!");
			JsonOutToBrower.out(message, response);
			return;
		}
		if (!password.equals(member.getPassword())) {
			message.put("message","密码错误!");
			JsonOutToBrower.out(message, response);
			return;
		}
		session.setAttribute("member", member);
		message.put("message","success");
		JsonOutToBrower.out(message, response);
	}

}
