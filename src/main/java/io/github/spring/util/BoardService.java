package io.github.spring.util;

import java.util.List;


public interface BoardService {

	public int insertBoard(BoardVO vo);
	public int deleteBoard(int pid);
	public int updateBoard(BoardVO vo);
	public BoardVO getBoard(int pid);
	public List<BoardVO> getBoardList(String category);
}
