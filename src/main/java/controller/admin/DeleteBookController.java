package controller.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.BookDAO;
import controller.BaseController;
import rent.RentalDAO;

public class DeleteBookController extends BaseController {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 넘겨받는 값.
		String no = request.getParameter("bookNo");
		String msg = "";
		
		BookDAO dao = new BookDAO();
		
		//대여중이 아닐때
		if(no!=null && !dao.isRented(no)) {
			dao.deleteBook(no);
			System.out.println("삭제 완료 by DeleteBookCtrl");
			msg = "삭제가 완료되었어요.";
		} else {
			msg = "대출중인 도서는 삭제할 수 없어요.";
		}
		//확인용
		System.out.println("넘어온 북넘버 : " + no);
		
		request.setAttribute("deleteMsg", msg);
		
		return "allBooks.do";
		
	}

}
