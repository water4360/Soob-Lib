package book;

public class BookVO {

	//관리번호, 도서명, 저자, 출판사, 보유권수, 대여상태
	private String manageNo;
	private String title;
	private String author;
	private String publisher;
	private int status; // 0:대여불가, 1:대여가능
	private int pop;
	
	public BookVO(String manageNo, String title, String author, String publisher, int status, int pop) {
		super();
		this.manageNo 	= manageNo;
		this.title		= title;
		this.author 	= author;
		this.publisher  = publisher;
		this.status 	= status;
		this.pop 		= pop;
	}
	
	
	public BookVO() {
		super();
	}
	
	public String getManageNo() {
		return manageNo;
	}
	public void setManageNo(String manageNo) {
		this.manageNo = manageNo;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getPop() {
		return pop;
	}
	public void setPop(int pop) {
		this.pop = pop;
	}
}
