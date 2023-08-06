package controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.PostDAO;
import board.PostVO;
import controller.BaseController;

public class PostDetailController extends BaseController {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		
		int no = Integer.parseInt(request.getParameter("no"));
		PostVO vo = new PostDAO().getPostDetail(no);
		
		System.out.println("글번호 : " + vo);
		
		request.setAttribute("post", vo);
		return "./jsp/board/post-detail.jsp";
	}	

}
