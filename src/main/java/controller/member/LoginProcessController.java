package controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.BaseController;
import controller.Controller;
import member.MemberDAO;
import member.MemberVO;

public class LoginProcessController extends BaseController {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		// 사용자 입력 id, pw
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		MemberVO vo = new MemberVO();

		MemberDAO dao = new MemberDAO();
		// dao의 메소드에서 id&pw 일치하면
		if (dao.isCorrectInfo(id, pw)) {
			vo.setId(id);
			vo.setPw(pw);
			System.out.println("회원정보 일치! by LoginProcessController");
			return "index.jsp";
		} else {
			//일치하지 않으면~
			System.out.println("회원정보 불일치! by LoginProcessController");
			return "./jsp/login.jsp";
		}
	}

}
