<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Attendance</title>
</head>
<body>
	<%@  page import="javax.swing.*"%>
	<%@ page import="java.sql.*"%>
	<%
		String btnval = request.getParameter("b1");
			// Search Starts Here
	
		if(btnval.equalsIgnoreCase("search"))
		{
			String t8=request.getParameter("t8");
			String s =request.getParameter("s");
			try
			{
				ResultSet rs;
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hrf", "hrf");
				Statement smt=conn.createStatement();
				rs=smt.executeQuery("select * from attendance where" + " " + s + "=" + "'" + t8 + "'");
			%>
			<center>
			<table border=2>
				<tr>
					<th>Employee Id</th>
					<th>Name</th>
					<th>Present</th>
					<tH>Month</tH>
					<th>Years</th>
					<th>Days</th>
					<th>Status</th>
				</tr>
<%
			while(rs.next())
			{
%>
			<tr>
				<th><%=rs.getString(1) %></th>
				<th><%=rs.getString(2) %></th>
				<th><%=rs.getString(3) %></th>
				<th><%=rs.getString(4) %></th>
				<th><%=rs.getString(5) %></th>
				<th><%=rs.getString(6) %></th>
				<th><%=rs.getString(7)%></th>
			</tr>
			<%} %>
			</table></center>
			<center>
			<table>
				<tr><th><input type=button value="Print" onclick="window.pint()"></th></tr> 
			</table>
			</center>
			
<%
			}
			catch(Exception e)
			{	
				out.println(e.toString());
			}
		}//End of Search
%>
<%
		// All Search	
		if (btnval.equalsIgnoreCase("allsearch")) {
			try {
				ResultSet rs;
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hrf", "hrf");
				Statement smt = conn.createStatement();
				rs = smt.executeQuery("select * from attendance");
	%>
	<center>
		<table border=1>
			<tr>
				<th>EMPLOYEE ID</th>
				<th>NAME</th>
				<th>Present</th>
				<th>Month</th>
				<th>Year</th>
				<th>Days</th>
				<th>Status</th>
			</tr>
			<%
				while (rs.next()) {
			%>
			<tr>
				<th><%=rs.getString(1)%></th>
				<th><%=rs.getString(2)%></th>
				<th><%=rs.getString(3)%></th>
				<th><%=rs.getString(4)%></th>
				<th><%=rs.getString(5)%></th>
				<th><%=rs.getString(6)%></th>
				<th><%=rs.getString(7)%></th>
			</tr>
			<%
				}
			%>

		</table>
		<table>
			<tr><th><input type=button value="Print" onclick="window.print()"></th></tr>
		</table>
		</center>
		<%
			} catch (Exception e) 
			{
				out.println(e.toString());
			}	
			} //End of all search
		%>


		<%
			// End of Save

			if (btnval.equalsIgnoreCase("save")) {
				String t1 = request.getParameter("t1");
				String t2 = request.getParameter("t2");
				String t3 = request.getParameter("t3");
				String t4 = request.getParameter("t4");
				String t5 = request.getParameter("t5");
				String t6 = request.getParameter("t6");
				String t7 = request.getParameter("t7");
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hrf", "hrf");
					PreparedStatement psmt = conn.prepareStatement("insert into attendance values(?,?,?,?,?,?,?)");
					psmt.setString(1, t1);
					psmt.setString(2, t2);
					psmt.setString(3, t3);
					psmt.setString(4, t4);
					psmt.setString(5, t5);
					psmt.setString(6, t6);
					psmt.setString(7, t7);
					psmt.executeQuery();
					out.println("<script>alert('Record Saved')</script>");
				} catch (Exception e) {
					out.println(e.toString());
				}
			} //End of save

			// Delete

			if (btnval.equalsIgnoreCase("delete")) {
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hrf", "hrf");
					PreparedStatement psmt = conn.prepareStatement("delete from attendance");
					psmt.executeQuery();
					out.println("<script>alert('Record Deleted')</script>");
				} catch (Exception e) {
					out.println(e.toString());
				}
			} //End of delete

			// Update

			if (btnval.equalsIgnoreCase("update")) {
				String t1 = request.getParameter("t1");
				String t2 = request.getParameter("t2");
				String t3 = request.getParameter("t3");
				String t4 = request.getParameter("t4");
				String t5 = request.getParameter("t5");
				String t6 = request.getParameter("t6");
				String t7 = request.getParameter("t7");
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hrf", "hrf");
					PreparedStatement psmt = conn.prepareStatement(
							"update attendance set name=?,present=?,month=?,yr=?,days=?,status=? where empid=?");
					psmt.setString(1, t2);
					psmt.setString(2, t3);
					psmt.setString(3, t4);
					psmt.setString(4, t5);
					psmt.setString(5, t6);
					psmt.setString(6, t7);
					psmt.setString(7, t1);
					psmt.executeQuery();
					out.println("<script>alert('Record Update')</script>");
				} catch (Exception e) {
					out.println(e.toString());
				}
			} //End of update
		%>
	
</body>
</html>