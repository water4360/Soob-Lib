package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rent.RentalDAO;
import rent.RentalVO;

public class RentBookController extends BaseController {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		//넘겨받는 값.
		String id = request.getParameter("userId");
		String no = request.getParameter("bookNo");
		
		//확인용
		System.out.println("RentBook에서 받는 id : " + request.getParameter("userId"));
		System.out.println("RentBook에서 받는 bookNo : " + request.getParameter("bookNo"));
		
		RentalVO vo = new RentalVO();
		
		vo.setRentId(id);
		vo.setBookNo(no);
		
		RentalDAO dao = new RentalDAO();
		
		//dao통해서 책등록
		dao.addRental(id, no);
		System.out.println("대여 완료 by RentBookCtrl");
	
		return "allBooks.do";
	}

}
