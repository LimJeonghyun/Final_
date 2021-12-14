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
		private final String COMMENT_DELETE = "delete from comment where comment_id=?";

		public int insertBoard(final BoardVO vo) {
			System.out.println("===> JDBC로 insertBoard() 기능 처리");
			return template.update(BOARD_INSERT, new Object[] {
					vo.getCategory(),vo.getName(),vo.getManufacturer(),vo.getPic(),vo.getPrice(),vo.getDetail(),vo.getReleasedate()
			});
//			try {
//				jdbcTemplate.update(new PreparedStatementCreator() {
//					
//					@Override
//					public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
//						// TODO Auto-generated method stub
//						stmt = con.prepareStatement(BOARD_INSERT);
//						stmt.setString(1, vo.getCategory());
//						stmt.setString(2, vo.getName());
//						stmt.setString(3, vo.getManufacturer());
//						stmt.setString(4, vo.getPic());
//						stmt.setString(5, vo.getPrice());
//						stmt.setString(6, vo.getDetail());
//						stmt.setString(7, vo.getReleasedate());
//						stmt.executeUpdate();
//						
//					}
//				});
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			return 0;
		}

		// 글 삭제
		public int deleteBoard(final int pid) {
			System.out.println("===> JDBC로 deleteBoard() 기능 처리");
			return template.update(BOARD_DELETE, new Object[] {
					pid
			});
//			try {
//				template.update(new PreparedStatementCreator() {
//					
//					@Override
//					public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
//						// TODO Auto-generated method stub
//						stmt = con.prepareStatement(BOARD_DELETE);
//						stmt.setInt(1, pid);
////						stmt.executeUpdate();
//						return stmt;
//					}
//				});
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
		}
		
//		public int deleteComment(final int cid) {
//			System.out.println("===> JDBC로 deleteComment() 기능 처리");
//			return template.update(COMMENT_DELETE, new Object[] {
//					cid
//			});
//			
//		}
			
		public int updateBoard(final BoardVO vo) {
			System.out.println("===> JDBC로 updateBoard() 기능 처리");
			return template.update(BOARD_UPDATE, new Object[] {
					vo.getCategory(),vo.getName(),vo.getManufacturer(),vo.getPic(),vo.getPrice(),vo.getDetail(),vo.getReleasedate(),vo.getProduct_id()
			});
//			try {
//				template.update(new PreparedStatementCreator() {
//					
//					@Override
//					public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
//						// TODO Auto-generated method stub
//						stmt = con.prepareStatement(BOARD_UPDATE);
//						stmt.setString(1, vo.getCategory());
//						stmt.setString(2, vo.getName());
//						stmt.setString(3, vo.getManufacturer());
//						stmt.setString(4, vo.getPic());
//						stmt.setString(5, vo.getPrice());
//						stmt.setString(6, vo.getDetail());
//						stmt.setString(7, vo.getReleasedate());
//						stmt.setInt(8, vo.getProduct_id());
//						return stmt;
//					}
//				});
//				
//				
//				System.out.println(vo.getCategory() + "-" + vo.getName() + "-" + vo.getManufacturer() + "-" + vo.getPic() + "-" + vo.getPrice() + "-" + vo.getDetail() + "-" + vo.getReleasedate() + "-" + vo.getProduct_id());
////				stmt.executeUpdate();
//				return 1;
//				
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			return 0;
		}	
		
		public BoardVO getBoard(int pid) {
			
			System.out.println("===> JDBC로 getBoard() 기능 처리");
			try {
				return template.queryForObject("select * from product where product_id=" + pid, new BoardRowMapper());
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
		
		public List<BoardVO> getBoardList(){
			System.out.println("===> JDBC로 getBoardList() 기능 처리");
			try {
				return template.query("select * from product", new BoardRowMapper());
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
