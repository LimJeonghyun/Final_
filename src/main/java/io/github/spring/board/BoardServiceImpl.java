package io.github.spring.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//import src.main.java.io.github.board.spring.BoardDAO;
//import src.main.java.io.github.board.spring.BoardService;
//import src.main.java.io.github.board.spring.BoardVO;
//import src.main.java.io.github.board.spring.Override;

@Service
public class BoardServiceImpl implements BoardService {

		@Autowired
		BoardDAO boardDAO;

		@Override
		public int insertBoard(BoardVO vo) {
			return boardDAO.insertBoard(vo);
		}
		
		@Override
		public int insertComment(BoardVO vo) {
			return boardDAO.insertComment(vo);
		}

		@Override
		public int deleteBoard(int pid) {
			boardDAO.deleteBoard(pid);
			return 1;
		}
//		
		@Override
		public int deleteComment(int cid) {
			boardDAO.deleteComment(cid);
			return 1;
		}

		@Override
		public int updateBoard(BoardVO vo) {
			return boardDAO.updateBoard(vo);
		}

		@Override
		public BoardVO getBoard(int pid) {
			return boardDAO.getBoard(pid);
		}
		
		@Override
		public List<BoardVO> getCommentList(int cid) {
			return boardDAO.getCommentList(cid);
		}


		@Override
		public List<BoardVO> getBoardList() {
			return boardDAO.getBoardList();
		}
}
