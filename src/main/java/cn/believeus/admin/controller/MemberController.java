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
	 * 新闻添加
	 * @return
	 */
	@RequestMapping(value="/admin/member/add")
	public String add(){
		return "/WEB-INF/back/member/add.jsp";
	}
	
	/**
	 * 新闻保存
	 * @return
	 * */
	@RequestMapping(value="/admin/member/update")
	public String update(HttpServletRequest request){
		String memberId=request.getParameter("memberId");
		String username=request.getParameter("username");
		char sex=request.getParameter("sex").charAt(0);
		String career=request.getParameter("career");
		String idCard=request.getParameter("idCard");
		String height=request.getParameter("height");
		String phoneNum=request.getParameter("phoneNum");
		long birthday=getBirthDay(idCard);
		String nickName=request.getParameter("nickName");
		String residentPlace=request.getParameter("residentPlace");
		String marriageCase=request.getParameter("marriageCase");
		String degree=request.getParameter("degree");
		String yearSalary=request.getParameter("yearSalary");
		String asset=request.getParameter("asset");
		String carCase=request.getParameter("carCase");
		String houseCase=request.getParameter("houseCase");
		Tmember member=(Tmember) baseService.findObject(Tmember.class, Integer.parseInt(memberId));
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
		member.setBirthday(birthday);
		member.setHeight(height);
		member.setPhoneNum(phoneNum);
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
	@RequestMapping(value="/admin/member/save")
	public String save(HttpServletRequest request){
		String username=request.getParameter("username");
		char sex=request.getParameter("sex").charAt(0);
		String career=request.getParameter("career");
		String idCard=request.getParameter("idCard");
		String height=request.getParameter("height");
		String phoneNum=request.getParameter("phoneNum");
		long birthday=getBirthDay(idCard);
		String nickName=request.getParameter("nickName");
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
		member.setBirthday(birthday);
		member.setHeight(height);
		member.setPhoneNum(phoneNum);
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
	@RequestMapping(value="/admin/member/edit")
	public String edit(Integer memberId, HttpServletRequest request){
		Tmember member=(Tmember)baseService.findObject(Tmember.class, memberId);
		request.setAttribute("member", member);
		return "/WEB-INF/back/member/edit.jsp";
	}
	
	/**
	 * 新闻删除
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

}