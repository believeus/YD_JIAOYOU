package cn.believeus.service;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import cn.believeus.PaginationUtil.Page;
import cn.believeus.PaginationUtil.Pageable;
import cn.believeus.model.Tmember;

@Service
public class MemberService extends BaseService{
	// 第一个参数:性别
	// 第二个参数:年龄范围
	// 第三个参数:身高
	// 第四个参数:学历
	// 第五个参数:职业
	// 第六个判断:资产
	public Page<Tmember> getMemberList(Tmember member,String ageRange,String pageNumber){
		String hql="from Tmember t_member where 1=1 ";
		// 性别
		if(!StringUtils.isEmpty(member.getSex())){
			hql+=" and t_member.sex='"+member.getSex()+"' ";
		}
		// 年龄范围
		if(!StringUtils.isEmpty(ageRange)){
			String[] ages = ageRange.split("-");
			hql+=" and t_member.age>='"+ages[0]+"' and t_member.age<='"+ages[1]+"' ";
		}
		// 身高
		if(!StringUtils.isEmpty(member.getHeight())){
			hql+="and t_member.height ='"+member.getHeight()+"' ";
		}
		//学历
		if(!StringUtils.isEmpty(member.getDegree())){
			hql+="and t_member.t_member='"+member.getDegree()+"' ";
		}
		//职业
		if(!StringUtils.isEmpty(member.getCareer())){
			hql+="and t_member.career='"+member.getCareer()+"' ";
		}
		//年薪
		if(!StringUtils.isEmpty(member.getYearSalary())){
			hql+="and t_member.yearSalary='"+member.getYearSalary()+"' ";
		}
		//资产
		if(!StringUtils.isEmpty(member.getAsset())){
			hql+="and t_member.asset='"+member.getAsset()+"' ";
		}
		if (!StringUtils.isEmpty(member.getUnitNature())) {
			hql+="and t_member.unitNature='"+member.getUnitNature()+"' ";
		}
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),20);
		@SuppressWarnings("unchecked")
		Page<Tmember> page = (Page<Tmember>) findObjectList(hql, pageable);
		return page;
	}

}
