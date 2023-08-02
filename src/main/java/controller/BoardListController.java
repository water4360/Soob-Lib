package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.PostDAO;
import board.PostVO;

public class BoardListController extends BaseController {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PostDAO dao = new PostDAO();
		
		List<PostVO> postList = dao.getAllPosts();
		
		request.setAttribute("board", postList);
		return "./jsp/board/board.jsp";
	}

}
