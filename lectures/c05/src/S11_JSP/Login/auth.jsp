<HTML>
<HEAD><TITLE>Autentificare</TITLE></HEAD>

<BODY>
<jsp:useBean id="fb1" class="eu.ase.beans.SelectUSR" />
<%
 
	String user = request.getParameter("user");
	String pass = request.getParameter("pass");
	Integer auth=1;
	int res = fb1.selectFROMDB(user,pass);
	if (res == 0) {
		auth=0;
		session.setAttribute("auth",auth);
%>
<H2 ALIGN=CENTER>User si/sau parola incorecte </H2>
<A HREF="http://127.0.0.1:8080/Login/ServletAuth">BACK</A>
<%	
		
		} else  if (res==1){
	session.setAttribute("auth",auth);
	response.sendRedirect("p1.jsp");//not wrong but http 302 redirect
	///pageContext.forward("p1.jsp");//Wrong - without http 302
	////RequestDispatcher disp=request.getRequestDispatcher("/p1.jsp");
	////if(disp!=null){
	////	disp.forward(request,response); //very good
	////}
	}
	else 	{
		auth=2;
		session.setAttribute("auth",auth);
%>
<H3 ALIGN=CENTER>erroare </H3>
<A HREF="http://127.0.0.1:8080/Login/ServletAuth">BACK</A>
<%
 	}
%>
</BODY></HTML>
