<%@page language="java" info="transfer account and amount validation"  import="java.sql.*"  %>

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
h1{
 color:white;
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
input[type="submit"]{
   background:#AFDCEC;
  border: 0;
  width: 250px;
  height: 40px;
  border-radius: 3px;
  color: white;
  cursor: pointer;
  transition: background 0.4s linear;
}
</style>

<center>

<%
	try{
	
	try{	HttpSession s=request.getSession(false);
	
	int taccno=Integer.parseInt(request.getParameter("taccno"));		//transfer account number
	int caccno=Integer.parseInt(s.getAttribute("accno").toString());	//users account number
	double tbal=Double.parseDouble(request.getParameter("tbal"));	//amount to be transfered
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/prathamesh","root","1234");
	String sql="Select * from account_details where accountno=?  ";
	PreparedStatement ps=conn.prepareStatement(sql);
	ps.setInt(1,taccno);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
	double balance=Double.parseDouble(s.getAttribute("bal").toString());	//current users balance from the session 
	if(balance>tbal)
	{
		sql="update account_details set bal=bal-? where accountno=?";
		ps=conn.prepareStatement(sql);	
		ps.setDouble(1,tbal);
		ps.setInt(2,caccno);
		ps.executeUpdate();
		
		sql="update account_details set bal=bal+? where accountno=?";
		ps=conn.prepareStatement(sql);	
		ps.setDouble(1,tbal);
		ps.setInt(2,taccno);
		ps.executeUpdate();
		

		//entry into transaction of credited account 
		sql="insert into transaction values(?,?,?)";
		ps=conn.prepareStatement(sql);	
		ps.setInt(1,taccno);
		ps.setString(2,"credit");
		ps.setDouble(3,tbal);
		ps.executeUpdate();
		
		//entry into transaction of debited account 
		sql="insert into transaction values(?,?,?)";
		ps=conn.prepareStatement(sql);	
		ps.setInt(1,caccno);
		ps.setString(2,"debit");
		ps.setDouble(3,tbal);
		ps.executeUpdate();
%>
<div class="login">
<form action="main.jsp" method="POST">
<h1>Transaction Sucessfull</h1>
<input type="submit" value="Click to Continue">
</form>
</div>
		
<%
	}
	else{
%>
<div class="login">
<form action="transfer.html" method="POST">
<h1>Insufficient Balance</h1>
<input type="submit" value="Try Again?">
</form>
</div>

<%                
	}
	
	}else{
%>
<div class="login">
<form action="transfer.html" method="POST">
<h1>Invalid Account Number</h1>
<input type="submit" value="Try Again?">
</form>
</div>

<%
                  }//else
	}//try
	catch(NumberFormatException e)
	{
		out.println("Enter number only");
	}//catch
		
	}//try
	catch(NullPointerException ae)
	{
		response.sendRedirect("login.html");
	
	}//catch

%>

</center>