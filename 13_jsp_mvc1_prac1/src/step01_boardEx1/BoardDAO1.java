package step01_boardEx1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO1 {
	
	// Singleton
	private BoardDAO1() {}
	private static BoardDAO1 instance = new BoardDAO1();
	public static BoardDAO1 getInstance() {
		return instance;
	}
	
	private Connection conn         = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs            = null;
	
	// 데이터 베이스 연결 메서드
	private void getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/MVC1_PRACTICE?serverTimezone=Asia/Seoul", "root", "1234");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 데이터베이스 연결 해제 메서드
	private void getClose() {
		if (rs != null) try {rs.close();} catch (SQLException e1) {e1.printStackTrace();}
		if (pstmt != null) try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
		if (conn != null) try {conn.close();} catch (SQLException e) {e.printStackTrace();}
	}
	
	// 게시글 추가 DAO
	public void insertBoard(BoardDTO1 boardDTO) {
		
		// 단위 테스트
		System.out.println(boardDTO);
		
			   
		try {
			getConnection();
			
			String sql = "INSERT INTO BOARD(WRITER, EMAIL, SUBJECT, PASSWORD, CONTENT, READ_CNT, ENROLL_DT)";
			sql += "VALUES(?,?,?,?,?,0,NOW())";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardDTO.getWriter());
			pstmt.setString(2, boardDTO.getEmail());
			pstmt.setString(3, boardDTO.getSubject());
			pstmt.setString(4, boardDTO.getPassword());
			pstmt.setString(5, boardDTO.getContent());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
	}
	
	// 게시글 전체 조회 DAO
	public ArrayList<BoardDTO1> getBoardList() {
		
		ArrayList<BoardDTO1> boardList = new ArrayList<BoardDTO1>();
		
		getConnection();
		
		try {
			pstmt = conn.prepareStatement("SELECT * FROM BOARD");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				BoardDTO1 temp = new BoardDTO1();
				temp.setBoardId(rs.getLong("BOARD_ID"));
				temp.setWriter(rs.getString("WRITER"));
				temp.setSubject(rs.getString("SUBJECT"));
				temp.setReadCnt(rs.getLong("READ_CNT"));
				temp.setEnrollDt(rs.getDate("ENROLL_DT"));
				boardList.add(temp);
			} 
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		
		// 단위 테스트
//		System.out.println(boardList);
		
		return boardList;
	}
	
	// 게시글 상세조회 DAO
	public BoardDTO1 getBoardDetail(long boardId) {
		
		BoardDTO1 boardDTO1 = new BoardDTO1();
		
		getConnection();
		
		try {
			pstmt = conn.prepareStatement("UPDATE BOARD SET READ_CNT = READ_CNT + 1 WHERE BOARD_ID = ?");
			pstmt.setLong(1, boardId);
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement("SELECT * FROM BOARD WHERE BOARD_ID = ?");
			pstmt.setLong(1, boardId);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 단위 테스트
		System.out.println(boardId);
		
		// 단위 테스트
		System.out.println(boardDTO1);
		
		return boardDTO1;
	}
	
	
	
	
	
	
	
}
