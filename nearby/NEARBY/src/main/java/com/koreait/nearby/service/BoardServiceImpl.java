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
		// ip��� �Ǵ°�?
		
		// ���� ���� ���� 
		try {
			
			MultipartFile file = multipartRequest.getFile("file");
			
			if(file != null && !file.isEmpty() ) {
				// ÷������ ���� �̸�
				String origin = file.getOriginalFilename();
				
				// ÷������ Ȯ���� 
				String extName = origin.substring(origin.lastIndexOf("."));
				
				String uuid = UUID.randomUUID().toString().replaceAll("-", "");
				
				String saved = uuid + extName;
						
				// ������
				String sep = Matcher.quoteReplacement(File.separator);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String path = "resources"+sep + "upload" + sep + id+sep + sdf.format(new Date()).replaceAll("-", sep);
				String realPath = multipartRequest.getServletContext().getRealPath(path);
				
				File dir = new File(realPath);
				if ( !dir.exists() ) dir.mkdirs();
				
				File uploadFile = new File(realPath, saved);  // new File(���, ����)
				file.transferTo(uploadFile);  // ���ε� ���� �ڵ�
				
				
				board.setPath(path);
				board.setOrigin(origin);
				board.setSaved(saved);
				
			}
			
			
			else {
				
				// ÷�ΰ� ������ path, origin, saved �� ���ڿ�ó��
				board.setPath("");
				board.setOrigin("");
				board.setSaved("");
				
			} // ÷�ε� ������ ���� ���
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		BoardRepository boardRepository = sqlSession.getMapper(BoardRepository.class);	
		int result = boardRepository.insertBoard(board);
		message(result, response, "�� �������� ��ϵǾ����ϴ�.", "��� ����", "/NEARBY/board/boardList");
		
		
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
