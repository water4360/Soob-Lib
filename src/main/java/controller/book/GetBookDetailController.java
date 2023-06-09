package controller.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.BookDAO;
import book.BookVO;
import controller.BaseController;

public class GetBookDetailController extends BaseController {
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("isbn");
		
		//사용자 클릭한 vo넘버
		BookVO vo = new BookVO();
		vo.setManageNo(no);
		
		BookDAO dao = new BookDAO();
		BookVO book = dao.searchOneBook(no);
		
		request.setAttribute("book", book);
		
		return null;
	}

}
