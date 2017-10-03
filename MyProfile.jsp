<%@page language="java" info="profile of the account number"%>
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
background-repeat: no-repeat;
background-attachment: fixed;
}
h1{
 color:white;
}
h4{
 color:deb887;
}
.login {
  width: 250px;
  position: absolute;
  top: 45%;
  left: 50%;
  margin: -184px 0px 0px -155px;
  background: rgba(0,0,0,0.5);
  padding: 20px 30px;
  border-radius: 5px;
  box-shadow: 0px 1px 0px rgba(0,0,0,0.3),inset 0px 1px 0px rgba(255,255,255,0.07)
}
a{
width:200px;
display:block;
font-size:15px;
text-align:center;
padding:1px;
}
a:hover{
background;669900;
transition:1.3s;
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
<%
	try{
	
	HttpSession sn=request.getSession(false);
	String name=sn.getAttribute("name").toString();
%>
<center>
<div class="login">
<h1><font color ="87ceeb"><u>Profile Details</u></font></h1>
<table cellspacing=10>
<font face="Comic sans MS" size="6" color="white">
<tr>
<p>
<tr>
<td><h4>Account No:</td></h4>
<td><h4><%=sn.getAttribute("accno")%></td></h4>
</tr>
<td><h4>Name:</td></h4>
<td><h4><%=sn.getAttribute("name")%></td>
</tr>
<tr>
<td><h4>Email Id:</td></h4>
<td><h4><%=sn.getAttribute("mailid")%></td></h4>
</tr>

<tr>
<td><h4>Proof of Id:</td></h4>
<td><h4><%=sn.getAttribute("poid")%></td></h4>
</tr>
<tr>
<td><h4>Address:</td></h4>
<td><h4><%=sn.getAttribute("add")%></td></h4>
<tr>
<td><h4>Phone No::</td></h4>
<td><h4><%=sn.getAttribute("phno")%></td></h4>
</tr>
<tr>
<td><h4>Ballance:</td></h4>
<td><h4><%=sn.getAttribute("bal")%></td></h4>
</tr>
</font>
</table>
<a href="main.jsp"><h3>Go to Account<h3></a>
</h1>
</div>

<%
}
catch(NullPointerException e)
{

	response.sendRedirect("login.html");
}

%>
