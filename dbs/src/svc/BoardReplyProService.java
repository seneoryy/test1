package svc;

import java.sql.Connection;

import dao.BoardDAO;
import vo.BoardBean;
import static db.JdbcUtil.*;

public class BoardReplyProService {
	
	public boolean replyArticle(BoardBean article) throws Exception {
		
		boolean isReplySuccess=false;
		int insertCount=0;
		Connection conn=getConnection();
		BoardDAO boardDao=BoardDAO.getInstance();
		boardDao.setConn(conn);
		insertCount=boardDao.insertReplyArticle(article);
		
		if(insertCount > 0) {
			commit(conn);
			isReplySuccess=true;
		}else {
			rollback(conn);
		}
		close(conn);
		return isReplySuccess;
	}

}
