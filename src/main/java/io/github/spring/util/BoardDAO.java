package io.github.spring.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

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

	private final String BOARD_LIST = "select * from product where category=? order by product_id desc";
	private final String BOARD_GET = "select * from product where product_id=?";

	// 상품 추가 기능
	public int insertBoard(BoardVO vo) {
		System.out.println("===> JDBC로 insertBoard() 기능 처리");
		return template.update(BOARD_INSERT, new Object[] { vo.getCategory(), vo.getName(), vo.getManufacturer(),
				vo.getPic(), vo.getPrice(), vo.getDetail(), vo.getReleasedate() });
	}

	// 글 삭제 기능
	public int deleteBoard(int pid) {
		System.out.println("===> JDBC로 deleteBoard() 기능 처리");
		return template.update(BOARD_DELETE, new Object[] { pid });
	}

	// 글 수정 기능
	public int updateBoard(BoardVO vo) {
		System.out.println("===> JDBC로 updateBoard() 기능 처리");
		return template.update(BOARD_UPDATE, new Object[] { vo.getCategory(), vo.getName(), vo.getManufacturer(),
				vo.getPic(), vo.getPrice(), vo.getDetail(), vo.getReleasedate(), vo.getProduct_id() });
	}

	// 상품 목록 가져오기
	// TODO: category 파라미터로 받아서 가져오는 거로 수정하면 될 듯! -> 된 것 같은데 확인만 해주세요
	public List<BoardVO> getBoardList(String category) {
		System.out.println("===> JDBC로 getBoardList() 기능 처리");
		try {
			return template.query(BOARD_LIST, new Object[] { category }, new BoardRowMapper());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 글 하나 가져오기
	public BoardVO getBoard(int pid) {

		System.out.println("===> JDBC로 getBoard() 기능 처리");
		try {
			return template.queryForObject(BOARD_GET, new Object[] { pid }, new BoardRowMapper());
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
