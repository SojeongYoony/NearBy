package com.koreait.nearby.service;

import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public interface ProfileService {

//	public Map<String, Object> insertProfile(MultipartHttpServletRequest multipartRequest);
	public Map<String, Object> updateProfile(MultipartHttpServletRequest multipartRequest);
}
