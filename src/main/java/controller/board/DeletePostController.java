package controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.PostDAO;
import controller.BaseController;


public class DeletePostController extends BaseController {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		int no = Integer.parseInt(request.getParameter("no"));
		
		new PostDAO().deletePost(no);
		return "redirect:board.do";
	}

}
