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
public class ControllerList {
	
	@Resource
	private BaseService baseService;
	
	@Resource
	private MemberService memberService;

	@RequestMapping(value="/memberList")
	public String list(HttpServletRequest request){
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),20);
		String hql= "from Tmember as entity order by editTime desc";
		Page<?> page = baseService.findObjectList(hql, pageable);
		request.setAttribute("memberList", page.getContent());
		request.setAttribute("size",page.getTotal());
		// 分页
		PaginationUtil.pagination(request, page.getPageNumber(),page.getTotalPages(), 0);
		return "/WEB-INF/front/list.jsp";
	}
	
	@RequestMapping(value="/search")
	public String search(HttpServletRequest request){
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),20);
		char sex = request.getParameter("sex").charAt(0);
		String ageRange = request.getParameter("ageRange");
		String yearSalary = request.getParameter("yearSalary");
		String houseCase = request.getParameter("houseCase");
		String unitNature = request.getParameter("unitNature");
		Tmember member = new Tmember();
		member.setYearSalary(yearSalary);
		member.setHouseCase(houseCase);
		member.setUnitNature(unitNature);
		member.setSex(sex);
		Page<Tmember> page =  memberService.getMemberList(member, ageRange, pageNumber);
		request.setAttribute("memberList", page.getContent());
		request.setAttribute("size",page.getTotal());
		request.setAttribute("sex", request.getParameter("sex"));
		if(!StringUtils.isEmpty(ageRange)){
			request.setAttribute("ageRange", ageRange);
		}
		if(!StringUtils.isEmpty(yearSalary)){
			request.setAttribute("yearSalary", yearSalary);
		}
		if(!StringUtils.isEmpty(houseCase)){
			request.setAttribute("houseCase", houseCase);
		}
		if(!StringUtils.isEmpty(unitNature)){
			request.setAttribute("unitNature", unitNature);
		}
		// 分页
		PaginationUtil.pagination(request, page.getPageNumber(),page.getTotalPages(), 0);
		return "/WEB-INF/front/list.jsp";
	}

}
