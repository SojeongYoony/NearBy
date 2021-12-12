package com.koreait.nearby.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.nearby.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {
	
	private MemberService service;
	
	@Autowired
	public MemberController(MemberService service) {
		super();
		this.service = service;
	}

	@GetMapping("memberJoin")
	public String memberJoin() {
		return "member/join";
	}
	

	@ResponseBody
	@PostMapping(value="idCheck", produces ="application/json; charset=UTF-8" )
	public void idCheck(@RequestParam("id") String id, HttpServletResponse response) {
		service.idCheck(id, response);
	}
	
	
	@PostMapping("insertMember")
	public void insertMember(HttpServletRequest request, HttpServletResponse response) {
	      service.joinMember(request, response);
	}
	
	
	
	
	
}
