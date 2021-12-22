package com.koreait.nearby.repository;

import org.springframework.stereotype.Repository;

import com.koreait.nearby.domain.Profile;

@Repository
public interface ProfileRepository {
	
	// 프로필 등록
	public int insertProfile(Profile profile);

	// 프로필 수정
	public int updateProfile(Profile profile);
	
	// 프로필 정보
	public Profile selectProfile(String id);
	
}
