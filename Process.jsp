<%@page language="java" import="java.sql.*" %>
<h1>
<center>
<font color="white">
<font face="Comic sans MS" size="8">
<u>Bank of Maharashtra<br></u></font>
Ambegaon(Bk), Pune-441046<br>
</font>
</center>
</h1>
<style>
h1{
 color:white;
}
body{
margin:0;
background:url('city.jpg');
background-size:cover;
}
.login {

  width: 290px;
  position: absolute;
  top: 60%;
  left: 49%;
  margin: -184px 0px 0px -155px;
  background: rgba(0,0,0,0.5);
  padding: 20px 30px;
  border-radius: 5px;
  box-shadow: 0px 1px 0px rgba(0,0,0,0.3),inset 0px 1px 0px rgba(255,255,255,0.07)
}
input[type="submit"]{
   background:#3399ff;
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
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/prathamesh","root","1234");
		String sql="select * from users where username=? and password=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		String unl=request.getParameter("un");
		String pwl=request.getParameter("pwd");
		ps.setString(1,unl);
		ps.setString(2,pwl);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{	
		
		HttpSession s=request.getSession(true);
		s.setAttribute("accno",rs.getInt(1));
		//out.println(s.getAttribute("accno"));
		response.sendRedirect("main.jsp");	
		}
		else{
%>
<font face = "Comic sans MS">
<div class="login">
<center>
<form action="login.html" method="POST">
<h1>Invalid Username/Password</h1>
<input type="submit" value="Login Again?">
</form>
<form action="signup.html" method="POST">
<input type="submit" value="Create Account?">
</form>
</center>
</div>
</font>
<%
			}
		rs.close();
		ps.close();
		conn.close();
		}
		catch(Exception e)
		{
		out.println(e.getMessage());
		}
%>

