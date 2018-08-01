package svc;

import java.sql.Connection;

import dao.BoardDAO;
import vo.BoardBean;
import static db.JdbcUtil.*;

public class BoardDetailService {

	public BoardBean getArticle(int board_num) throws Exception {
		
		BoardBean article=null;
		Connection conn=getConnection();
		BoardDAO boardDao=BoardDAO.getInstance();
		boardDao.setConn(conn);
		int updateCount=boardDao.updateReadCount(board_num);
		
		if(updateCount > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		article=boardDao.selectArticle(board_num);
		close(conn);
		return article;
	}
	
}
