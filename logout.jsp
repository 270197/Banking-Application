<%@page language="java" info="login sucessfull"  %>
<%
		try{
		HttpSession s=request.getSession(false);
		s.invalidate();
		response.sendRedirect("login.html");
		response.setHeader("pragma","no-cache");
		response.setHeader("cache-control","no-store");
		}
		catch(NullPointerException e)
		{
			response.sendRedirect("login.html");
		}
%>