<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Deduction</title>
</head>
<body>
	<%@ page import="javax.swing.*"%>
	<%@ page import="java.sql.*"%>
	<%
		String btnval = request.getParameter("b1");
		
			// Search
		
		if (btnval.equalsIgnoreCase("search")) {
			String t5 =request.getParameter("t5");
			String s = request.getParameter("s");
			try {
				ResultSet rs;
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hrf", "hrf");
				Statement smt = conn.createStatement();
				rs = smt.executeQuery("select * from deduction where" + " " + s + "=" + "'" + t5 + "'");
	%>
	<center>
		<table border=1>
			<tr>
				<th>EMPLOYEE ID</th>
				<th>NAME</th>
				<th>DEDUCTION</th>
				<th>DATE</th>

			</tr>
			<%
				while (rs.next()) {
			%>
			<tr>
				<th><%=rs.getString(1)%></th>
				<th><%=rs.getString(2)%></th>
				<th><%=rs.getString(3)%></th>
				<th><%=rs.getString(4)%></th>
			</tr>
			<%
				}
			%>
		</table>
		<table>
			<tr>
				<th><input type=button value="Print" onclick="window.print()"></th>
			</tr>
		</table>
		</center>
		<%
			} catch (Exception e) {
					e.printStackTrace();

				}
			} //End of  search
		%>			
		<%
				// All Search
			if (btnval.equalsIgnoreCase("allsearch")) {
				try {
					ResultSet rs;
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hrf", "hrf");
					Statement smt = conn.createStatement();
					rs = smt.executeQuery("select * from deduction");
		%>
		<center>
			<table border=1>
				<tr>
					<th>EMPLOYEE ID</th>
					<th>NAME</th>
					<th>DEDUCTION</th>
					<th>DATE</th>

				</tr>
				<%
					while (rs.next()) {
				%>
				<tr>
					<th><%=rs.getString(1)%></th>
					<th><%=rs.getString(2)%></th>
					<th><%=rs.getString(3)%></th>
					<th><%=rs.getString(4)%></th>
				</tr>
				<%
					}
				%>
			</table>
			<table>
				<tr>
					<th><input type=button value="Print" onclick="window.print()"></th>
				</tr>
			</table>
			<%
				} catch (Exception e) {
					out.println(e.toString());

					}
				} //End of all search
			%>

			<%
				if (btnval.equalsIgnoreCase("save")) {
					String t1 = request.getParameter("t1");
					String t2 = request.getParameter("t2");
					String t3 = request.getParameter("t3");
					String t4 = request.getParameter("t4");
					try {
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hrf", "hrf");
						PreparedStatement psmt = conn.prepareStatement("insert into deduction values(?,?,?,?)");
						psmt.setString(1, t1);
						psmt.setString(2, t2);
						psmt.setString(3, t3);
						psmt.setString(4, t4);
						psmt.executeQuery();
						out.println("<script>alert('Record Save')</script>");
					} catch (Exception e) {
						out.println(e.toString());
					}
				} //End of save

				if (btnval.equalsIgnoreCase("delete")) {

					try {
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hrf", "hrf");
						PreparedStatement psmt = conn.prepareStatement("delete from deduction");
						psmt.executeQuery();
						out.println("<script>alert('Record Deleted')</script>");
					} catch (Exception e) {
						out.println(e.toString());
					}
				} //End of Delete

				if (btnval.equalsIgnoreCase("update")) {
					String t1 = request.getParameter("t1");
					String t2 = request.getParameter("t2");
					String t3 = request.getParameter("t3");
					String t4 = request.getParameter("t4");
					try {
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hrf", "hrf");
						PreparedStatement psmt = conn
								.prepareStatement("update deduction set name=?,ded_allo=?,date1=? where empid=?");
						psmt.setString(1, t2);
						psmt.setString(2, t3);
						psmt.setString(3, t4);
						psmt.setString(4, t1);
						psmt.executeQuery();
						out.println("<script>alert('Record Update')</script>");
					} catch (Exception e) {
						out.println(e.toString());
					}
				} //End of update
			%>
		
</body>