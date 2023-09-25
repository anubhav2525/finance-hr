<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee</title>
</head>
<body>
<%@ page import="javax.swing.*" %>
<%@ page import="java.sql.*" %>
<%
	String btnval=request.getParameter("b1");
		// All Search Starts Here
	if(btnval.equalsIgnoreCase("allsearch"))
	{
		try{
			ResultSet rs;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hrf","hrf");
			Statement smt=conn.createStatement();
			rs=smt.executeQuery("select * from employee");
%>
			<center>
			<table border=2>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Father's Name</th>
				<th>Aadhar</th>
				<Th>Dob</Th>
				<th>Address</th>
				<th>Contact</th>
				<th>Email</th>
				<th>Gender</th>
				<th>Marital Status</th>
				<th>Basic sal</th>
				<th>Doj</th>
				<th>Design.</th>
				<th>Department</th>
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
					<th><%=rs.getString(7) %></th>
					<th><%=rs.getString(8) %></th>
					<th><%=rs.getString(9) %></th>
					<Th><%=rs.getString(10) %></Th>
					<Th><%=rs.getString(11) %></Th>
					<th><%=rs.getString(12) %></th>
					<th><%=rs.getString(13) %></th>
					<th><%=rs.getString(14) %></th>
				</tr>
<%
				}
%>
				</table>
				<table>
					<TR><th><input type=button value="print" onclick="window.print()"></th></TR>
				</table>
<%
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}// End of all search
%>
			

<%
			//Search starts here
	
	if(btnval.equalsIgnoreCase("search"))
	{
		String t15=request.getParameter("t15");
		String s=request.getParameter("s");
		try{
			ResultSet rs;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hrf","hrf");
			Statement smt=conn.createStatement();
			rs=smt.executeQuery("select * from employee where" +" "+s+"=" +"'"+t15+"'");
%>
		<center>
		<table border=1>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Father Name</th>
				<th>Aadhar</th>
				<th>DOB</th>
				<th>Address</th>
				<th>Phone</th>
				<th>Email</th>
				<th>Gender</th>
				<th>Marital</th>
				<th>B Salary</th>
				<th>DOJ</th>
				<th>Design</th>
				<th>Depart.</th>
			</tr>
<%
			while(rs.next())
			{
%>
			<tr>
				<th><%=rs.getString(1) %></th>
				<Th><%=rs.getString(2) %></Th>
				<Th><%=rs.getString(3) %></Th>
				<th><%=rs.getString(4) %></th>
				<th><%=rs.getString(5) %></th>
				<th><%=rs.getString(6) %></th>
				<th><%=rs.getString(7) %></th>
				<th><%=rs.getString(8) %></th>
				<th><%=rs.getString(9) %></th>
				<th><%=rs.getString(10) %></th>
				<th><%=rs.getString(11) %></th>
				<th><%=rs.getString(12)%></th>
				<th><%=rs.getString(13) %></th>
				<th><%=rs.getString(14) %></th>
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
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}// End of search
%>
<%
		// save
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
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hrf","hrf");
			PreparedStatement psmt=conn.prepareStatement("insert into employee values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
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
			psmt.executeQuery();
			out.println("<script>alert('Record save')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}//End of Save
	
		// delete
	if(btnval.equalsIgnoreCase("delete"))
	{
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hrf","hrf");
			PreparedStatement psmt=conn.prepareStatement("delete from employee");
			psmt.executeQuery();
			out.println("<script>alert('Record Deleted')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}//End of delete 

		//update
	
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
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hrf","hrf");
			PreparedStatement psmt=conn.prepareStatement("update employee set ename=?,fname=?,aadhar=?,dob=?,address=?,contact=?,email=?,gender=?,marital_status=?,bsalary=?,doj=?,design=?,deptt=? where empid=?");
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
			psmt.setString(14,t1);
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