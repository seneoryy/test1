package dao;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import vo.Member;

public class MemberDAO {

	DataSource ds;
	Connection conn;
	private static MemberDAO memberDao;
	
	private MemberDAO() {}
	
	public static MemberDAO getInstance() {
		if(memberDao==null) {
			memberDao=new MemberDAO();
		}
		return memberDao;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}
	
	public int insertMember(Member insMember) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int num=0;
		String sql="insert into users values(id, passwd, addr, name, age, genger, email, nation,";
		int insertCount=0;
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, insMember.getId());
			pstmt.setString(2, insMember.getPasswd());
			pstmt.setString(3, insMember.getAddr());
			pstmt.setString(4, insMember.getName());
			pstmt.setInt(5, insMember.getAge());
			pstmt.setString(6, insMember.getGender());
			pstmt.setString(7, insMember.getEmail());
			pstmt.setString(8, insMember.getNation());
			
			insertCount=pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("MemberInsert 에러 :"+e.getMessage());
		}finally {
			close(rs);
			close(pstmt);
		}
		return insertCount;
	}
	
	public boolean comfirmId(String id) {
		boolean result=false;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		
		String sql1="SELECT id FROM users2 WHERE id=?";
		
		try {
			Connection conn=getConnection();
			MemberDAO memberDao=MemberDAO.getInstance();
			memberDao.setConn(conn);
			pstmt=conn.prepareStatement(sql1);
			//System.out.println("id="+id);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result=true;
			}
		}catch(Exception e) {
			System.out.println("Member 에러 :"+e.getMessage());
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
	}

}
