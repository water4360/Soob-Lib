package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.MemberServiceFactory;
import controller.BaseController;
import member.MemberDAO;
import member.MemberVO;

public class MainController extends BaseController {
	
	
	public MainController() {
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
			return "index.jsp";
	}
}
