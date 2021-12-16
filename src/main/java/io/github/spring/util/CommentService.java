package io.github.spring.util;

import java.util.List;


public interface CommentService {

	public int insertComment(CommentVO vo);
	public int deleteComment(int cid);
	public List<CommentVO> getCommentList(int pid);
}
