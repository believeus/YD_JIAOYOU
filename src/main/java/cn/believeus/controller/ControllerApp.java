package cn.believeus.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mydfs.storage.server.MydfsTrackerServer;

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
import cn.believeus.util.JsonOutToBrower;

@Controller
public class ControllerApp {

	@Resource
	private BaseService baseService;
	
	private MydfsTrackerServer mydfsTrackerServer;
	
	/**
	 * 注册
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request) {
		
		return "/WEB-INF/app/reg.jsp";
	}
	/**
	 * 登陆
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/login")
	public String login(HttpServletRequest request, HttpSession session,
			HttpServletResponse response) {
		return "/WEB-INF/app/login.jsp";
	}
	/**
	 * 完善资料
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/perfectInfo")
	public String perfectInfo(HttpSession session) {
		Tmember member = (Tmember)session.getAttribute("member");
		if (member.getNickName()!=null) {
			return "redirect:/memberList.jhtml";
		}
		return "/WEB-INF/app/perfectInfo.jsp";
	}
	/**
	 * 会员列表
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/memberList")
	public String memberList(HttpServletRequest request) {
		Tmember member = (Tmember)request.getSession().getAttribute("member");
		int id=member.getId();
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),20);
		String hql= "from Tmember as entity where entity.id !="+id+"order by editTime desc";
		Page<?> page = baseService.findObjectList(hql, pageable);
		request.setAttribute("memberList", page.getContent());
		request.setAttribute("size",page.getTotal());
		// 分页
		PaginationUtil.pagination(request, page.getPageNumber(),page.getTotalPages(), 0);
		return "/WEB-INF/app/list.jsp";
	}
	
	@RequestMapping(value="/savePerfectInfo")
	public String savePerfectInfo(Tmember member,HttpServletRequest request,HttpSession session){
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		String storepath = "";
		Map<String, MultipartFile> files = multipartRequest.getFileMap();
		for (MultipartFile file : files.values()) {
			InputStream inputStream;
			try {
				inputStream = file.getInputStream();
				if(inputStream.available()==0){
					continue;
				}
				String originName=file.getOriginalFilename();
				String extention = originName.substring(originName.lastIndexOf(".") + 1);
				String formName=file.getName();
				storepath = mydfsTrackerServer.upload(inputStream, extention);
				if(formName.equals("artImage1")){
					member.setArtImage(storepath);
				}else if (formName.equals("lifeImage1")) {
					member.setLifeImage(storepath);
				}else if(formName.equals("workImage1")) {
					member.setWorkImage(storepath);
				}else if (formName.equals("headerImg1")) {
					member.setHeaderImg(storepath);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		baseService.saveOrUpdata(member);
		session.setAttribute("member", member);
		return "redirect:/memberList.jhtml";
	}
	
	/**
	 * 会员信息
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/memberInfo")
	public String memberInfo(HttpServletRequest request,Integer id) {
		Tmember member = (Tmember) baseService.findObject(Tmember.class, id);
		request.setAttribute("member", member);
		return "/WEB-INF/app/memberInfo.jsp";
	}
	
	@RequestMapping("/app/ajaxPhone")
	public @ResponseBody String ajaxPhone(String phoneNum){
		Tmember user = (Tmember)baseService.findObject(Tmember.class, "phoneNum", phoneNum);
		if (user!=null) {
			return "exist";
		}else {
			return "unexist";
		}
	}
	
	@RequestMapping("/app/ajaxUser")
	public @ResponseBody String ajaxUser(String phoneNum){
		Tmember user = (Tmember)baseService.findObject(Tmember.class, "phoneNum", phoneNum);
		if (user!=null) {
			return "exist";
		}else {
			return "unexist";
		}
	}
	@RequestMapping("/app/ajaxPass")
	public @ResponseBody String ajaxPass(String phoneNum,String password){
		Tmember user = (Tmember)baseService.findObject(Tmember.class, "phoneNum", phoneNum);
		String pwd = user.getPassword();
		if (!pwd.equals(password)) {
			return "flase";
		}else {
			return "true";
		}
	}
}
