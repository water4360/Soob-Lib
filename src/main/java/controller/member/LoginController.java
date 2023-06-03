package controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import member.MemberDAO;
import member.MemberVO;

public class LoginController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		// 일단 간단하게 id만 넣어보고.
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		// 사용자가 로그인할때 입력한 값을 VO에 담아주기
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPw(pw);

		MemberDAO dao = new MemberDAO();
		// VO에 담아준 걸로 DAO에서 비교해서 일치하는 사용자 정보 가져온게 mem
		MemberVO mem = dao.getMemberById(id);
		
		if(mem != null && mem.getId().equals(id) && mem.getPw().equals(pw)) {
			HttpSession session = request.getSession();
			session.setAttribute("mem", mem);
			System.out.println("회원정보 존재. by LoginController");
			return "index.jsp";
		} else {
			//사용자 정보가 없으면 로그인페이지로 감.
			//로긴페이지에서 분간해서 loginProcess로 보내줌ㅋㅋ
			System.out.println("로그인하러 고고씽. by LoginController");
			return "./jsp/login.jsp";
		}

	}
}
