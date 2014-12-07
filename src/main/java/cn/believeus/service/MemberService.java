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
	public Page<Tmember> findMemberListByBaseInfo(String memberId,String sex,String age,String height,String province,String city,String pageNumber){
		String hql="from Tmember t_member ";
		if (StringUtils.isEmpty(memberId)) {
			hql+=" where 1=1 ";
		}else {
			hql+=" where t_member.id !='"+memberId+"'";
		}
		// 性别
		if(!StringUtils.isEmpty(sex)){
			hql+=" and t_member.sex='"+sex+"' ";
		}
		// 年龄范围
		if(!StringUtils.isEmpty(age)){
			String[] ages = age.split("-");
			hql+=" and t_member.age>='"+ages[0]+"' and t_member.age<='"+ages[1]+"' ";
		}
		// 身高
		if(!StringUtils.isEmpty(height)){
			String[] heights=height.split("-");
			hql+="and t_member.height >='"+heights[0]+"' and t_member.height <='"+heights[1]+"'";
		}
		//省
		if(!StringUtils.isEmpty(province)){
			hql+=" and t_member.province='"+province+"' ";
		}
		//市
		if(!StringUtils.isEmpty(city)){
			hql+=" and t_member.city='"+city+"' ";
		}
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),20);
		@SuppressWarnings("unchecked")
		Page<Tmember> page = (Page<Tmember>) findObjectList(hql, pageable);
		return page;
	}

}
