package cn.believeus.admin.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import mydfs.storage.server.MydfsTrackerServer;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.junit.Assert;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import cn.believeus.PaginationUtil.Page;
import cn.believeus.PaginationUtil.Pageable;
import cn.believeus.PaginationUtil.PaginationUtil;
import cn.believeus.model.Tmember;
import cn.believeus.service.BaseService;

@Controller
public class MemberController {
	
	private static final Log log=LogFactory.getLog(MemberController.class);
	
	@Resource
	private MydfsTrackerServer mydfsTrackerServer;
	
	@Resource
	private BaseService baseService;

	/**
	 * 新闻列表
	 * @return
	 */
	@RequiresPermissions("newsDinamic:view")
	@RequestMapping(value="/admin/member/list")
	public String list(HttpServletRequest request){
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		/*Pageable pageable=new Pageable(Integer.valueOf(pageNumber),20);
		String hql="From Admin";
		Page<?> page = baseService.findObjectList(hql, pageable);
		// 分页
		PaginationUtil.pagination(request, page.getPageNumber(),page.getTotalPages(), 0);*/

		return "/WEB-INF/back/member/list.jsp";
	}
	
	/**
	 * 新闻添加
	 * @return
	 */
	@RequiresPermissions("newsDinamic:create")
	@RequestMapping(value="/admin/member/add")
	public String add(){
		return "/WEB-INF/back/member/add.jsp";
	}
	
	/**
	 * 新闻保存
	 * @return
	 * */
	@RequestMapping(value="/admin/member/save")
	public String save(HttpServletRequest request){
		String username=request.getParameter("username");
		char sex=request.getParameter("sex").charAt(0);
		String career=request.getParameter("career");
		String idCard=request.getParameter("idCard");
		String nickName=request.getParameter("nickName");
		String birthday=request.getParameter("birthday");
		String residentPlace=request.getParameter("residentPlace");
		String marriageCase=request.getParameter("marriageCase");
		String degree=request.getParameter("degree");
		String yearSalary=request.getParameter("yearSalary");
		String asset=request.getParameter("asset");
		String carCase=request.getParameter("carCase");
		String houseCase=request.getParameter("houseCase");
		Tmember member=new Tmember();
		member.setUsername(username);
		member.setSex(sex);
		member.setCareer(career);
		member.setIdCard(idCard);
		member.setCarCase(carCase);
		member.setMarriageCase(marriageCase);
		member.setAsset(asset);
		member.setNickName(nickName);
		member.setResidentPlace(residentPlace);
		member.setDegree(degree);
		member.setYearSalary(yearSalary);
		member.setCarCase(carCase);
		member.setHouseCase(houseCase);
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		String storepath = "";
		Map<String, MultipartFile> files = multipartRequest.getFileMap();
		for (MultipartFile file : files.values()) {
			InputStream inputStream;
			try {
				inputStream = file.getInputStream();
				if(inputStream.available()==0){
					break;
				}
				String originName=file.getOriginalFilename();
				String extention = originName.substring(originName.lastIndexOf(".") + 1);
				log.debug("upload file stuffix:"+extention);
				String formName=file.getName();
				storepath = mydfsTrackerServer.upload(inputStream, extention);
				if(formName.equals("artImage")){
					member.setArtImage(storepath);
				}else if (formName.equals("lifeImage")) {
					member.setLifeImage(storepath);
				}else if(formName.equals("workImage")) {
					member.setWorkImage(storepath);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		baseService.saveOrUpdata(member);
		return "redirect:/admin/member/list.jhtml";
	}
	
	/**
	 * 新闻修改
	 * @return
	 */
	@RequiresPermissions("newsDinamic:update")
	@RequestMapping(value="/admin/news/edit")
	public String edit(Integer myNewId, HttpServletRequest request){
		return "/WEB-INF/back/member/edit.jsp";
	}
	
	/**
	 * 新闻删除
	 * @return
	 */
	@RequiresPermissions("newsDinamic:delete")
	@RequestMapping(value="/admin/news/delete")
	public @ResponseBody String delete(Integer[] ids){
		List<Integer> list = Arrays.asList(ids); 
		return "{\"type\":\"success\"}";
	}
	
	/**
	 * 新闻置顶
	 * @return
	 */
	@RequiresPermissions("newsDinamic:update")
	@RequestMapping(value="/admin/news/top")
	public String newsTop(Integer myNewId, HttpServletRequest request){
		return "redirect:/admin/news/list.jhtml";
	}
	
	@RequiresPermissions("newsDinamic:update")
	@RequestMapping(value="/admin/news/down")
	public String downTop(Integer myNewId){
		return "redirect:/admin/news/list.jhtml";
	}
}