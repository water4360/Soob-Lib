package rent;

public class RentalVO {
	private String bookNo;
	private String title;
	private String author;
	private String publisher;
	private String rentId;
	private String renDate;
	private String dueDate;
	private int overdueDay;
	
	
	public RentalVO() {
		super();
	}
	public RentalVO(String bookNo, String title, String author, String publisher, String rentId, String renDate, String dueDate, int overdueDay) {
		super();
		this.bookNo = bookNo;
		this.title	= title;
		this.author = author;
		this.publisher = publisher;
		this.rentId = rentId;
		this.renDate = renDate;
		this.dueDate = dueDate;
		this.overdueDay = overdueDay;
	}
	public String getBookNo() {
		return bookNo;
	}
	public void setBookNo(String bookNo) {
		this.bookNo = bookNo;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getRentId() {
		return rentId;
	}
	public void setRentId(String rentId) {
		this.rentId = rentId;
	}
	public String getRenDate() {
		return renDate;
	}
	public void setRenDate(String renDate) {
		this.renDate = renDate;
	}
	public String getDueDate() {
		return dueDate;
	}
	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}
	public int getOverdueDay() {
		return overdueDay;
	}
	public void setOverdueDay(int overdueDay) {
		this.overdueDay = overdueDay;
	}
	@Override
	public String toString() {
						// no  title    aut     pub  ren due overdue
		System.out.printf("%d\t%-25s\t\t%-8s\t\t%-10s\t%s    %4s    %s\n"
				, bookNo
				, title
				, author
				, publisher
				, renDate
				, dueDate
				, overdueDay
				);
		return "";
	}
}
