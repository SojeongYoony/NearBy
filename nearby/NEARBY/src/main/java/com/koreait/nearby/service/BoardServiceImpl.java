package com.koreait.nearby.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;

import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.nearby.domain.Board;
import com.koreait.nearby.repository.BoardRepository;

public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<Board> selectBoardList() {
		BoardRepository boardRepository = sqlSession.getMapper(BoardRepository.class);	
		return boardRepository.selectListBoard();
	}


	@Override
	public Board selectBoardByNo(Long no) {
		BoardRepository boardRepository = sqlSession.getMapper(BoardRepository.class);	
		return boardRepository.selectBoardByNo(no);
	}
	
	@Override
	public void insertBoard(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) {
		
		String id = multipartRequest.getParameter("id");
		Board board = new Board();
		
		board.setId(id);
		board.setContent(multipartRequest.getParameter("content"));
		// ip없어도 되는가?
		
		// 서버 파일 저장 
		try {
			
			MultipartFile file = multipartRequest.getFile("file");
			
			if(file != null && !file.isEmpty() ) {
				// 첨부파일 본래 이름
				String origin = file.getOriginalFilename();
				
				// 첨부파일 확장자 
				String extName = origin.substring(origin.lastIndexOf("."));
				
				String uuid = UUID.randomUUID().toString().replaceAll("-", "");
				
				String saved = uuid + extName;
						
				// 저장경로
				String sep = Matcher.quoteReplacement(File.separator);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String path = "resources"+sep + "upload" + sep + id+sep + sdf.format(new Date()).replaceAll("-", sep);
				String realPath = multipartRequest.getServletContext().getRealPath(path);
				
				File dir = new File(realPath);
				if ( !dir.exists() ) dir.mkdirs();
				
				File uploadFile = new File(realPath, saved);  // new File(경로, 파일)
				file.transferTo(uploadFile);  // 업로드 진행 코드
				
				
				board.setPath(path);
				board.setOrigin(origin);
				board.setSaved(saved);
				
			}
			
			
			else {
				
				// 첨부가 없으면 path, origin, saved 빈 문자열처리
				board.setPath("");
				board.setOrigin("");
				board.setSaved("");
				
			} // 첨부된 파일이 없는 경우
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		BoardRepository boardRepository = sqlSession.getMapper(BoardRepository.class);	
		int result = boardRepository.insertBoard(board);
		message(result, response, "새 갤러리가 등록되었습니다.", "등록 실패", "/NEARBY/board/boardList");
		
		
	}
	

	@Override
	public int updateBoard(Board board) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int deleteBoard(Long no) {
		// TODO Auto-generated method stub
		return 0;
	}







	
	
	
	
}
