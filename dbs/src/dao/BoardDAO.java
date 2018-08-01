package dao;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import vo.BoardBean;

public class BoardDAO {

	DataSource ds;
	Connection conn;
	private static BoardDAO boardDao;
	
	private BoardDAO() {}
	
	public static BoardDAO getInstance() {
		if(boardDao==null) {
			boardDao=new BoardDAO();
		}
		return boardDao;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}
	
	public int insertArticle(BoardBean insboardBean) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int num=0;
		String sql="INSERT INTO board VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now())";
		String sql1="SELECT max(board_num) FROM board";
		int insertCount=0;
		
		try {
			pstmt=conn.prepareStatement(sql1);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				num=rs.getInt(1)+1;
			}else {
				num=1;
			}
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, insboardBean.getBoard_name());
			pstmt.setString(3, insboardBean.getBoard_pass());
			pstmt.setString(4, insboardBean.getBoard_subject());
			pstmt.setString(5, insboardBean.getBoard_content());
			pstmt.setString(6, insboardBean.getBoard_file());
			pstmt.setInt(7, num);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			pstmt.setInt(10, 0);
			
			insertCount=pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("boardInsert ����:"+e.getMessage());
		}finally {
			close(rs);
			close(pstmt);
		}
		return insertCount;
	}
	
	public int selectListCount() {
		int listCount=0;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="SELECT count(*) FROM board";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				listCount=rs.getInt(1);
			}
		}catch(Exception e) {
			System.out.println("getListCount ����:"+e);
		}finally {
			close(rs);
			close(pstmt);
		}
		return listCount;
	}
	
	public ArrayList<BoardBean> selectArticleList(int page, int limit){
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String board_list_sql="SELECT * FROM board ORDER BY board_re_ref DESC, board_re_seq ASC limit ?, 10";
		ArrayList<BoardBean> articleList=new ArrayList<BoardBean>();
		BoardBean board=null;
		int startrow=(page-1)*10;
		
		try {
			pstmt=conn.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				board=new BoardBean();
				board.setBoard_num(rs.getInt("board_num"));
				board.setBoard_name(rs.getString("board_name"));
				board.setBoard_subject(rs.getString("board_subject"));
				board.setBoard_content(rs.getString("board_content"));
				board.setBoard_file(rs.getString("board_file"));
				board.setBoard_re_ref(rs.getInt("board_re_ref"));
				board.setBoard_re_lev(rs.getInt("board_re_lev"));
				board.setBoard_re_seq(rs.getInt("board_re_seq"));
				board.setBoard_readcount(rs.getInt("board_readcount"));
				board.setBoard_date(rs.getDate("board_date"));
				articleList.add(board);
				
			}
				
		}catch(Exception e) {
			System.out.println("getBoardList ���� : "+e.getMessage());
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return articleList;
	}
	
	public int updateReadCount(int board_num) {
		
		PreparedStatement pstmt=null;
		int updateCount=0;
		String sql="UPDATE board set board_readcount=board_readcount+1 WHERE board_num="+board_num;
		
		try {
			pstmt=conn.prepareStatement(sql);
			updateCount=pstmt.executeUpdate();
		}catch(SQLException e) {
			System.out.println("setReadCountPage ����:"+e.getMessage());
		}finally {
			close(pstmt);
		}
		return updateCount;
	}
	
	public BoardBean selectArticle(int board_num) {
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		BoardBean boardBean=null;
		String sql="SELECT * FROM board WHERE board_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				boardBean=new BoardBean();
				boardBean.setBoard_num(rs.getInt("board_num"));
				boardBean.setBoard_name(rs.getString("board_name"));
				boardBean.setBoard_subject(rs.getString("board_subject"));
				boardBean.setBoard_content(rs.getString("board_content"));
				boardBean.setBoard_file(rs.getString("board_file"));
				boardBean.setBoard_re_ref(rs.getInt("board_re_ref"));
				boardBean.setBoard_re_lev(rs.getInt("board_re_lev"));
				boardBean.setBoard_re_seq(rs.getInt("board_re_seq"));
				boardBean.setBoard_readcount(rs.getInt("board_readcount"));
				boardBean.setBoard_date(rs.getDate("board_date"));
			}
			
		}catch(Exception e) {
			System.out.println("getDetail ���� : "+e.getMessage());
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return boardBean;
	}
	
	public boolean isArticleBoardWriter(int board_num, String pass) {
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String board_sql="SELECT * FROM board WHERE board_num=?";
		boolean isWriter=false;
		
		try {
			pstmt=conn.prepareStatement(board_sql);
			pstmt.setInt(1, board_num);
			rs=pstmt.executeQuery();
			rs.next();
			
			if(pass.equals(rs.getString("board_pass"))) {
				isWriter=true;
			}
		}catch(SQLException e) {
			System.out.println("isBoardWriter ����:"+e);
		}finally {
			close(pstmt);
		}
		return isWriter;
	}
	
	public int updateArticle(BoardBean article) {
		int updateCount=0;
		PreparedStatement pstmt=null;
		String sql="UPDATE board SET board_subject=?, board_content=? WHERE board_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, article.getBoard_subject());
			pstmt.setString(2, article.getBoard_content());
			pstmt.setInt(3, article.getBoard_num());
			updateCount=pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("boardModify����:"+e);
		}finally {
			close(pstmt);
		}
		return updateCount;
	}
	
	public int insertReplyArticle(BoardBean article) {
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String board_max_sql="SELECT max(board_num) FROM board";
		String sql="UPDATE board SET board_re_seq=board_re_seq+1 WHERE board_re_ref=? AND board_re_seq > ?";
		
		String sql1="INSERT INTO board VALUES(?,?,?,?,?,?,?,?,?,?,now())";
		
		int num=0;
		int insertCount=0;
		int re_ref=article.getBoard_re_ref();
		int re_lev=article.getBoard_re_lev();
		int re_seq=article.getBoard_re_seq();
		
		try {
			pstmt=conn.prepareStatement(board_max_sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				num=rs.getInt(1)+1;
			}else {
				num=1;
			}
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, re_ref);
			pstmt.setInt(2, re_seq);
			int updateCount=pstmt.executeUpdate();
			
			if(updateCount > 0) {
				commit(conn);
			}
			
			re_seq=re_seq+1;
			re_lev=re_lev+1;
			pstmt=conn.prepareStatement(sql1);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getBoard_name());
			pstmt.setString(3, article.getBoard_pass());
			pstmt.setString(4, article.getBoard_subject());
			pstmt.setString(5, article.getBoard_content());
			pstmt.setString(6, "");
			pstmt.setInt(7, re_ref);
			pstmt.setInt(8, re_lev);
			pstmt.setInt(9, re_seq);
			pstmt.setInt(10, 0);
			insertCount=pstmt.executeUpdate();
		}catch(SQLException e) {
			System.out.println("boardReply ���� : "+e);
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return insertCount;
	}
	
	public int deleteArticle(int board_num) {
		PreparedStatement pstmt=null;
		String board_delete_sql="DELETE from board WHERE board_num=?";
		int deleteCount=0;
		
		try {
			pstmt=conn.prepareStatement(board_delete_sql);
			pstmt.setInt(1, board_num);
			deleteCount=pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("boardDelte ���� : "+e);
		}finally {
			close(pstmt);
		}
		
		return deleteCount;
	}
	
}
















