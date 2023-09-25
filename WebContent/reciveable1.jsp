<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reciveable</title>
</head>
<body>
<%@ page import="javax.swing.*" %>
<%@ page import="java.sql.*" %>
<%
	String btnval=request.getParameter("b1");
	if(btnval.equalsIgnoreCase("allsearch"))
		{
			try
			{
				ResultSet rs;
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hrf", "hrf");
				Statement smt=conn.createStatement();
				rs=smt.executeQuery("select * from reciveable");
%>
				<center>
				<table border=1>
					<tr>
						<th>Program</th>
						<th>Session</th>
						<th>First Sem</th>
						<th>Second Sem</th>
						<th>Third Sem</th>
						<th>Fourth Sem</th>
						<th>Fifth sem</th>
						<th>Sixth Sem</th>
						<th>Seventh Sem</th>
						<th>Eighth Sem</th>
						<th>Total</th>
					</tr>				
				<%
				while(rs.next())
				{
				%>
				<tr>
					<th><%=rs.getString(1) %></th>
					<th><%=rs.getString(2)%></th>
					<th><%=rs.getString(3) %></th>
					<th><%=rs.getString(4) %></th>
					<th><%=rs.getString(5) %></th>
					<th><%=rs.getString(6) %></th>
					<th><%=rs.getString(7) %></th>
					<th><%=rs.getString(8) %></th>
					<th><%=rs.getString(9) %></th>
					<th><%=rs.getString(10) %></th>
					<th><%=rs.getString(11) %></th>
				</tr>
				<% } %>
				</table>
				<table>
					<tr><th><input type=button value="Print" onclick="window.print()"></th></tr>
					</table>
				<%
			}
			catch(Exception e)
			{
				out.println(e.toString());
			}
	}//End of AllSearch
		
		if(btnval.equalsIgnoreCase("search"))
		{
			String t12=request.getParameter("t12");
			String s=request.getParameter("s");
			try
			{
				ResultSet rs;
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hrf", "hrf");
				Statement smt=conn.createStatement();
				rs=smt.executeQuery("select * from reciveable where"+" "+s+"="+"'"+t12+"'");
%>
				<center>
				<table border=1>
					<tr>
						<th>Program</th>
						<th>Session</th>
						<th>First Sem</th>
						<th>Second Sem</th>
						<th>Third Sem</th>
						<th>Fourth Sem</th>
						<th>Fifth sem</th>
						<th>Sixth Sem</th>
						<th>Seventh Sem</th>
						<th>Eighth Sem</th>
						<th>Total</th>
					</tr>				
				<%
				while(rs.next())
				{
				%>
				<tr>
					<th><%=rs.getString(1) %></th>
					<th><%=rs.getString(2)%></th>
					<th><%=rs.getString(3) %></th>
					<th><%=rs.getString(4) %></th>
					<th><%=rs.getString(5) %></th>
					<th><%=rs.getString(6) %></th>
					<th><%=rs.getString(7) %></th>
					<th><%=rs.getString(8) %></th>
					<th><%=rs.getString(9) %></th>
					<th><%=rs.getString(10) %></th>
					<th><%=rs.getString(11) %></th>
				</tr>
				<% } %>
				</table>
				<table>
					<tr>
						<th><input type=button value="Print" onclick="window.print()"></th>
					</tr>
					</table>
				<%
			}
			catch(Exception e)
			{
				out.println(e.toString());
			}
	}//End of search


	if(btnval.equalsIgnoreCase("save"))
	{
		String t1=request.getParameter("t1");
		String t2=request.getParameter("t2");
		String t3=request.getParameter("t3");
		String t4=request.getParameter("t4");
		String t5=request.getParameter("t5");
		String t6=request.getParameter("t6");
		String t7=request.getParameter("t7");
		String t8=request.getParameter("t8");
		String t9=request.getParameter("t9");
		String t10=request.getParameter("t10");
		String t11=request.getParameter("t11");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hrf", "hrf");
			PreparedStatement psmt=conn.prepareStatement("insert into reciveable values(?,?,?,?,?,?,?,?,?,?,?)");
			psmt.setString(1,t1);
			psmt.setString(2,t2);
			psmt.setString(3,t3);
			psmt.setString(4,t4);
			psmt.setString(5,t5);
			psmt.setString(6,t6);
			psmt.setString(7,t7);
			psmt.setString(8,t8);
			psmt.setString(9,t9);
			psmt.setString(10,t10);
			psmt.setString(11,t11);
			psmt.executeQuery();
			out.println("<script>alert('Record Save')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}// End of save
	
	if(btnval.equalsIgnoreCase("delete"))
	{
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hrf", "hrf");
			PreparedStatement psmt=conn.prepareStatement("delete from reciveable");
			psmt.executeQuery();
			out.println("<script>alert('Record Delete')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}//End of delete
	
	if(btnval.equalsIgnoreCase("update"))
	{
		String t1=request.getParameter("t1");
		String t2=request.getParameter("t2");
		String t3=request.getParameter("t3");
		String t4=request.getParameter("t4");
		String t5=request.getParameter("t5");
		String t6=request.getParameter("t6");
		String t7=request.getParameter("t7");
		String t8=request.getParameter("t8");
		String t9=request.getParameter("t9");
		String t10=request.getParameter("t10");
		String t11=request.getParameter("t11");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hrf","hrf");
			PreparedStatement psmt=conn.prepareStatement("update reciveable set session1=?,first_sem=?,second_sem=?,third_sem=?,fourth_sem=?,fifth_sem=?,sixth_sem=?,seven_sem=?,eight_sem=?,total=? where program=?");
			psmt.setString(1,t2);
			psmt.setString(2,t3);
			psmt.setString(3,t4);
			psmt.setString(4,t5);
			psmt.setString(5,t6);
			psmt.setString(6,t7);
			psmt.setString(7,t8);
			psmt.setString(8,t9);
			psmt.setString(9,t10);
			psmt.setString(10,t11);
			psmt.setString(11,t1);
			psmt.executeQuery();
			out.println("<script>alert('Record Update')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}//End of update
%>
</body>
</html>