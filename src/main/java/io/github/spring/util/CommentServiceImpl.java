package io.github.spring.util;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//import src.main.java.io.github.board.spring.BoardDAO;
//import src.main.java.io.github.board.spring.BoardService;
//import src.main.java.io.github.board.spring.CommentVO;
//import src.main.java.io.github.board.spring.Override;

@Service
public class CommentServiceImpl implements CommentService {

		@Autowired
		CommentDAO commentDAO;

		
		@Override
		public int insertComment(CommentVO vo) {
			return commentDAO.insertComment(vo);
		}

		@Override
		public int deleteComment(int cid) {
			commentDAO.deleteComment(cid);
			return 1;
		}
		
		@Override
		public List<CommentVO> getCommentList(int pid) {
			return commentDAO.getCommentList(pid);
		}

}
