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
        <script src="js/jquery.js"></script> 
        <script src="js/bootstrap.js"></script>
        <!--<script src="js/bootstrap.min.js"></script>-->     


        <!-- Custom CSS -->
        <style>
            body {
                padding-top: 70px;
                /* Required padding for .navbar-fixed-top. Remove if using .navbar-static-top. Change if height of navigation changes. */
            }

            th{
                background-color: #990000;
                color: white;
            }

            .btn-primary{
                color: #fff;
                background-color: #000000;
                border-color: #000000;
            }

            .btn-primary:hover{
                background: #000000;
                color: #ff0000
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
        <div class="container">
            <div class="row">
                <h2>Patient Medical History</h2>
            </div>
            <hr>
            <div class="row">
                <table class="table table-bordered" align="center">                    
                    <tr><td ><b>Patient Name</b></td><td ><%=request.getAttribute("patient_name1")%></td></tr>
                    <tr><td ><b>Address</b></td><td ><%=request.getAttribute("address1")%></td></tr>
                    <tr><td ><b>Matric</b></td><td ><%=request.getAttribute("matric1")%></td></tr>
                    <tr><td ><b>Phone No</b></td><td ><%=request.getAttribute("phone1")%></td></tr>
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
                <h3>Prescription History</h3>
                <table class="table table-striped" align="center">
                    <tr>
                        <th>Prescription</th>
                        <th>Date Given</th>
                    </tr>                    
                    <%  while (rs.next()) {
                            String matricdb = rs.getString("matric");
                            String prescdb = rs.getString("prescription");
                            String date = rs.getString("date");
                    %>  

                    <tr>
                        <td><%= prescdb%></td>
                        <td><%= date%> </td>
                    </tr>
                    <%};%>
                </table>

            </div>
                <div class="row">
                <a class="btn btn-danger" href="./UpdateMedicalRecords">Back</a>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addhistory">Add</button>
            </div>
            
        
        </div>

        <div class="modal fade" id="addhistory" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <H4 class="modal-title">Add Prescription</H4>                        
                    </div>
                    <div class="modal-body">
                        <FORM class="form" ACTION="givePrescription" method="post">
                            <input type="hidden" value="<%= mat%>" name='mat'>
                            <div class="form-group">
                            <label for="ubat">Prescription</label>
                            <select class="form-control" name="ubat">
                                <option value="1">Cough Syrup</option>
                                <option value="2">Panadol</option>
                                <option value="3">Dental Floss</option>
                                <option value="4">Lozenge</option>
                            </select>
                            </div>
                            <button type="submit" class="btn btn-primary" >Submit</button>
                        </FORM>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
