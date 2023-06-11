package controller.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.BaseController;
import rent.RentalDAO;
import rent.RentalVO;

public class RentBookController extends BaseController {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		//넘겨받는 값.
		String id = request.getParameter("memberId");
		String no = request.getParameter("bookNo");
		String msg = "";
		
		RentalDAO dao = new RentalDAO();
		
		//dao통해서 책등록
		if(id!=null && no!=null) {
			dao.addRental(id, no);
			System.out.println("대출 완료 by RentBookCtrl");
			msg = "대출이 완료되었습니다.";
		} else {
			msg = "대출에 실패했어요. 관리자에게 문의하세요.";
		}
		//확인용
		System.out.println("넘어온 id : " + id);
		System.out.println("넘어온 북넘버 : " + no);
		
		request.setAttribute("rentMsg", msg);
	
		return "allBooks.do";
	}

}
