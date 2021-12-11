package io.github.spring.board;

import java.util.List;


public interface BoardService {

	public int insertBoard(BoardVO vo);
	public int deleteBoard(int pid);
	public int updateBoard(BoardVO vo);
//	public int deleteComment(int cid);
	public BoardVO getBoard(int pid);
	public List<BoardVO> getBoardList();
}
