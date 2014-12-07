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
	public Page<Tmember> findMemberListByBaseInfo(String age_range,String height_range,Tmember member,String pageNumber){
		String hql="from Tmember t_member ";
		if (StringUtils.isEmpty(member.getId())) {
			hql+=" where 1=1 ";
		}else {
			hql+=" where t_member.id !='"+member.getId()+"'";
		}
		// 性别
		if(!StringUtils.isEmpty(member.getSex())){
			hql+=" and t_member.sex='"+member.getSex()+"' ";
		}
		// 年龄范围
		if(!StringUtils.isEmpty(age_range)){
			String[] ages = age_range.split("-");
			hql+=" and t_member.age>='"+ages[0]+"' and t_member.age<='"+ages[1]+"' ";
		}
		// 身高
		if(!StringUtils.isEmpty(height_range)){
			String[] heights=height_range.split("-");
			hql+="and t_member.height >='"+heights[0]+"' and t_member.height <='"+heights[1]+"'";
		}
		//省
		if(!StringUtils.isEmpty(member.getProvince())){
			hql+=" and t_member.province='"+member.getProvince()+"' ";
		}
		//市
		if(!StringUtils.isEmpty(member.getCity())){
			hql+=" and t_member.city='"+member.getCity()+"' ";
		}
		// 单位性质
		if(!StringUtils.isEmpty(member.getUnitNature())){
			hql+=" and t_member.unitNature='"+member.getUnitNature()+"' ";
		}
		// 职业类型
		if(!StringUtils.isEmpty(member.getCareer())){
			hql+=" and t_member.career='"+member.getCareer()+"' ";
		}
		//婚姻状况
		if(!StringUtils.isEmpty(member.getMarriageCase())){
			hql+=" and t_member.marriageCase='"+member.getMarriageCase()+"' ";
		}
		//学历
		if(!StringUtils.isEmpty(member.getDegree())){
			hql+=" and t_member.degree='"+member.getDegree()+"' ";
		}
		// 年薪
		if(!StringUtils.isEmpty(member.getYearSalary())){
			hql+=" and t_member.yearSalary='"+member.getYearSalary()+"' ";
		}
		//资产
		if(!StringUtils.isEmpty(member.getAsset())){
			hql+=" and t_member.asset='"+member.getAsset()+"' ";
		}
		//购车情况
		if(!StringUtils.isEmpty(member.getCarCase())){
			hql+=" and t_member.carCase='"+member.getCarCase()+"' ";
		}
		// 购房情况
		if(!StringUtils.isEmpty(member.getHouseCase())){
			hql+=" and t_member.houseCase='"+member.getHouseCase()+"' ";
		}
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),20);
		@SuppressWarnings("unchecked")
		Page<Tmember> page = (Page<Tmember>) findObjectList(hql, pageable);
		return page;
	}

}
