package spring.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;

import spring.vo.Board;

public class BoardDao {

	private JdbcTemplate jdbcTemplate;
	
	public BoardDao(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}


	private RowMapper<Board> mapper = new RowMapper<Board>() {

		@Override
		public Board mapRow(ResultSet rs, int rowNum) throws SQLException {
			Board board = new Board(
					rs.getInt("boardNum"), 
					rs.getString("boardWriter"),
					rs.getString("boardTitle"),
					rs.getDate("boardRegdate"),
					rs.getString("boardPwd"),
					rs.getInt("boardCount") 
					);
			return board;
		}
	};
	
	// 게시글 삭제
		public void deleteBoardByCode(int boardNum) {
			String sql = "DELETE FROM test_boards WHERE boardNum = ?";
			
			jdbcTemplate.update(sql,boardNum);
		}
	

	// BoardNum
	public Board selectByBoardNum(int boardNum) {

		List<Board> list = jdbcTemplate.query(
				"SELECT * FROM test_boards WHERE boardNum=?",
				new RowMapper<Board>() {
					@Override
					public Board mapRow(ResultSet rs, int rowNum) throws SQLException {
						Board board = new Board(
								rs.getInt("boardNum"),
								rs.getString("boardWriter"),
								rs.getString("boardTitle"),
								rs.getString("boardContent"),
								rs.getDate("boardRegdate"),
								rs.getString("boardPwd"),
								rs.getInt("boardCount"));
						board.setBoardNum(rs.getInt("boardNum"));
						return board;
					}
				}, boardNum);
		return list.isEmpty() ? null : list.get(0);

	}


	// 게시글 등록
	public void insert(Board newBoard) {

		int cnt = jdbcTemplate.update(new PreparedStatementCreator() {

			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement psmt = con.prepareStatement(
						"INSERT INTO test_boards VALUES(test_boards_seq.nextval,?,?,?,sysdate,?,0)");
					
					psmt.setString(1,newBoard.getBoardWriter());
					psmt.setString(2,newBoard.getBoardTitle());
					psmt.setString(3,newBoard.getBoardContent());
					psmt.setString(4,newBoard.getBoardPwd());
					
	

				return psmt;
			}
		});

	}

	
	/// 게시글 수정 

	public void edit(Board newBoard) {
		
			int cnt = jdbcTemplate.update(new PreparedStatementCreator() {
			
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement psmt = con.prepareStatement(
						"UPDATE test_boards SET boardWriter = ?, boardTitle = ?, boardContent = ? WHERE boardNum = ?");
				
					psmt.setString(1,newBoard.getBoardWriter());	
					psmt.setString(2,newBoard.getBoardTitle());
					psmt.setString(3,newBoard.getBoardContent());
					psmt.setInt(4,newBoard.getBoardNum());
	
					
				return psmt;
			}
		});
		

	}
	
	
	
	//페이징 처리
	public int selectAllNumBoard() {
		
		String sql = "SELECT * FROM test_boards";
		
		List<Board> cntAll = jdbcTemplate.query(sql, mapper);
		return cntAll.size();
	}
	
	// 현재 페이지 정보(섹션번호, 페이지 번호) 현재 페이지 글목록읽어오기
	
	public List<Board> selectTargetBoard(int section, int pageNum){

		
		String sql = " SELECT * FROM " +
				"(SELECT ROWNUM AS nick, boardNum,boardWriter,boardTitle,boardRegdate,boardPwd,boardCount FROM test_boards ORDER BY boardRegdate DESC)"  
				+  " WHERE nick BETWEEN (?-1)*50+(?-1)*5+1 AND (?-1)*50+(?)*5";
		
		List<Board> list = jdbcTemplate.query(sql, mapper, section, pageNum, section, pageNum);
	
		return list;
	}


	///카운트 증가 메서드
		public void updateCount(int boardNum) {
		
		int cnt = jdbcTemplate.update(new PreparedStatementCreator() {
		
		
		@Override
		public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
		PreparedStatement psmt = con.prepareStatement(
		"UPDATE test_boards SET boardCount = NVL(TO_NUMBER(boardCount),0)+1 WHERE boardNum = ?");
		
			psmt.setInt(1,boardNum);
		
			return psmt;
			}
			});
		}

	
	}

