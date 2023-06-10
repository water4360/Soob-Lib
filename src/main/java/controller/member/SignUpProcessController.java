package controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.BaseController;
import member.MemberVO;

public class SignUpProcessController extends BaseController {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");

		// 데이터 전달 확인용
		System.out.printf("%s, %s, %s, %s, %s\n", id, pw, name, phone, email);

		// 멤버 추가 MemberService - MemberDAO 통해서
		MemberVO vo = new MemberVO(id, pw, name, phone, email);
		memService.addMember(vo);

		// 그리고 이 mem을 session에 MemberVO형태 고대로 넘겨줌.
//			session = request.getSession();
			session.setAttribute("signInMember", vo);
			System.out.println("회원가입 완료. by SignUpProcessCtrl");
			
			// 회원가입 완료, [메인으로][로그인으로] 보여주기
			return "./jsp/signupProcess.jsp";
	}
}
