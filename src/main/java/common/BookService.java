package common;

import java.util.List;

import book.BookDAO;
import book.BookVO;

public class BookService {

	//BookService로 따로 빼주는 이유는
	//매번 bookDAO를 new 생성하면 데이터 다 날아감~~
	//공통된 테이블에서 유지되는 데이터를 가져오기 위해서임
	private BookDAO bookDao;
	
	
	public BookService() {
			bookDao = new BookDAO();
	}
	
	
	
	
	
	//1. bookDao단계에서 모아준 데이터를 추가해주는 메소드
	public void addBook(BookVO book) {
		bookDao.addBook(book);
	}
	
	//2. 모든 bookList를 보여주는 메소드
	public List<BookVO> showAllBooks() {
		List<BookVO> bookList = bookDao.showAllBooks();
		return bookList;
	}

	//3. 번호로 찾아서 보여주는 메소드(일단 단일)
	public BookVO searchOneByNo(String manageNo) {
		BookVO book = bookDao.searchOneBook(manageNo);
		return book;
	}
	
	//4. 번호로 찾아서 삭제하는 메소드
	public BookVO deleteBook(String manageNo) {
		BookVO book = bookDao.deleteBook(manageNo);
		return book;
	}
	
	//5. 번호로 찾아서 수정하는 메소드
	public BookVO modifyBook(int menu, String manageNo, String str) {
		BookVO book = bookDao.modifyBook(menu, manageNo, str);
		return book;
	}
	
	
	
	
	
	
	
	
//	
//	
//	//2. 모든 bookList를 보여주는 메소드
//	public List<BookVO> showAllBooks() {
//		List<BookVO> bookList = bookDao.showAllBooks();
//		return bookList;
//	}
//
//	//3. 번호로 찾아서 보여주는 메소드(일단 단일)
//	public BookVO searchOneByNo(int manageNo) {
//		BookVO book = bookDao.searchOneBook(manageNo);
//		return book;
//	}
	
	//3-2 메뉴에 따라 도서명/저자명 검색
	public List<BookVO> searchBooks(int menu, String str) {
		List<BookVO> bookList = bookDao.searchBooks(menu, str);
		return bookList;
	}
	
	//도서명,저자명,출판사명
	public String getTitle(String bookNo) {
		return bookDao.getTitle(bookNo);
	}
	public String getAuthor(String bookNo) {
		return bookDao.getAuthor(bookNo);
	}
	public String getPublisher(String bookNo) {
		return bookDao.getPublisher(bookNo);
	}
	
	
	//STATUS(대출상태) 변경
	public void changeStatus(int status, String bookNo) {
		bookDao.changeStatus(status, bookNo);
	}
}
