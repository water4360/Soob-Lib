package controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import member.MemberDAO;
import member.MemberVO;

public class MemberManageController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		MemberVO vo = new MemberVO();
		MemberDAO dao = new MemberDAO();
		
		List<MemberVO> memList = dao.getAllMembers();
		
		request.setAttribute("memberList", memList);
		return "./jsp/admin-member.jsp";
	}
}
