package cn.believeus.controller;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
	@RequestMapping(value="")
	public String add(Tmember member){
		baseService.saveOrUpdata(member);
		return "/WEB-INF/front/perfectInfo.jsp";
	}

}
