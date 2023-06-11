package controller.member;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.BaseController;
import controller.Controller;
import member.MemberDAO;

public class FindIdController extends BaseController {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
		return "./jsp/member/findId.jsp";
	}

}
