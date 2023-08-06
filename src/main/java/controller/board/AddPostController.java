package controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.PostDAO;
import board.PostVO;
import controller.BaseController;
import member.MemberVO;

public class AddPostController extends BaseController {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("게시글등록Ctrl 진입");
		
		session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("loginMember");
		System.out.println("loginMember : " + vo);
		System.out.println("loginMember ID : " + vo.getId());
		
		String writer = ((MemberVO)session.getAttribute("loginMember")).getId();
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		PostVO post = new PostVO(writer, title, content);
		System.out.println("넘어온 정보 : " + post);
		
		//등록
		new PostDAO().addPost(post);
		
		return "board.do";
	}

}
