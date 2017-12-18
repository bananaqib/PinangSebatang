<%-- 
    Document   : createPrescription
    Created on : Dec 18, 2017, 5:15:54 PM
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
        <form method="post" action="AddPrescription">
            Name :<input type="text" name="name"><br>
            Quantity : <input type="text" name="qty"><br>
            Description : <textarea name="descr" rows="10" cols="30"></textarea>
            <input type="submit">
        </form>
    </body>
</html>
