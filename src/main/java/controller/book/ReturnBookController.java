package controller.book;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.BaseController;
import rent.RentalDAO;

public class ReturnBookController extends BaseController {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 넘겨받는 값.
		String id = request.getParameter("memberId");
		String no = request.getParameter("bookNo");
		String msg = "";

		RentalDAO dao = new RentalDAO();

		// dao통해서 책반납
		if (id != null && no != null) {
			dao.returnBook(id, no);
			System.out.println("반납 완료 by ReturnBookCtrl");
			msg = "반납이 완료되었어요.";
		} else {
			msg = "반납에 실패했어요. 관리자에게 문의하세요.";
		}
		// 확인용
		System.out.println("넘어온 id : " + id);
		System.out.println("넘어온 북넘버 : " + no);

		request.setAttribute("returnMsg", msg);

		return "myLibrary.do";
	}

}
