<%-- 
    Document   : viewPrescription
    Created on : Dec 18, 2017, 5:33:49 PM
    Author     : kerol
--%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="connection.ConnectionManager"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>About - UHC-APS</title>

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
                    <a class="navbar-brand" href="staffIndex.jsp">UHC APS</a>
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
        <div class="container">
            <h2 align="center">Prescription List</h2>
            <hr>
            <br>
            <table class="table-responsive table-condensed table-striped" align="center">
                <tr>
                    <th>No.</th>
                    <th>Name</th>
                    <th>Quantity</th>
                    <th></th>
                    <th></th>
                </tr>
                <%
                    Connection con = ConnectionManager.createConnection();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select * from prescription");;
                    while (rs.next()) {

                        int count = 0;
                        String id = rs.getString("id");
                %>
                <tr>
                    <td><%= count%></td>
                    <td><%=rs.getString("name")%></td>
                    <td><%=rs.getString("quantity")%></td>
                    <td><%=rs.getString("descr")%></td>                
                    <td><a class="btn btn-primary btn-xs" href=<%= "\"updatePrescription?id=" + id + "\""%>>Update</a></td>
                    <% count++;
                        }%>
                </tr>
            </table>
                <br>
            <p align="center"><a class="btn btn-danger" href="staffIndex.jsp">Back</a></p>
        </div>
    </body>
</html>
