package controller;

import java.util.HashMap;
import java.util.Map;

import controller.member.SignUpController;
import controller.member.SignUpProcessController;
import controller.admin.BoardManageController;
import controller.admin.BookManageController;
import controller.admin.MemberManageController;
import controller.book.AllBooksController;
import controller.book.BookAddProcessController;
import controller.book.SearchBookController;
import controller.member.LoginController;
import controller.member.LoginProcessController;
import controller.member.LogoutController;
import controller.member.MyPageController;

//클라이언트에서 Controller요청이 들어오면 얘가 상속받아서 넘겨주는...??...  
public class HandlerMapping {
	//선언. 여기서의 Controller = 만들어둔 인터페이스.
	private Map<String, Controller> mappings;
	
	//초기화
	public HandlerMapping() {
		mappings = new HashMap<String, Controller>();
		
		//xxx.do가 들어오면 xxxControlloer()로 안내!
		mappings.put("/main.do", new MainController());
		mappings.put("/signup.do", new SignUpController());
		mappings.put("/signupProcess.do", new SignUpProcessController());
		
		//공용
		mappings.put("/login.do", new LoginController());
		mappings.put("/loginProcess.do", new LoginProcessController());
		
		mappings.put("/allBooks.do", new AllBooksController());
		mappings.put("/searchBook.do", new SearchBookController());
		mappings.put("/rentBook.do", new RentBookController());
		
		
		//관리자 메뉴용
		mappings.put("/admin-member.do", new MemberManageController());
//		mappings.put("/admin-book.do", new SearchBookController());
		mappings.put("/admin-board.do", new BoardManageController());
		mappings.put("/add-book-process.do", new BookAddProcessController());
		
		
		//이거 memberService 팩토리 어쩌구 있어야
		//자꾸 새로 mem객체 생성안하고 유지될듯!
		mappings.put("/myPage.do", new MyPageController());
		mappings.put("/logout.do", new LogoutController());
	}
	public Controller getController(String path) {
		return mappings.get(path);
	}
}
