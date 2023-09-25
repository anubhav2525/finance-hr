<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Scholarship</title>
</head>
<body>
<%@ page import="javax.swing.*" %>
<%@ page import="java.sql.*" %>
<%
	String btnval=request.getParameter("b1");
	if(btnval.equalsIgnoreCase("search"))
	{
		String t6=request.getParameter("t6");
		String s=request.getParameter("s");
		try{
			ResultSet rs;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hrf", "hrf");
			Statement smt=conn.createStatement();
			rs=smt.executeQuery("select * from scholarship where"+" "+s+"="+"'"+t6+"'");
%>
			<center>
				<table border=3>
					<tr>
						<th>Scholarship Amount</th>
						<th>Program</th>
						<th>Session</th>
						<th>Description</th>
						<th>Date</th>
					</tr>
<%
			while(rs.next())
			{
%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
				</tr>
		  <%} %>
				</table>
				<table><tr><th><input type=button value="Print" onclick="window.print()"></th></tr></table>
			</center>
<%
		}catch(Exception e)
		{
			out.println(e.toString());
		}
	}//End of search
	
	if(btnval.equalsIgnoreCase("allsearch"))
	{
		try{
			ResultSet rs;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hrf", "hrf");
			Statement smt=conn.createStatement();
			rs=smt.executeQuery("select * from scholarship");
%>
			<center>
				<table border=3>
					<tr>
						<th>Scholarship Amount</th>
						<th>Program</th>
						<th>Session</th>
						<th>Description</th>
						<th>Date</th>
					</tr>
<%
			while(rs.next())
			{
%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
				</tr>
	  <%} %>
			</table>
			<table><tr><th><input type=button value="Print" onclick="window.print()"></th></tr></table>
		</center>
<%
		}catch(Exception e)
		{
			out.println(e.toString());
		}
	}//End of allsearch

	if(btnval.equalsIgnoreCase("save"))
	{
		String t1=request.getParameter("t1");
		String t2=request.getParameter("t2");
		String t3=request.getParameter("t3");
		String t4=request.getParameter("t4");
		String t5=request.getParameter("t5");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hrf", "hrf");
			PreparedStatement psmt=conn.prepareStatement("insert into scholarship values(?,?,?,?,?)");
			psmt.setString(1,t1);
			psmt.setString(2,t2);
			psmt.setString(3,t3);
			psmt.setString(4,t4);
			psmt.setString(5,t5);
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
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hrf", "hrf");
			PreparedStatement psmt=conn.prepareStatement("delete from scholarship");
			psmt.executeQuery();
			out.println("<script>alert('Record Delete')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}// End of delete
	
	if(btnval.equalsIgnoreCase("update"))
	{
		String t1=request.getParameter("t1");
		String t2=request.getParameter("t2");
		String t3=request.getParameter("t3");
		String t4=request.getParameter("t4");
		String t5=request.getParameter("t5");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hrf", "hrf");
			PreparedStatement psmt=conn.prepareStatement("update scholarship set program=?,session1=?,descr=?,date1=? where sch_amt=?");
			psmt.setString(1,t2);
			psmt.setString(2,t3);
			psmt.setString(3,t4);
			psmt.setString(4,t5);
			psmt.setString(5,t1);
			psmt.executeQuery();
			out.println("<script>alert('Record Update')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}		
	}
%>

</body>
</html>