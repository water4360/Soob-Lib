package board;

public class PostVO {

	// 글번호, 작성자, 제목, 내용, 작성일, 조회수, 게시글 수
	private int no;
	private String writer;
	private String title;
	private String content;
	private String regDate;
	private int hit;
	private int replyCnt;

	// 원글, 답or답답, 순서
	private int ref;
	private int lev;
	private int step;

	public PostVO() {
		super();
	}

	// 작성정보 받아오기
	public PostVO(String writer, String title, String content) {
		super();
		this.writer = writer;
		this.title = title;
		this.content = content;
	}

	// 게시글 등록용
	public PostVO(int no, String writer, String title, String content, String regDate, int hit, int replyCnt, int ref,
			int lev, int step) {
		super();
		this.no = no;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.hit = hit;
		this.replyCnt = replyCnt;
		this.ref = ref;
		this.lev = lev;
		this.step = step;
	}
	// 게시글 상세 불러오기용
	public PostVO(int no, String writer, String title, String content, String regDate, int hit, int ref,
			int lev, int step) {
		super();
		this.no = no;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.hit = hit;
		this.ref = ref;
		this.lev = lev;
		this.step = step;
	}


	//게시글 수정용
	public PostVO(int no, String title, String content) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getReplyCnt() {
		return replyCnt;
	}

	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getLev() {
		return lev;
	}

	public void setLev(int lev) {
		this.lev = lev;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	@Override
	public String toString() {
		return "PostVO [no=" + no + ", writer=" + writer + ", title=" + title + ", content=" + content + ", regDate="
				+ regDate + ", hit=" + hit + ", replyCnt=" + replyCnt + ", ref=" + ref + ", lev=" + lev + ", step="
				+ step + "]";
	}

}
