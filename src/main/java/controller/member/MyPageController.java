package controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.BaseController;
import controller.Controller;
import member.MemberVO;

public class MyPageController extends BaseController {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		//사용자 접속정보를 세션에서 가져와서 유지할 수 있나?
		HttpSession session = request.getSession();
		MemberVO mem = (MemberVO)session.getAttribute("mem");
		
		if(mem != null) {
			System.out.println("회원정보 존재. by MyPageController");
			return "myPage.do";
		} else {
			//사용자 정보가 없으면 잘못된 접근.
			System.out.println("잘못된 접근, login으로.. by MyPageC");
			return "login.do";
		}
	}

}
