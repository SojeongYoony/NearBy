package com.koreait.nearby.repository;

import org.springframework.stereotype.Repository;

import com.koreait.nearby.domain.Member;
@Repository
public interface MemberRepository {
    
	public int joinMember(Member member);
	public int idCheck(String id);
}
