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
	
	@RequestMapping(value="/baseSearch")
	public String baseSearch(HttpServletRequest request){
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		String sex = request.getParameter("sex");
		String ageRange = request.getParameter("ageRange");
		String heightRange = request.getParameter("heightRange");
		String province = request.getParameter("province");
		String city = request.getParameter("city");
		Page<Tmember> page =  memberService.getMemberListByBaseInfo(sex,ageRange,heightRange,province,city, pageNumber);
		request.setAttribute("memberList", page.getContent());
		request.setAttribute("size",page.getTotal());
		request.setAttribute("sex", request.getParameter("sex"));
		if(!StringUtils.isEmpty(ageRange)){
			request.setAttribute("ageRange", ageRange);
		}
		if(!StringUtils.isEmpty(heightRange)){
			request.setAttribute("yearSalary", heightRange);
		}
		if(!StringUtils.isEmpty(province)){
			request.setAttribute("houseCase", province);
		}
		if(!StringUtils.isEmpty(city)){
			request.setAttribute("unitNature", city);
		}
		// 分页
		PaginationUtil.pagination(request, page.getPageNumber(),page.getTotalPages(), 0);
		return "/WEB-INF/front/list.jsp";
	}

}
