<%-- 
    Document   : test_error
    Created on : Dec 19, 2017, 12:51:45 PM
    Author     : kerol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!
        
        
        <%
        
        String error_meesage = request.getParameter("error_meesage");
        
        out.println("<br>"+error_meesage);
        
        %>
        
        
        </h1>
    </body>
</html>

<!--
String meesage = "masalah while";
                        String redirectURL1 = "test_error.jsp?error_message=" + meesage;
                        response.sendRedirect(redirectURL1);-->