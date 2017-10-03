<%@page language="java" info="bank balance"%>
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
a{
width:200px;
color:white;
display:block;
text-decoration:none;
font-size:20px;
text-align:center;
font-weight:bold;
}
a:hover{
background;669900;
transition:1.5s;
}
</style>
<style>
a:link {
    color: green;
    background-color: transparent;
    text-decoration: none;
}
a:visited {
    color: pink;
    background-color: transparent;
    text-decoration: none;
}
a:hover {
    color: white;
    background-color: transparent;
    text-decoration: underline;
}
a:active {
    color: yellow;
    background-color: transparent;
    text-decoration: underline;
}
</style>

<div class="login">

<%	try{
	HttpSession sn=request.getSession(false);
	String bala=(sn.getAttribute("bal").toString());
%>

<h1>Current Balance is <p style="text-indent: 1.2em;"><u><%=bala %></u></p></h1>
<%
	}
	catch(NullPointerException e )
	{
		response.sendRedirect("login.html");	
	}
%>
<a href="main.jsp">Go to Account?</a> 
</div>