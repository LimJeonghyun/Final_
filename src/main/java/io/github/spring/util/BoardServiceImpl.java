package io.github.spring.util;

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
		public int deleteBoard(int pid) {
			//TODO: 가능하다면 이곳에 pid에 해당하는 모든 comment 삭제해줘야 함
			return boardDAO.deleteBoard(pid);
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
		public List<BoardVO> getBoardList(String category) {
			return boardDAO.getBoardList(category);
		}
}
