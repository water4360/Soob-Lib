package controller.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.BaseController;
import rent.RentalDAO;
import rent.RentalVO;

public class RentBookController extends BaseController {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		//넘겨받는 값. 여전히 테스트중
		String id = request.getParameter("memberId");
		String no = request.getParameter("boook");
		
		RentalDAO dao = new RentalDAO();
		
		//dao통해서 책등록
		dao.addRental(id, no);
		System.out.println("대여 완료 by RentBookCtrl");
		//확인용
		System.out.println("넘어온 id : " + id);
		System.out.println("걍 버튼으로 받는 북넘버 : " + no);
	
		return "allBooks.do";
	}

}
