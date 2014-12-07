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
		Tmember member=new Tmember();
		String id=request.getParameter("id");
		if (!StringUtils.isEmpty(id)) {
			member.setId(Integer.parseInt(id));
		}
		String sex=request.getParameter("sex");
		if(!StringUtils.isEmpty(sex)){
			member.setSex(sex.charAt(0));
		}
		String age_range = request.getParameter("age_range");
		String height_range = request.getParameter("height_range");
		member.setProvince(request.getParameter("province"));
		member.setCity(request.getParameter("city"));
		member.setUnitNature(request.getParameter("unitNature"));
		member.setCareer(request.getParameter("career"));
		member.setMarriageCase(request.getParameter("marriageCase"));
		member.setDegree(request.getParameter("degree"));
		member.setYearSalary(request.getParameter("yearSalary"));
		member.setAsset(request.getParameter("asset"));
		member.setCarCase(request.getParameter("carCase"));
		member.setHouseCase(request.getParameter("houseCase"));
		Page<Tmember> page =  memberService.findMemberListByBaseInfo(age_range,height_range,member, pageNumber);
		request.setAttribute("memberList", page.getContent());
		request.setAttribute("size",page.getTotal());
		request.setAttribute("sex", request.getParameter("sex"));
		if(!StringUtils.isEmpty(member.getProvince())){
			request.setAttribute("province", member.getProvince());
		}
		if(!StringUtils.isEmpty(member.getCity())){
			request.setAttribute("city", member.getCity());
		}
		if(!StringUtils.isEmpty(member.getUnitNature())){
			request.setAttribute("unitNature", member.getUnitNature());
		}
		if(!StringUtils.isEmpty(member.getCareer())){
			request.setAttribute("career", member.getCareer());
		}
		if(!StringUtils.isEmpty(member.getMarriageCase())){
			request.setAttribute("marriageCase", member.getMarriageCase());
		}
		if(!StringUtils.isEmpty(member.getDegree())){
			request.setAttribute("degree", member.getDegree());
		}
		if(!StringUtils.isEmpty(member.getYearSalary())){
			request.setAttribute("yearSalary", member.getYearSalary());
		}
		if(!StringUtils.isEmpty(member.getAsset())){
			request.setAttribute("asset", member.getAsset());
		}
		if(!StringUtils.isEmpty(member.getCarCase())){
			request.setAttribute("carCase", member.getCarCase());
		}
		if(!StringUtils.isEmpty(member.getHouseCase())){
			request.setAttribute("houseCase", member.getHouseCase());
		}
		if(!StringUtils.isEmpty(age_range)){
			request.setAttribute("age_range", age_range);
		}
		if(!StringUtils.isEmpty(height_range)){
			request.setAttribute("height_range", height_range);
		}
		
		// 分页
		PaginationUtil.pagination(request, page.getPageNumber(),page.getTotalPages(), 0);
		return "/WEB-INF/front/list.jsp";
	}

}
