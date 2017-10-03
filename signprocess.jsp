<%@page language="java" info="to process the signup data from sigup.html" import="java.sql.*"%>

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
  top: 60%;
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
   background:#3399ff;
  border: 0;
  width: 250px;
  height: 40px;
  border-radius: 3px;
  color: white;
  cursor: pointer;
  transition: back[ground 0.4s linear;
}
</style>
<%	
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/prathamesh","root","1234");
		String sql="select * from users where username=? ";
		PreparedStatement ps=conn.prepareStatement(sql);
		String unl=request.getParameter("un");
		ps.setString(1,unl);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
	%>
		<script type="text/javascript">
			alert("Username Already Exists! Try another Username");
		</script>
	<%
		response.sendRedirect("signup.html");
		}
		else{
		sql="select accountno from users";
		Statement stmt=conn.createStatement();	
		ResultSet prs=stmt.executeQuery(sql);
		int accno=0;
		if(prs.last())
			accno=prs.getInt(1);
		accno=accno+1;
		sql="insert into users values("+accno+",?,?)";
		ps=conn.prepareStatement(sql);		
		ps.setString(1,request.getParameter("un"));
		ps.setString(2,request.getParameter("pwd"));
		ps.executeUpdate();
		sql="insert into account_details values("+ accno+",?,?,?,?,?,0.00)";
		ps=conn.prepareStatement(sql);		
		
		ps.setString(1,request.getParameter("name"));
		ps.setString(2,request.getParameter("mailid"));
		ps.setString(3,request.getParameter("add"));
		ps.setString(4,request.getParameter("poid"));
		ps.setString(5,request.getParameter("phno"));
		ps.executeUpdate();
%>
<div class="login">
<center>
<form action="login.html" method="POST">
<h1>You are sucessfully registered</h1>
<input type="submit" value="Login">
</form
<center>>
</div>
<%		

		
		
		rs.close();
		prs.close();	
		ps.close();
		conn.close();
		}
		}
		catch(Exception e)
		{
		out.println(e.getMessage());
		}
		finally{
			out.println();
		}
	
%>
	