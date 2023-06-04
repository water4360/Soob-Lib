package controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.BaseController;
import member.MemberVO;

public class MyPageController extends BaseController {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		//myPage를 눌렀을 때 뭐가 넘어오지????
		
//		사용자 접속정보를 세션에서 가져와서 유지할 수 있나?
//		HttpSession session = request.getSession();
//		
//		if(session.getAttribute("mem") != null) {
//			System.out.println("세션에 mem 정보? : " + session.getAttribute("mem"));
//			System.out.println("회원정보 존재. by MyPageC");
//			return "./jsp/myPage.jsp";
//		} else {
//			//사용자 정보가 없으면 잘못된 접근.
//			System.out.println("세션에 mem 정보? : " + session.getAttribute("mem"));
//			System.out.println("잘못된 접근, login으로.. by MyPageC");
//			return "login.do";
//		}
			return "./jsp/myPage.jsp";
		
	}

}
