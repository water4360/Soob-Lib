<%@page import="member.MemberVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		작업순서
		1. 파라미터(id, pw) 추출 먼저...
		2. 추출된 파라미터를 가진 회원 검색
		3. 검색결과에 따른 화면 출력
	*/

	/*
	하지만 id, pw가 한글이면 깨지지.
	왜냐? post는 인코딩 방식 때문이기 때문.
	얘가 위치한 순서도 중요하다~~!
	*/
	
	
	System.out.println("로그인페이지로 이동!");
// 	request.setCharacterEncoding("UTF-8");


	//post방식으로 넘어오는 애들은?
	//request.getParameter("인자")로 받아온다~
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	System.out.printf("id : %s, pw : %s\n", id, pw);
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	System.out.println("드라이버 로딩 완료!");
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "hr";
	String pass = "hr";
	
// 	System.out.println("conn : " + conn);
	
	StringBuilder sql = new StringBuilder();
	sql.append("SELECT * FROM MEMBER WHERE ID = ? AND PW = ?");
	
	try(
		Connection conn = DriverManager.getConnection(url, user, pass);
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	) {
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		
		ResultSet rs = pstmt.executeQuery();
		
		//로긴 실패여부를 알아 몰라? 모르지... 그러니까
		String msg = "";
		
		//그리고 로긴성공여부에 따라, 성공시:index페이지, 실패시:login페이지로 가도록.
		String locUrl="";
		
		if(rs.next()){
			MemberVO loginUser = new MemberVO();
			loginUser.setId(rs.getString("ID"));
			loginUser.setPw(rs.getString("PW"));
			loginUser.setUserName(rs.getString("NAME"));
			loginUser.setUserPhone(rs.getString("PHONE"));
			loginUser.setMemCode(rs.getInt("MEM_CODE"));
// 			loginUser.setType(rs.getString("type"));
			
			msg = loginUser.getUserName()+"님, 환영합니다!";
			System.out.println(msg);
			locUrl="/SoobLib";
			
			//이 정보는 브라우저가 종료되더라도 남아있어야겠지??
			//공유영역에 등록해줘야겠지.
			session.setAttribute("loginUser", loginUser);
		} else {
			msg = "입력하신 ID 또는 PW가 잘못되었습니다.";
			System.out.println(msg);
			locUrl="./login.do";
		}
		
		//얘네는 html 바디에서 수행할 것이므로 화면에 출력해야 할 msg와 url을 등록시킨 것임. 
		pageContext.setAttribute("msg", msg);
		pageContext.setAttribute("url", locUrl);
		
	} catch(Exception e) {
		e.printStackTrace();
	}
	
 %>
 
 <script>
 	//alert('${ msg }')
 	//history 객체를 이용하면 바로 뒤페이지로 백으로 가는것도 가능...은 함!
 	//하지만 우린 url을 바꿀 것임.
 	//history.go(-1)
 	location.href= '${ url }'
 </script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 로그인 진행중 :: </title>
</head>
<body>
	${ msg }
</body>
</html>