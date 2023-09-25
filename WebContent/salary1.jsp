<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Salary</title>
</head>
<body>
<%@ page import="javax.swing.*" %>
<%@ page import="java.sql.*" %>
<%
	String btnval=request.getParameter("b1");
	if(btnval.equalsIgnoreCase("search"))
	{
		String t8=request.getParameter("t8");
		String s=request.getParameter("s");
		try
		{
			ResultSet rs;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hrf", "hrf");
			Statement smt=conn.createStatement();
			rs=smt.executeQuery("select * from salary where "+" "+s+"="+"'"+t8+"'"); 
%>
			<center>
				<table border=2>
					<tr>
						<th>Employee Id</th>
						<th>Basic Salary</th>
						<th>Current Salary</th>
						<th>Deduction</th>
						<th>Allowance</th>
						<th>Net Pay</th>
						<th>Others Pay</th>
					</tr>
<%
				while(rs.next())
				{
%>		
					<tr>
						<td><%=rs.getString(1) %></td>
						<td><%=rs.getString(2) %></td>
						<td><%=rs.getString(3) %></td>
						<Td><%=rs.getString(4) %></Td>
						<td><%=rs.getString(5) %></td>
						<td><%=rs.getString(6) %></td>
						<td><%=rs.getString(7) %></td>
					</tr>
				<%} %>
				</table>
				<table border=1>
					<tr><th><input type=button value="Print" onclick="window.print()"></th></tr>
				</table>			
			</center>
<%
		}catch(Exception e)
		{
			out.println(e.toString());
		}
	}//End of search
%>

<%
	if(btnval.equalsIgnoreCase("allsearch"))
	{
		try{
			ResultSet rs;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hrf", "hrf");
			Statement smt=conn.createStatement();
			rs=smt.executeQuery("select * from salary");
%>
			<center>
				<table border=3>
					<tr>
						<th>Employee ID</th>
						<th>Basic Salary</th>
						<th>Current Salary</th>
						<th>Deduction</th>
						<th>Allowance</th>
						<th>Net Pay</th>
						<th>Other Pay</th>
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
						<td><%=rs.getString(6) %></td>
						<td><%=rs.getString(7) %></td>
					</tr>
			<%}%>
				</table>
				<table><Tr><th><input type=button value="Print" onclick="window.print()"></th></Tr></table>
			</center>
<%
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}//End of all search

	if(btnval.equalsIgnoreCase("save"))
	{
		String t1=request.getParameter("t1");
		String t2=request.getParameter("t2");
		String t3=request.getParameter("t3");
		String t4=request.getParameter("t4");
		String t5=request.getParameter("t5");
		String t6=request.getParameter("t5");
		String t7=request.getParameter("t7");
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hrf", "hrf");
			PreparedStatement psmt=conn.prepareStatement("insert into salary values(?,?,?,?,?,?,?)");
			psmt.setString(1,t1);
			psmt.setString(2,t2);
			psmt.setString(3,t3);
			psmt.setString(4,t4);
			psmt.setString(5,t5);
			psmt.setString(6,t6);
			psmt.setString(7,t7);
			psmt.executeQuery();
			out.println("<script>alert('Record save')</script>");
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
			PreparedStatement psmt=conn.prepareStatement("delete from salary");
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
		String t6=request.getParameter("t6");
		String t7=request.getParameter("t7");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hrf", "hrf");
			PreparedStatement psmt=conn.prepareStatement("update salary set bsalary=?,curr_salary=?,deduction=?,allowance=?,netpay=?,otherpay=? where empid=?");
			psmt.setString(1,t2);
			psmt.setString(2,t3);
			psmt.setString(3,t4);
			psmt.setString(4,t5);
			psmt.setString(5,t6);
			psmt.setString(6,t7);
			psmt.setString(7,t1);
			psmt.executeQuery();
			out.println("<script>alert('Record updated')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}//End of update
%>
</body>
</html>