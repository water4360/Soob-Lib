package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberVO;
import rent.RentalDAO;
import rent.RentalVO;

public class MyLibraryController extends BaseController {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
		session = request.getSession();
		if(session.getAttribute("loginMember")!=null) {
			MemberVO vo = (MemberVO)session.getAttribute("loginMember");

			String id = vo.getId();
			
			RentalDAO dao = new RentalDAO();
			List<RentalVO> rentalList = dao.getRentalList(id);
			
			session.setAttribute("rentalList", rentalList);
			return "/jsp/member/myLibrary.jsp";
		}
		//로그인 정보가 없다면 로그인 먼저!
		return "login.do";
	}
}
