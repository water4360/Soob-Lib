package common;

public class PrintService {
	
	public PrintService() {}

	public void printTop() {
		System.out.println("―".repeat(130));
		System.out.println("도서번호\t\t\t도 서 명\t\t저  자\t\t\t출판사\t\t\t대출현황");
		System.out.println("―".repeat(130));
	}
	
	public void addTop() {
		System.out.println("―".repeat(130));
		System.out.println("\t\t\t도 서 명\t\t저  자\t\t\t\t출판사");
		System.out.println("―".repeat(130));
	}
	
	public void printBottom() {
		System.out.println("―".repeat(130));
	}

	
	public void rentalTop() {
		System.out.println("―".repeat(130));
		System.out.println("도서번호\t\t\t도 서 명\t\t저  자\t\t\t출판사\t\t대출일자    반납기한    남은일수");
		System.out.println("―".repeat(130));
	}
	
	public void rentalBottom() {
		System.out.println("―".repeat(130));
	}

	public void memTop() {
		System.out.println("―".repeat(130));
		System.out.println("ID\t\t\tPW\t\t\t이름\t\t연락처");
		System.out.println("―".repeat(130));
	}

	public void memBottom() {
		System.out.println("―".repeat(130));
	}
	
}
