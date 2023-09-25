<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fees Payment</title>
</head>
<body>
<%@ page import="javax.swing.*" %>
<%@ page import="java.sql.*" %>
<%
	String btnval=request.getParameter("b1");
	if(btnval.equalsIgnoreCase("search"))
	{
		String t16=request.getParameter("t16");
		String s=request.getParameter("s");
		try
		{
			ResultSet rs;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hrf","hrf");
			Statement smt=conn.createStatement();
			rs=smt.executeQuery("select * from fees_payment where"+" "+s+"="+"'"+t16+"'");
%>
		<center>
			<table border=3>
				<tr>
					<th>Identity Number</th>
					<th>Registration No.</th>
					<th>Issue Date</th>
					<th>Confirm</th>
					<th>Paid By</th>
					<th>Paid For</th>
					<th>Amount</th>
					<th>Balance</th>
					<th>Semester</th>
					<th>Total Amount</th>
					<th>Bank Name</th>
					<th>Receipt</th>
					<th>Challan</th>
					<th>Session</th>
					<th>Status</th>
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
						<td><%=rs.getString(8) %></td>
						<td><%=rs.getString(9) %></td>
						<td><%=rs.getString(10) %></td>
						<td><%=rs.getString(11) %></td>
						<td><%=rs.getString(12) %></td>
						<td><%=rs.getString(13) %></td>
						<td><%=rs.getString(14) %></td>
						<td><%=rs.getString(15) %></td>
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
		try
		{
			ResultSet rs;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hrf","hrf");
			Statement smt=conn.createStatement();
			rs=smt.executeQuery("select * from fees_payment");
%>
			<center>
				<table border=3>
					<tr>
						<th>Identity Number</th>
						<th>Registration No.</th>
						<th>Issue Date</th>
						<th>Confirm</th>
						<th>Paid By</th>
						<th>Paid For</th>
						<th>Amount</th>
						<th>Balance</th>
						<th>Semester</th>
						<th>Total Amount</th>
						<th>Bank Name</th>
						<th>Receipt</th>
						<th>Challan</th>
						<th>Session</th>
						<th>Status</th>
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
						<td><%=rs.getString(8) %></td>
						<td><%=rs.getString(9) %></td>
						<td><%=rs.getString(10) %></td>
						<td><%=rs.getString(11) %></td>
						<td><%=rs.getString(12) %></td>
						<td><%=rs.getString(13) %></td>
						<td><%=rs.getString(14) %></td>
						<td><%=rs.getString(15) %></td>
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
	}//End of all search
	

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
		String t12=request.getParameter("t12");
		String t13=request.getParameter("t13");
		String t14=request.getParameter("t14");
		String t15=request.getParameter("t15");
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hrf","hrf");
			PreparedStatement psmt=conn.prepareStatement("insert into fees_payment values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
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
			psmt.setString(12,t12);
			psmt.setString(13,t13);
			psmt.setString(14,t14);
			psmt.setString(15,t15);
			psmt.executeQuery();
			out.println("<script>alert('Record Saved..')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}// End of Save
	
	if(btnval.equalsIgnoreCase("delete"))
	{
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hrf","hrf");
			PreparedStatement psmt=conn.prepareStatement("delete from fees_payment");
			psmt.executeQuery();
			out.println("<script>alert('Record Deleted')</script>");
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
		String t12=request.getParameter("t12");
		String t13=request.getParameter("t13");
		String t14=request.getParameter("t14");
		String t15=request.getParameter("t15");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hrf","hrf");
			PreparedStatement psmt=conn.prepareStatement("update fees_payment set regno=?,issue_dt=?,confirm=?,paid_by=?,paid_for=?,amt=?,balance=?,semester=?,total_amt=?,bank_name=?,receipt=?,challan=?,session1=?,status=? where id=?");
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
			psmt.setString(11,t12);	
			psmt.setString(12,t13);	
			psmt.setString(13,t14);	
			psmt.setString(14,t15);	
			psmt.setString(15,t1);
			psmt.executeQuery();
			out.println("<script>alert('Record Update')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}	
	}// End of update
%>
</body>
</html>