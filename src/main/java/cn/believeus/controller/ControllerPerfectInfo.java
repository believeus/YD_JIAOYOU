package cn.believeus.controller;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
	public String savePerfectInfo(Integer id,HttpServletRequest request){
		String nickName = request.getParameter("nickName");
		char sex = request.getParameter("sex").charAt(0); 
		String yearSalary = request.getParameter("yearSalary");
		String houseCase = request.getParameter("houseCase");
		String unitNature = request.getParameter("unitNature");
		Tmember  member= (Tmember)baseService.findObject(Tmember.class, id);
		member.setNickName(nickName);
		member.setSex(sex);
		member.setYearSalary(yearSalary);   
		member.setHouseCase(houseCase);
		member.setUnitNature(unitNature);
		baseService.saveOrUpdata(member);
		return "/WEB-INF/front/list.jsp";
	}
}
