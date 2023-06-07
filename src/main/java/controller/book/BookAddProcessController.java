package controller.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import book.BookDAO;
import book.BookVO;
import controller.BaseController;

public class BookAddProcessController extends BaseController {
	@SuppressWarnings("finally")
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		int no = Integer.parseInt(request.getParameter("isbn"));
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String publisher = request.getParameter("publisher");
		int status = request.getParameter("status").equals("1") ? 1 : 0;

		// 데이터 전달 확인용
		System.out.printf("사용자입력 : %d, %s, %s, %s, %d\n", no, title, author, publisher, status);

		try {
			// 책 추가, 일단 인기도는 기본 0으로.
			BookVO vo = new BookVO(no, title, author, publisher, status, 0);
			BookDAO dao = new BookDAO();

			dao.addBook(vo);

			// book을 session에 넘겨주기.
			HttpSession session = request.getSession();
			session.setAttribute("newBook", vo);
			System.out.println("신규도서등록 완료. by BookAddCtrl");
			vo = null;
			return "admin-book.do";
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 다시 관리자 책관리 페이지로.
			return "admin-book.do";
		}
	}

}
