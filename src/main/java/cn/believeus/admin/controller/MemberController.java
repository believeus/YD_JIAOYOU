package cn.believeus.admin.controller;

import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import mydfs.storage.server.MydfsTrackerServer;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
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
import cn.believeus.variables.Variables;

@Controller
public class MemberController {
	
	private static final Log log=LogFactory.getLog(MemberController.class);
	
	@Resource
	private MydfsTrackerServer mydfsTrackerServer;
	
	@Resource
	private BaseService baseService;

	/**
	 * 会员列表
	 * @return
	 */
	@RequestMapping(value="/admin/member/list")
	public String list(HttpServletRequest request){
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),20);
		String hql="from Tmember t_member order by t_member.editTime desc";
		Page<?> page = baseService.findObjectList(hql, pageable);
		request.setAttribute("members", page.getContent());
		request.setAttribute("size",page.getTotal());
		// 分页
		PaginationUtil.pagination(request, page.getPageNumber(),page.getTotalPages(), 0);
		return "/WEB-INF/back/member/list.jsp";
	}
	
	/**
	 * 会员添加
	 * @return
	 */
	@RequestMapping(value="/admin/member/add")
	public String add(){
		return "/WEB-INF/back/member/add.jsp";
	}
	
	/**
	 * 会员保存
	 * @return
	 * */
	@RequestMapping(value="/admin/member/update")
	public String update(Tmember member,HttpServletRequest request){
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
				log.debug("upload file stuffix:"+extention);
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
		return "redirect:/admin/member/list.jhtml";
	}
	@RequestMapping(value="/admin/member/save")
	public String save(Tmember member,HttpServletRequest request){
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
				log.debug("upload file stuffix:"+extention);
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
		return "redirect:/admin/member/list.jhtml";
	}
	
	/**
	 * 会员修改
	 * @return
	 */
	@RequestMapping(value="/admin/member/edit")
	public String edit(Integer memberId, HttpServletRequest request){
		Tmember member=(Tmember)baseService.findObject(Tmember.class, memberId);
		request.setAttribute("member", member);
		String sex = String.valueOf(member.getSex());
		request.setAttribute("sex",sex);
		return "/WEB-INF/back/member/edit.jsp";
	}
	
	/**
	 * 会员删除
	 * @return
	 */
	@RequestMapping(value="/admin/member/delete")
	public  String delete(int memberId ){
		baseService.delete(Tmember.class, memberId);
		return "redirect:/admin/member/list.jhtml";
	}
	
  public  long getBirthDay(String idcard){
	  long birthday=0;
      Pattern idNumPattern = Pattern.compile("(\\d{14}[0-9a-zA-Z])|(\\d{17}[0-9a-zA-Z])");  
      //通过Pattern获得Matcher  
      Matcher idNumMatcher = idNumPattern.matcher(idcard);  
      //判断用户输入是否为身份证号  
      if(idNumMatcher.matches()){  
          System.out.println("您的出生年月日是：");  
          //如果是，定义正则表达式提取出身份证中的出生日期  
          Pattern birthDatePattern= Pattern.compile("\\d{6}(\\d{4})(\\d{2})(\\d{2}).*");//身份证上的前6位以及出生年月日  
          //通过Pattern获得Matcher  
          Matcher birthDateMather= birthDatePattern.matcher(idcard);  
          //通过Matcher获得用户的出生年月日  
          if(birthDateMather.find()){
              String year = birthDateMather.group(1);  
              String month = birthDateMather.group(2);  
              String date = birthDateMather.group(3);  
              //输出用户的出生年月日  
              SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
      		try {
      			birthday=sdf.parse(year+"-"+month+"-"+date).getTime()/1000;
      		} catch (ParseException e1) {
      			e1.printStackTrace();
      		}
          }     
      }
      return birthday;
  }
  @RequestMapping(value="/ajaxMemberExistByPhoneNum")
  public @ResponseBody String ajaxMemberExistByPhoneNum(String phoneNum,String old_phoneNum){
	  if (old_phoneNum!=null) {
			if (phoneNum.equals(old_phoneNum)) {
				return "true";
			}
		}
	  Tmember member = (Tmember)baseService.findObject(Tmember.class, Variables.PHONE_NUM, phoneNum);
	  if (member!=null) {
			return "false";
	  }
		return "true";
  }
}