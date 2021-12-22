package com.koreait.nearby.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.nearby.service.ProfileService;

@Controller
@RequestMapping("profile")
public class ProfileController {
	
	private ProfileService profileservice;
	
	@Autowired	
	public ProfileController(ProfileService profileservice) {
		super();
		this.profileservice = profileservice;
	}

	@PostMapping(value="profilePic", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> profilePic(MultipartHttpServletRequest multipartRequest) {
		Map<String, Object> map = profileservice.updateProfile(multipartRequest);
		return map;
	}
	
	
	
}
