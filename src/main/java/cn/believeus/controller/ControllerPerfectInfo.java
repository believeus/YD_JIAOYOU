package cn.believeus.controller;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.believeus.model.Tmember;
import cn.believeus.service.BaseService;

/**
 * 完善资料
 * */
@Controller
public class ControllerPerfectInfo {
	
	@Resource
	private BaseService baseService;
	
	@RequestMapping(value="/perfectInfo")
	public String perfectInfo(){
		return "/WEB-INF/front/perfectInfo.jsp";
	}

	@RequestMapping(value="/savePerfectInfo")
	public String savePerfectInfo(){
		System.out.println("--ss------");
		//baseService.saveOrUpdata(member);
		return "/WEB-INF/front/list.jsp";
	}
}
