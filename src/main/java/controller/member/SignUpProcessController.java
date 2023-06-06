package controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.BaseController;
import member.MemberVO;

public class SignUpProcessController extends BaseController{
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
//		int code = Integer.parseInt(request.getParameter("admin-code"));
		//관리자코드 유효성 검사
//		boolean isAdminCode = code == 9;
		
		//데이터 전달 확인용
		System.out.printf("%s, %s, %s, %s, %s\n", id, pw, name, phone, email);
		
		//
		MemberVO vo = new MemberVO(id, pw, name, phone, email);
		
		//멤버 추가 MemberService - MemberDAO 통해서
		memService.addMember(vo);
		
		
		//회원가입 완료, [메인으로][로그인으로] 보여주기
		return "./jsp/signupProcess.jsp";
	}
}
