package rent;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import common.BookService;
import common.BookServiceFactory;
import common.ConnectionFactory;
import member.MemberVO;


/**
 * 오라클 DB의 RENTAL
 * @author User
 *
 */


public class RentalDAO {
	
	private BookService service;
	private RentalVO ren;
	StringBuilder sql = new StringBuilder();
	
	//대출정보 등록
	public RentalVO addRental(String id, String no) {
		service = BookServiceFactory.getInstance();
		int result = 0;

		//여기서는 렌탈 정보 등록해주고
		sql.append("INSERT INTO RENTAL(NO, TITLE, AUTHOR, PUBLISHER, RENT_ID) ");
		sql.append("            VALUES(?, ?, ?, ?, ?) ");
	
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			pstmt.setString(1, no);
			pstmt.setString(2, service.getTitle(no));
			pstmt.setString(3, service.getAuthor(no));
			pstmt.setString(4, service.getPublisher(no));
			pstmt.setString(5, id);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
			//정상적으로 대출가 등록되면
			if(result!=0) {
				//여기서는 북리스트에 데이터 반영해주고. 반납도 역으로 활용할 것.
				sql = new StringBuilder();
				sql.append("UPDATE BOOKLIST SET STATUS='0' WHERE NO=? ");
				try(
						Connection conn = new ConnectionFactory().getConnection();
						PreparedStatement pstmt = conn.prepareStatement(sql.toString());
					) {
					pstmt.setString(1, no);
					pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				}

				sql = new StringBuilder();
				//연체현황 업데이트 먼저 해주고
				sql.append("UPDATE RENTAL SET OVERDUE_STATE = CEIL(DUE_DATE - SYSDATE) ");
				sql.append(" WHERE RENT_ID = ? ");
				try(
						Connection conn = new ConnectionFactory().getConnection();
						PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				) {
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
		
		return ren;
	}
	
	
	//ID에 따른 대출목록
		public List<RentalVO> getRentalList(String id) {
			List<RentalVO> rentalList= new ArrayList<>();
			SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
			
			StringBuilder sql = new StringBuilder();
			//그리고 나서 회원대출 리스트 보여주기
			sql.append("SELECT * FROM RENTAL WHERE RENT_ID = ? ");
			sql.append("ORDER BY OVERDUE_STATE ");
			try(
					Connection conn = new ConnectionFactory().getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			) {
				pstmt.setString(1, id);
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()) {
					String no 		= rs.getString("NO");
					String title	= rs.getString("TITLE");
					String author	= rs.getString("AUTHOR");
					String publisher= rs.getString("PUBLISHER");
					String rentId	= rs.getString("RENT_ID");
					String renDate 	= sdf.format(rs.getDate("REN_DATE"));
					String dueDate 	= sdf.format(rs.getDate("DUE_DATE"));
					int overdueDays = rs.getInt("OVERDUE_STATE");
					
					ren = new RentalVO(no, title, author, publisher, rentId, renDate, dueDate, overdueDays);
					rentalList.add(ren);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			sql = new StringBuilder();
			//연체현황 업데이트 먼저 해주고
			sql.append("UPDATE RENTAL SET OVERDUE_STATE = CEIL(DUE_DATE - SYSDATE) ");
			sql.append(" WHERE RENT_ID = ? ");
			try(
					Connection conn = new ConnectionFactory().getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			) {
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return rentalList;
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	//도서반납(대출정보 수정)
	public void returnBook(String id, String bookNo) {
		StringBuilder sql = new StringBuilder();
		int result = 0;
		//책넘버, ID에 따라 OVERDUE STATE만 NULL로 바꿀까?
		//OVERDUE_STATE가 만약 NOT NULL로 돼있으면 빼줄것.
		sql.append("DELETE RENTAL WHERE NO = ? AND RENT_ID = ? ");
	
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			pstmt.setString(1, bookNo);
			pstmt.setString(2, id);
			
			result = pstmt.executeUpdate();
			if(result==0) {
				System.out.println("여기는 RentalDAO, 업데이트 에러");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//정상적으로 반납리스트에서 삭제되면
		if(result!=0) {
			//여기서는 북리스트에 데이터 반영해줄것.
			sql = new StringBuilder();
			sql.append("UPDATE BOOKLIST SET STATUS='1' WHERE NO=? ");
			try(
					Connection conn = new ConnectionFactory().getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				) {
				pstmt.setString(1, bookNo);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	
	
	//도서번호로 반납기한 가져오기
	public String getDueDate(String bookNo) {
		SimpleDateFormat sdf = new SimpleDateFormat("YY-MM-dd");
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT DUE_DATE FROM RENTAL WHERE NO = ? AND RENT_ID = ? ");
	try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			pstmt.setString(1, bookNo);
			pstmt.setString(2, new MemberVO().getId());
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				return sdf.format(rs.getDate("DUE_DATE"));
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	
	//도서번호로 연체(일수) 가져오기
	public int getOverDue(String bookNo) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT OVERDUE_STATE FROM RENTAL WHERE NO = ? AND ID = ? ");
	try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			pstmt.setString(1, bookNo);
			pstmt.setString(2, new MemberVO().getId());
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
				return rs.getInt("OVERDUE_STATE");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -99;
	}

	//???도서 정보 수정이 왜 여기에,,,?
	public void updateBook(int menu, String bookNo, String str) throws Exception{
		StringBuilder sql = new StringBuilder();
		//연체현황 업데이트 먼저 해주고
		
		switch(menu) {
			//도서명
			case 1 :
				sql.append("UPDATE RENTAL WHERE NO = ? ");
				try(
						Connection conn = new ConnectionFactory().getConnection();
						PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				) {
					pstmt.setString(1, bookNo);
					pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
			//저자명
			case 2 : 
				sql.append("UPDATE RENTAL SET AUTHOR = ? ");
				sql.append(" WHERE NO = ? ");
				try(
						Connection conn = new ConnectionFactory().getConnection();
						PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				) {
					pstmt.setString(1, str);
					pstmt.setString(2, bookNo);
					pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
			//출판사명
			case 3 :
				sql.append("UPDATE RENTAL SET PUBLISHER = ? ");
				sql.append(" WHERE NO = ? ");
				try(
						Connection conn = new ConnectionFactory().getConnection();
						PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				) {
					pstmt.setString(1, str);
					pstmt.setString(2, bookNo);
					pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
		}
	}
	
	
	
	
	
	
	
	

//	//대출중인 도서 목록
//	public List<RentalVO> getRentalBookList(String id) {
//		renService = new RentalService();
//		RentalVO ren = new RentalVO();
//		
//		List<RentalVO> bookList = null;  
//		
//		StringBuilder sql = new StringBuilder();
//		sql.append("SELECT * FROM T_RENTAL WHERE ID = ? ");
//	
//		try(
//				Connection conn = new ConnectionFactory().getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
//		) {
//			pstmt.setString(1, id);
//			
//			ResultSet rs = pstmt.executeQuery();
//			
//			while(rs.next()) {
//				int no = rs.getInt("NO");
//				String title = rs.getString("TITLE");
//				String author = rs.getString("");
//				String publisher = rs.getString("TITLE");
////				int rentDate = rs.getDate("RENT_DATE");
////				int dueDate = rs.getDate("DUE_DATE");
//			}
//			
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return bookList;
//	}
	
	
}
