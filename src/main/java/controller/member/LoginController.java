package controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.MemberServiceFactory;
import controller.BaseController;
import member.MemberDAO;
import member.MemberVO;

public class LoginController extends BaseController {
	
	
	public LoginController() {
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
			return "./jsp/login.jsp";
	}
}
