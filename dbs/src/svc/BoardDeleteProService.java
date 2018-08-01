package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import static db.JdbcUtil.*;
import dao.BoardDAO;

public class BoardDeleteProService {

	public boolean isArticleWriter(int board_num, String pass) throws Exception {
		
		boolean isArticleWriter=false;
		Connection conn=getConnection();
		BoardDAO boardDao=BoardDAO.getInstance();
		boardDao.setConn(conn);
		isArticleWriter=boardDao.isArticleBoardWriter(board_num, pass);
		close(conn);
		
		return isArticleWriter;
	}
	
	public boolean removeArticle(int board_num)throws Exception {
		boolean isRemoveSuccess=false;
		Connection conn=getConnection();
		BoardDAO boardDao=BoardDAO.getInstance();
		boardDao.setConn(conn);
		int deleteCount=boardDao.deleteArticle(board_num);
		
		if(deleteCount > 0) {
			commit(conn);
			isRemoveSuccess=true;
		}else {
			rollback(conn);
		}
		
		close(conn);
		return isRemoveSuccess;
	}
}











