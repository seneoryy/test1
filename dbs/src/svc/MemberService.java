package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.MemberDAO;
import vo.Member;

public class MemberService {

	public boolean registMember(Member member) throws Exception {
		boolean isWriteSuccess=false;
		Connection con=getConnection();
		MemberDAO memberDao=MemberDAO.getInstance();
		memberDao.setConn(con);
		int insertCount=memberDao.insertMember(member);
		
		if(insertCount>0) {
			commit(con);
			isWriteSuccess=true;
		}else {
			rollback(con);
		}
		
		close(con);
		return isWriteSuccess;
	}
}
