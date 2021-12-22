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

import com.koreait.nearby.domain.Member;
import com.koreait.nearby.domain.Profile;
import com.koreait.nearby.repository.MemberRepository;
import com.koreait.nearby.repository.ProfileRepository;

public class ProfileServiceImpl implements ProfileService {
	
	private static final Logger logger = LoggerFactory.getLogger(ProfileServiceImpl.class);
	

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	// profile 사진 수정
	@Override
	public Map<String, Object> updateProfile(MultipartHttpServletRequest multipartRequest) {
		Profile profile = new Profile();
		Map<String, Object> map = new HashMap<String, Object>();
		ProfileRepository profileRepository = sqlSession.getMapper(ProfileRepository.class);
		try {
				// 파라미터 처리
				Member loginUser = (Member)multipartRequest.getSession().getAttribute("loginUser");
				System.out.println("loginUser info before update : " + loginUser);
				String id = loginUser.getId();
				String content = multipartRequest.getParameter("content");
				
				
				// 첨부 파일 저장 결과 변수 선언
				int insertResult = 0;
				// 저장 경로 
				String sep = Matcher.quoteReplacement(File.separator);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String path = "resources" + sep + "upload" + sep + id + sep + "profile" + sep + sdf.format(new Date()).replaceAll("-", sep);
				String realPath = multipartRequest.getServletContext().getRealPath(path);
				
				// 비교할 값 저장하기
				// 디렉터리 생성 
				File dir = new File(realPath);
				if ( dir.exists() == false) dir.mkdirs();
				
				// 서버에 파일 저장
				MultipartFile file = multipartRequest.getFile("file");
				Profile originProfile = profileRepository.selectProfile(id);
					if(file == null) {
						profile.setPath(originProfile.getPath());
						profile.setpOrigin(originProfile.getpOrigin());
						profile.setpSaved(originProfile.getpSaved());
						profile.setContent(content);
						profile.setId(id);
					} else if (file != null && file.isEmpty() == false) {
						String pOrigin = file.getOriginalFilename();
						String extName = pOrigin.substring(pOrigin.lastIndexOf("."));
						String uuid = UUID.randomUUID().toString().replaceAll("-", "");
						String pSaved = uuid + extName;
						File uploadFile = new File(realPath, pSaved);
						file.transferTo(uploadFile);
					
						profile.setContent(content);
						profile.setpOrigin(pOrigin);
						profile.setpSaved(pSaved);
						profile.setPath(path);
						profile.setId(id);
					} // End if
				// DB에 저장

				insertResult = profileRepository.updateProfile(profile);
				map.put("insertResult", insertResult);
				map.put("profile", profile);
				
				Member member = new Member();
				member.setId(id);
				member.setPw(loginUser.getPw());
				MemberRepository repository = sqlSession.getMapper(MemberRepository.class);
				loginUser = repository.login(member);
				System.out.println("loginUser information after update : " + loginUser);
				
				// 세션 저장
				if (loginUser != null) {
					multipartRequest.getSession().invalidate();
					multipartRequest.getSession().setAttribute("loginUser", loginUser);
				}		
			// 응답할 데이터
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return map; // 2021-12-21 session loginUser 정보 업데이트로 변경
	}
}


// 회원정보 수정


// 회원정보 조회