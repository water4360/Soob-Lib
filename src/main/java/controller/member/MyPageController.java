package controller.member;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.BaseController;
import member.MemberDAO;
import member.MemberVO;

public class MyPageController extends BaseController {

	@Override  
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		session = request.getSession();
		
		if(session.getAttribute("loginMember")!=null) {
			MemberVO vo = (MemberVO)session.getAttribute("loginMember");

			String id = vo.getId();
			
			MemberDAO dao = new MemberDAO();
			
			vo = dao.getMemberById(id);
			
			session.setAttribute("memInfo", vo);
			return "/jsp/member/myPage.jsp";
		}
		//로그인 정보가 없다면 로그인 먼저!
		return "login.do";
	}

}
