<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="connection.ConnectionManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>UHC-MS - Unversity Health Centre Management System</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <style>
            body {
                padding-top: 70px;
                /* Required padding for .navbar-fixed-top. Remove if using .navbar-static-top. Change if height of navigation changes. */
            }
        </style>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.php">UHC-MS</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="about.jsp">About</a>
                        </li>
                        <li>
                            <a href="contact.jsp">Contact</a>
                        </li>
                        <li>
                            <a href="./Logout">Logout</a>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>
        <div class="container-fluid">
            <div class="row">
                <table border="1" >
                    <tr><td ><b>Username</b></td><td ><%=request.getAttribute("username1")%></td></tr>
                    <tr><td ><b>Name</b></td><td ><%=request.getAttribute("patient_name1")%></td></tr>
                    <tr><td ><b>Address</b></td><td ><%=request.getAttribute("address1")%></td></tr>
                    <tr><td ><b>Matric</b></td><td ><%=request.getAttribute("matric1")%></td></tr>
                    <tr><td ><b>Phone No</b></td><td ><%=request.getAttribute("phone1")%></td></tr>
                    <tr><td ><b>Appointment Type</b></td><td ><%=request.getAttribute("app_type1")%></td></tr>
                    <tr><td ><b>Appointment Description</b></td><td ><%=request.getAttribute("app_desc1")%></td></tr>
                </table>
            </div>
            <%
                String mat = (String) request.getAttribute("matric1");

                Connection con = ConnectionManager.createConnection();
                Statement st = con.createStatement();
                ResultSet rs;
                rs = st.executeQuery("select * from medical WHERE matric = '" + mat + "'");
            %>
            <div class="row">
                
                        <tr><td><b>Prescription History</b></td></tr>

                        <%  while (rs.next()) {
                                String matricdb = rs.getString("matric");
                                String prescdb = rs.getString("prescription");
                                String date = rs.getString("date");
                        %>  

                        <tr>
                            <td></td><td><%= prescdb%> &nbsp; <%= date%> </td>
                        </tr>
                        <%};%>




                    </table>
                
            </div>
            <input type="submit" value="Add" 
                   onclick="window.location = 'addHistory.jsp?matric=<%=(String) request.getAttribute("matric1")%>'"/>
        </div>
    </body>
</html>
