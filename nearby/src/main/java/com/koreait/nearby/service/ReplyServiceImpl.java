package com.koreait.nearby.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.koreait.nearby.domain.Member;
import com.koreait.nearby.domain.Reply;
import com.koreait.nearby.repository.BoardRepository;
import com.koreait.nearby.repository.ReplyRepository;
import com.koreait.nearby.util.PageUtils;

public class ReplyServiceImpl implements ReplyService {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 댓글 리스트
	@Override
	   public Map<String, Object> replyList(HttpServletRequest request) {
		
		BoardRepository boardRepository = sqlSession.getMapper(BoardRepository.class);	
	    Member loginUser = (Member)request.getSession().getAttribute("loginUser");
	    String id = loginUser.getId();
	    
	    ReplyRepository replyRepository = sqlSession.getMapper(ReplyRepository.class);
	    Long bNo = Long.parseLong(request.getParameter("bNo"));
	    int totalRecord = replyRepository.selectTotalCountPerBoard(bNo);
	    
	    
	    Map<String, Object> dbMap = new HashMap<String, Object>();
	    dbMap.put("id", id);
	    dbMap.put("bNo", bNo);
	    
	    int count =  boardRepository.selectLikePerBoard(dbMap);
	   
	//      Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
	//     int page = Integer.parseInt(opt.orElse("1"));
	      Integer page = Integer.parseInt(request.getParameter("page"));
	      
	      PageUtils pageUtils = new PageUtils();
	      pageUtils.setPageEntity(totalRecord, page);
	      
	      Map<String, Object> mapForDB = new HashMap<String, Object>();
	      mapForDB.put("beginRecord", pageUtils.getBeginRecord());
	      mapForDB.put("endRecord", pageUtils.getEndRecord());
	      mapForDB.put("bNo", bNo);
	      List<Reply> replyList = replyRepository.selectReplyListForPaging(mapForDB);
	      
	      Map<String, Object> map = new HashMap<String, Object>();
	      map.put("total", totalRecord);
	      map.put("pageUtils", pageUtils);
	      map.put("replyList", replyList);
	      map.put("count", count);
			
	      System.out.println("반환되는 MAP : "  +  map);
	      return map;
	   }

	// 댓글 삽입
	@Override
	public Map<String, Object> insertReply(Reply r, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		ReplyRepository replyRepository = sqlSession.getMapper(ReplyRepository.class);
		try {
			
			if (r.getrContent().isEmpty() || r.getrContent() == null ) throw new NullPointerException();
			Reply reply = new Reply();
			reply.setId(r.getId());
			reply.setbNo(r.getbNo());
			reply.setrContent(r.getrContent());
			reply.setDepth(r.getDepth() + 1);
			reply.setGroupNo(r.getGroupNo());
			reply.setGroupOrd(r.getGroupOrd() + 1);
			
			int insertResult = replyRepository.insertReply(reply);
			replyRepository.updatePreviousReplyGroupOrd(reply);
			map.put("insertResult", insertResult);
		} catch (NullPointerException e) {
			map.put("errorMsg", e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return map;
	}
	
	// 댓글 수정
	@Override
	public Map<String, Object> updateReply(Reply reply) {
		Map<String, Object> map = new HashMap<String, Object>();
		ReplyRepository replyRepository = sqlSession.getMapper(ReplyRepository.class);
		int updateResult = replyRepository.updateReply(reply);
		map.put("updateResult", updateResult);
		return map;
	}
	
	
	// 댓글 삭제
	@Override
	public Map<String, Object> deleteReply(Long rNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		ReplyRepository replyRepository = sqlSession.getMapper(ReplyRepository.class);
		int deleteResult = replyRepository.deleteReply(rNo);
		map.put("deleteResult", deleteResult);
		return map;
	}
	
	
}
