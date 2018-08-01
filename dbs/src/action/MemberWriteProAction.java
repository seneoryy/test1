package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberService;
import vo.ActionForward;
import vo.Member;

public class MemberWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		ActionForward forward=null;
		Member member=null;
		
		ServletContext context=req.getServletContext();
		member=new Member();
		member.setId(req.getParameter("id"));
		member.setPasswd(req.getParameter("passwd"));
		member.setAddr(req.getParameter("addr"));
		member.setName(req.getParameter("name"));
		member.setAge(Integer.parseInt(req.getParameter("age")));
		member.setGender(req.getParameter("gender"));
		member.setEmail(req.getParameter("email"));
		member.setNation(req.getParameter("nation"));
		MemberService memberWriteService=new MemberService();
		boolean isWriteSuccess=memberWriteService.registMember(member);
		
		System.out.println("isWriteSuccess_Check:"+isWriteSuccess);
		
		if(!isWriteSuccess) {
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter out=resp.getWriter();
			out.println("<script>");
			out.println("alert('회원가입 실패')");
			out.println("history.back();");
			out.println("<script>");
			out.println("</script>");
		}else {
			forward=new ActionForward();
			forward.setRedirect(true);
			forward.setPath("welcome.jsp");
		}
				
		return forward;
	}
	
	
}
