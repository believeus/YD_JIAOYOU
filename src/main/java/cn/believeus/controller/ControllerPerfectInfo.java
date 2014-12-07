package cn.believeus.controller;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import mydfs.storage.server.MydfsTrackerServer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import cn.believeus.model.Tmember;
import cn.believeus.service.BaseService;

/**
 * 完善资料
 * */
@Controller
public class ControllerPerfectInfo {
	
	@Resource
	private BaseService baseService;
	@Resource
	private MydfsTrackerServer mydfsTrackerServer;
	
	@RequestMapping(value="/ajaxComValidIdCard")
	public @ResponseBody String ajaxComValidReg(String idCard,String old_idCard){
		if (old_idCard!=null) {
			if (old_idCard.equals(old_idCard)) {
				return "true";
			}
		}
		Tmember tmember = (Tmember)baseService.findObject(Tmember.class, "idCard", idCard);
		if (tmember!=null) {
			return "false";
		}
		return "true";
	}
	
	@RequestMapping(value="/perfectInfo")
	public String perfectInfo(HttpSession session){
		Tmember member = (Tmember)session.getAttribute("member");
		if (member.getNickName()!=null) {
			return "redirect:/memberList.jhtml";
		}
		return "/WEB-INF/front/perfectInfo.jsp";
	}

	@RequestMapping(value="/savePerfectInfo")
	public String savePerfectInfo(Tmember member,HttpServletRequest request){
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
		return "redirect:/memberList.jhtml";
	}
}
