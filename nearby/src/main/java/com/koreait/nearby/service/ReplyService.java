package com.koreait.nearby.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.koreait.nearby.domain.Reply;

public interface ReplyService {

	public Map<String, Object> replyList(Long bNo);
	public Map<String, Object> insertReply(Reply reply, HttpSession session);
}
