<%@page language="java" info="credit amount" import="java.sql.*" %>

<html>
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
input{
 width:250px;
 height:30px;
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
<font face = "Comic sans MS" size ="6" color="#AFDCEC"><strong>
<%
	try{
		try{
		try{
			HttpSession s=request.getSession(false);
			Double bal=Double.parseDouble(request.getParameter("camt"));		
			if(bal>0)
			{	Class.forName("com.mysql.jdbc.Driver");
				Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/prathamesh","root","1234");
				String sql="update account_details set bal=(bal+ ?) where accountno=?";
				PreparedStatement ps=conn.prepareStatement(sql);
				Integer accno=Integer.parseInt(s.getAttribute("accno").toString());
				ps.setInt(2,accno);	
		
				ps.setDouble(1,bal); 		
				ps.executeUpdate();
				/*sql="insert into transaction values(?,?,?)";
				ps=conn.prepareStatement(sql);	
				ps.setInt(1,accno);
				ps.setString(2,"debit");
				ps.setDouble(3,bal);
				ps.executeUpdate();*/
%>
<div class="login">
<form action="main.jsp" method="POST">	
Transaction Sucessfull
<input type="submit" value="Click to cotinue"><p>
</form>
<form action="logout.jsp" method="POST">	
<input type="submit" value="Logout"><p>
</form>
</div>
				
<%
			}
		else{
%>
<div class="login">
Enter Positive Balannce Amount
</div>
<%
			}
		}//try
		catch(NumberFormatException e)
	{
		out.println("Enter number only");
	}//catch
		}
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

</strong></font>
</body>
</html>