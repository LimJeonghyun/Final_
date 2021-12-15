package io.github.spring.board;

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
public class BoardDAO {
	
		@Autowired
		private JdbcTemplate template;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		public void setTemplate(JdbcTemplate template) {
			this.template = template;
		}

		private final String BOARD_INSERT = "insert into product (category, name, manufacturer, pic, price, detail, releasedate) values (?,?,?,?,?,?,?)";
		private final String BOARD_UPDATE = "update product set category=?, name=?, manufacturer=?, pic=?, price=?, detail=?, releasedate=? where product_id=?";
		private final String BOARD_DELETE = "delete from product where product_id=?";
		private final String COMMENT_INSERT = "insert into comment (productId, nickname, contents) values (?,?,?)";
		private final String COMMENT_DELETE = "delete from comment where comment_id=?";

		// 상품 추가 기능 
		public int insertBoard(final BoardVO vo) {
			System.out.println("===> JDBC로 insertBoard() 기능 처리");
			return template.update(BOARD_INSERT, new Object[] {
					vo.getCategory(),vo.getName(),vo.getManufacturer(),vo.getPic(),vo.getPrice(),vo.getDetail(),vo.getReleasedate()
			});
		}
		
		// 댓글 추가 기능 
		public int insertComment(final BoardVO vo) {
			System.out.println("===> JDBC로 insertComment() 기능 처리");
			return template.update(COMMENT_INSERT, new Object[] {
					vo.getProductId(),vo.getNickname(),vo.getContents()
			});
		}

		// 글 삭제 기능 
		public int deleteBoard(final int pid) {
			System.out.println("===> JDBC로 deleteBoard() 기능 처리" );
			return template.update(BOARD_DELETE, new Object[] {
					pid
			});
		}
		
		// 댓글 삭제기능 
		public int deleteComment(final int cid) {
			System.out.println("===> JDBC로 deleteComment() 기능 처리");
			return template.update(COMMENT_DELETE, new Object[] {
					cid
			
			});
		}
		
		// 글 수정 기능 	
		public int updateBoard(final BoardVO vo) {
			System.out.println("===> JDBC로 updateBoard() 기능 처리");
			return template.update(BOARD_UPDATE, new Object[] {
					vo.getCategory(),vo.getName(),vo.getManufacturer(),vo.getPic(),vo.getPrice(),vo.getDetail(),vo.getReleasedate(),vo.getProduct_id()
			});
		}	
		
		// 해당 아이디 글 하나 가져오기 
		public BoardVO getBoard(int pid) {
			
			System.out.println("===> JDBC로 getBoard() 기능 처리");
			try {
				return template.queryForObject("select * from product where product_id=" + pid, new BoardRowMapper());
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
		
		// 상품 목록 가져오기 
		// category 파라미터로 받아서 가져오는 거로 수정하면 될 듯! 
		public List<BoardVO> getBoardList(){
			System.out.println("===> JDBC로 getBoardList() 기능 처리");
			try {
				return template.query("select * from product ", new BoardRowMapper());
			} catch (Exception e) {
				e.printStackTrace();
			} 
			return null;
		}
		
		// 상품 아이디에 맞는 댓글 가져오기 기능 
		public List<BoardVO>getCommentList(int pid){
			System.out.println("===> JDBC로 getCommentList() 기능 처리");
			try {
				return template.query("select * from comment where productId=" + pid, new CommentRowMapper());
			} catch (Exception e) {
				e.printStackTrace();
			} 
			return null;
		}
	}

	class BoardRowMapper implements RowMapper<BoardVO> {

		@Override
		public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			BoardVO vo = new BoardVO();
			vo.setProduct_id(rs.getInt("product_id"));
			vo.setName(rs.getString("name"));
			vo.setPic(rs.getString("pic"));
			vo.setPrice(rs.getString("price"));
			vo.setDetail(rs.getString("detail"));
			vo.setReleasedate(rs.getString("releasedate"));
			vo.setCategory(rs.getString("category"));
			vo.setManufacturer(rs.getString("manufacturer"));
			return vo;
		}
}

	
class CommentRowMapper implements RowMapper<BoardVO> {

		@Override
		public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			BoardVO vo = new BoardVO();
			vo.setComment_id(rs.getInt("comment_id"));
			vo.setProductId(rs.getString("productId"));
			vo.setNickname(rs.getString("nickname"));
			vo.setContents(rs.getString("contents"));
			return vo;
		}
	}

	
	