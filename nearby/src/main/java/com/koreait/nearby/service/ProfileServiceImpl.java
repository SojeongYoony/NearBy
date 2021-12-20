package com.koreait.nearby.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.nearby.domain.Profile;
import com.koreait.nearby.repository.ProfileRepository;

public class ProfileServiceImpl implements ProfileService {
	
	private static final Logger logger = LoggerFactory.getLogger(ProfileServiceImpl.class);
	

	@Autowired
	private SqlSessionTemplate sqlSession;
	
//	@Override
//	public Map<String, Object> insertProfile(MultipartHttpServletRequest multipartRequest) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		Profile profile = new Profile();
//		try {
//				// 파라미터 처리
//				String id = multipartRequest.getParameter("id");
//				String content = multipartRequest.getParameter("content");
//				
//				System.out.println("서비스에서 id 파라미터 받기 : " + id);
//				System.out.println("서비스에서 content 파라미터 받기 : " + content);
//				
//				// 첨부 파일 저장 결과 변수 선언
//				int insertResult = 0;
//				// 저장 경로 
//				String sep = Matcher.quoteReplacement(File.separator);
//				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//				String path = "resources" + sep + "upload" + sep + id + sep + "profile" + sep + sdf.format(new Date()).replaceAll("-", sep);
//				System.out.println("path 확인 : " + path);
//				String realPath = multipartRequest.getServletContext().getRealPath(path);
//				
//				// 디렉터리 생성 
//				File dir = new File(realPath);
//				if ( dir.exists() == false) dir.mkdirs();
//				System.out.println("dir생성 : " + dir);
//				
//				// 서버에 파일 저장
//				MultipartFile file = multipartRequest.getFile("file");
//				System.out.println("파일파일 : " + file);
//				if (file != null && file.isEmpty() == false) {
//					String pOrigin = file.getOriginalFilename();
//					String extName = pOrigin.substring(pOrigin.lastIndexOf("."));
//					String uuid = UUID.randomUUID().toString().replaceAll("-", "");
//					String pSaved = uuid + extName;
//					File uploadFile = new File(realPath, pSaved);
//					file.transferTo(uploadFile);
//				
//					// DB에 전달 할 data 담기
//					profile.setId(id);
//					profile.setContent(content);
//					profile.setpOrigin(pOrigin);
//					profile.setpSaved(pSaved);
//					profile.setPath(path);
//					map.put("profile", profile);
//					System.out.println("profile 객체 값 : " + profile);
//					
//			}
//				// DB에 저장
//				System.out.println("sqlSession 확인 : " + sqlSession);
//				MemberRepository memberRepository = sqlSession.getMapper(MemberRepository.class);
//				System.out.println(" profileRepository 객체 생성 확인 : " + memberRepository);
//				insertResult = memberRepository.insertProfile(profile);
//				System.out.println("DB에 다녀오기 : " + insertResult);
//				map.put("insertResult", insertResult);
//				map.put("path", path);
//				System.out.println("map에 실린 값 : " + map);
//			
//			// 응답할 데이터
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		return map;
//	}

	@Override
	public Map<String, Object> updateProfile(MultipartHttpServletRequest multipartRequest) {
		Map<String, Object> map = new HashMap<String, Object>();
		Profile profile = new Profile();
		try {
				// 파라미터 처리
				String id = multipartRequest.getParameter("id");
				String content = multipartRequest.getParameter("content");
				
				System.out.println("서비스에서 id 파라미터 받기 : " + id);
				System.out.println("서비스에서 content 파라미터 받기 : " + content);
				
				// 첨부 파일 저장 결과 변수 선언
				int insertResult = 0;
				// 저장 경로 
				String sep = Matcher.quoteReplacement(File.separator);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String path = "resources" + sep + "upload" + sep + id + sep + "profile" + sep + sdf.format(new Date()).replaceAll("-", sep);
				System.out.println("path 확인 : " + path);
				String realPath = multipartRequest.getServletContext().getRealPath(path);
				
				// 디렉터리 생성 
				File dir = new File(realPath);
				if ( dir.exists() == false) dir.mkdirs();
				System.out.println("dir생성 : " + dir);
				
				// 서버에 파일 저장
				MultipartFile file = multipartRequest.getFile("file");
				System.out.println("파일파일 : " + file);
				if (file != null && file.isEmpty() == false) {
					String pOrigin = file.getOriginalFilename();
					String extName = pOrigin.substring(pOrigin.lastIndexOf("."));
					String uuid = UUID.randomUUID().toString().replaceAll("-", "");
					String pSaved = uuid + extName;
					File uploadFile = new File(realPath, pSaved);
					file.transferTo(uploadFile);
				
					// DB에 전달 할 data 담기
					profile.setContent(content);
					profile.setpOrigin(pOrigin);
					profile.setpSaved(pSaved);
					profile.setPath(path);
					profile.setId(id);
					map.put("profile", profile);
					System.out.println("profile 객체 값 : " + profile);
					
			}
				// DB에 저장
				System.out.println("sqlSession 확인 : " + sqlSession);
				ProfileRepository profileRepository = sqlSession.getMapper(ProfileRepository.class);
				System.out.println(" memberRepository 객체 생성 확인 : " + profileRepository);
				insertResult = profileRepository.updateProfile(profile);
				System.out.println("DB에 다녀오기 : " + insertResult);
				map.put("insertResult", insertResult);
				map.put("path", path);
				System.out.println("map에 실린 값 : " + map);
			
			// 응답할 데이터
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return map;
	}
}
