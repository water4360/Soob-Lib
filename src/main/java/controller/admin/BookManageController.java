package controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.BookDAO;
import book.BookVO;
import controller.BaseController;

public class BookManageController extends BaseController{
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		BookDAO dao = new BookDAO();
		
		List<BookVO> bookList = dao.showAllBooks();
		
		request.setAttribute("bookList", bookList);
		
		return "./jsp/book/allBooks.jsp";
	}

}
