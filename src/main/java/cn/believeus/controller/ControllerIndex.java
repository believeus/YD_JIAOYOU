package cn.believeus.controller;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
