package cn.believeus.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.believeus.PaginationUtil.Page;
import cn.believeus.PaginationUtil.Pageable;
import cn.believeus.PaginationUtil.PaginationUtil;
import cn.believeus.model.Tmember;
import cn.believeus.service.BaseService;
import cn.believeus.service.MemberService;

/**
 * 列表页面
 * */
@Controller
public class ControllerDetailed {
	
	@Resource
	private BaseService baseService;
	
	@Resource
	private MemberService memberService;

	@RequestMapping(value="/memberInfo")
	public String memberInfo(HttpServletRequest request,Integer id){
		Tmember member = (Tmember) baseService.findObject(Tmember.class, id);
		request.setAttribute("member", member);
		return "/WEB-INF/front/detailed.jsp";
	}
	
	@RequestMapping(value="/findpassword")
	public String findpassword(HttpServletRequest request){
		String email = request.getParameter("email");
		return "/WEB-INF/front/findPassword.jsp";
	}
	
}
