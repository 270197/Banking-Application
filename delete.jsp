<%@page language="java" info="credit amount" import="java.sql.*" %>

<h1>
<center>
<font color="white">
<font face="Comic sans MS" size="12">
<u>Bank of Maharashtra<br></u></font>
Ambegaon(Bk), Pune-441046<br>
</font>
</center>
</h1>
<body>
<style>
h1{
 color:white;
}
body{
margin:0;
background:url('city.jpg');
background-size:cover;
}.login {

  width: 250px;
  position: absolute;
  top: 60%;
  left: 50%;
  margin: -184px 0px 0px -155px;
  background: rgba(0,0,0,0.5);
  padding: 20px 30px;
  border-radius: 5px;
  box-shadow: 0px 1px 0px rgba(0,0,0,0.3),inset 0px 1px 0px rgba(255,255,255,0.07)
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

<%
try{
    try{
	HttpSession s=request.getSession(false);
			
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/prathamesh","root","1234");
	String sql="delete from users where accountno=?";
	PreparedStatement ps=conn.prepareStatement(sql);
	Integer accno=Integer.parseInt(s.getAttribute("accno").toString());
	ps.setInt(1,accno);	 		
	ps.executeUpdate();

	sql="delete from account_details where accountno=?";
	ps=conn.prepareStatement(sql);	
	ps.setInt(1,accno);
	ps.executeUpdate();

	
	
%>
<div class="login">
<form action="index.html" method="POST">	
<h2><font color="white">Account Successfully Deleted!<p></font></h2>
<input type="submit" value="Click to cotinue"><p>
</form>
</div>

<%
	s.invalidate();}
    catch(NullPointerException e)
	{
		response.sendRedirect("login.html");
	}
	}
catch(Exception e)
	{
		out.println(e.getMessage());
	}
finally{
	
	}
%>
</body>