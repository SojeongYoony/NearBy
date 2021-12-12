package com.koreait.nearby.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.koreait.nearby.service.BoardService;
import com.koreait.nearby.service.BoardServiceImpl;
import com.koreait.nearby.service.FollowService;
import com.koreait.nearby.service.FollowServiceImpl;
import com.koreait.nearby.service.MemberService;
import com.koreait.nearby.service.MemberServiceImpl;
import com.koreait.nearby.service.ProfileService;
import com.koreait.nearby.service.ProfileServiceImpl;
import com.koreait.nearby.service.ReplyService;
import com.koreait.nearby.service.ReplyServiceImpl;

@Configuration
public class NearbyConfig {
		
	@Bean
	public BoardService boardService() {
		return new BoardServiceImpl();
	}
	
	@Bean 
	public MemberService memberService() {
		return new MemberServiceImpl();
	}
	
	@Bean
	public FollowService followService() {
		return new FollowServiceImpl();
	}
	
	@Bean
	public ProfileService profileservice() {
		return new ProfileServiceImpl();
	}
	
	@Bean
	public ReplyService replyService() {
		return new ReplyServiceImpl();
	}
	

	
}
