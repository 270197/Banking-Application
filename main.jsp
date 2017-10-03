<%@page language="java" info="login sucessfull" import="java.sql.*" %>

<title>Home</title>
<h1>
<center>
<font color="white">
<font face="Comic sans MS" size="12">
<u>Bank of Maharashtra<br></u></font>
Ambegaon(Bk), Pune-441046<br>
</font>
</center>
</h1>

<style>
body{
margin:0;
background:url('city.jpg');
background-size:cover;
}
.login {

  width: 250px;
  position: absolute;
  top: 50%;
  left: 50%;
  margin: -184px 0px 0px -155px;
  background: rgba(0,0,0,0.5);
  padding: 20px 30px;
  border-radius: 5px;
  box-shadow: 0px 1px 0px rgba(0,0,0,0.3),inset 0px 1px 0px rgba(255,255,255,0.07)
}
h1{
 color:white;
}
input[type="submit"]{
   background: #3399ff;
  border: 0;
  width: 250px;
  height: 40px;
  border-radius: 3px;
  color: white;
  cursor: pointer;
  transition: background 0.4s linear;
}

</style>
<%	try{
	HttpSession s=request.getSession(false);
	s.setMaxInactiveInterval(40);  
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/prathamesh","root","1234");
	String sql="Select * from account_details where accountno=?";
	PreparedStatement ps=conn.prepareStatement(sql);
	Integer accno=Integer.parseInt(s.getAttribute("accno").toString());
	ps.setInt(1,accno);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{s.setAttribute("name",rs.getString(2));
	s.setAttribute("mailid",rs.getString(3));
	
	s.setAttribute("add",rs.getString(4));
	s.setAttribute("poid",rs.getString(5));
	s.setAttribute("phno",rs.getString(6));
	s.setAttribute("bal",rs.getDouble(7));
	
%>


<center>
<div class="login">
<h1><u>My Account</u></h1>
<form action="MyProfile.jsp" method="POST">
<input type="submit" name="Profile" value="Profile">
</form>
<form action="bb.jsp" method="POST">
<input type="submit" name="Bank Balance" value="Bank Balance">
</form>
<form action="credit.html" method="POST">
<input type="submit" name="Credit" value="Deposit Monney">
</form>
<form action="transfer.html" method="POST">
<input type="submit" name="transfer" value="Transfer Money">
</form>
<form action="delete.jsp" method="POST">
<input type="submit" name="delete" value="Delete Account">
</form>
<form action="logout.jsp" method="POST">
<input type="submit" name="logout" value="Logout">
</form>
</div>
</center>

<%
	


	}
	}
	catch(Exception e)
	{
	out.println(e.getMessage());
	}


%>