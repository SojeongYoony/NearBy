package com.koreait.nearby.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.koreait.nearby.domain.Member;
import com.koreait.nearby.repository.MemberRepository;

public class MemberServiceImpl implements MemberService {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void joinMember(HttpServletRequest request, HttpServletResponse response) {
		Member member = new Member();
		member.setId(request.getParameter("id"));
		member.setPw(request.getParameter("pw"));
		member.setName(request.getParameter("name"));
		member.setEmail(request.getParameter("email"));
		member.setPhone(request.getParameter("phone"));
		String birthday = request.getParameter("year") + request.getParameter("month")+request.getParameter("day");
		member.setBirthday(birthday);
		member.setGender(request.getParameter("gender"));
		 
		MemberRepository memberRepository = sqlSession.getMapper(MemberRepository.class);	
		int result = memberRepository.joinMember(member);
		
		message(result, response, "회원가입 성공", "회원가입 실패" , "/nearby/board/boardList");
		
	}


	@Override
	public void idCheck(String id, HttpServletResponse response){
		MemberRepository memberRepository = sqlSession.getMapper(MemberRepository.class);
		int result = memberRepository.idCheck(id);
		
		JSONObject obj = new JSONObject();
		obj.put("result", result > 0);
		
		response.setContentType("application/json; charset=UTF-8");
		// JSON 인코딩
		
		try {
			PrintWriter out = response.getWriter();
			out.println(obj);
			out.close();
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}




	
	
}
