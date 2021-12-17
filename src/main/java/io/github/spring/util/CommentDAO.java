package io.github.spring.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;

//import src.main.java.io.github.board.spring.BoardRowMapper;
//import src.main.java.io.github.board.spring.BoardVO;
//import src.main.java.io.github.board.spring.Exception;
//import src.main.java.io.github.board.spring.Object;
//import src.main.java.io.github.board.spring.Override;
//import src.main.java.io.github.board.spring.String;

@Repository
public class CommentDAO {

	@Autowired
	private JdbcTemplate template;

	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	private final String COMMENT_INSERT = "insert into comment (product_id, nickname, comment) values (?,?,?)";
	private final String COMMENT_DELETE = "delete from comment where comment_id=?";
	private final String COMMENT_LIST = "select * from comment where product_id=? order by comment_id desc";

	// 댓글 추가 기능
	public int insertComment(CommentVO vo) {
		System.out.println("===> JDBC로 insertComment() 기능 처리");
		return template.update(COMMENT_INSERT, new Object[] { vo.getProduct_id(), vo.getNickname(), vo.getComment() });
	}

	// 댓글 삭제 기능
	public int deleteComment(int cid) {
		System.out.println("===> JDBC로 deleteComment() 기능 처리");
		return template.update(COMMENT_DELETE, new Object[] { cid });
	}

	// 상품 아이디에 맞는 댓글 목록 가져오기 기능
	public List<CommentVO> getCommentList(int pid) {
		System.out.println("===> JDBC로 getCommentList() 기능 처리");
		try {
			return template.query(COMMENT_LIST, new Object[] { pid }, new CommentRowMapper());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}

class CommentRowMapper implements RowMapper<CommentVO> {
	@Override
	public CommentVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		CommentVO vo = new CommentVO();
		vo.setComment_id(rs.getInt("comment_id"));
		vo.setProduct_id(rs.getInt("product_id"));
		vo.setNickname(rs.getString("nickname"));
		vo.setComment(rs.getString("comment"));
		return vo;
	}
}
