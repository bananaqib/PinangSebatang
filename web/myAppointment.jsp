
<%@page import="java.util.*"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="connection.ConnectionManager"%>
<%@page import="java.sql.Connection"%>


<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>UHC-MS - University Health Centre Management System</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

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
            <h2>My Appointments</h2>
            <hr>
            <div class="row">
                <table class="table table-condensed table-striped" align="center">
                    <th>No.</th>
                    <th>Type</th>
                    <th>Description</th>
                    <th>Date</th>
                    <th>Doctor in Charge</th>
                    <th>Status</th>
                        <%
                            Iterator itr;
                            List data = (List) request.getAttribute("data");
                            //                    out.println(data.toString());
                            int i = 0;
                            for (itr = data.iterator(); itr.hasNext();) {
                        %>
                    <tr>
                        <td><% i++;
                            out.println(i);%></td>
                        <td><%=itr.next()%></td>
                        <td><%=itr.next()%></td>                
                        <td><%=itr.next()%></td>
                        <td><%=itr.next()%></td>                    
                        <td><%=itr.next()%></td>                    
                    </tr>
                    <%}%>
                </table>
            </div>
            <div class="row">
                <a class="btn btn-danger" href="patientIndex.jsp">Back</a>
            </div>
        </div>

        <script src="js/jquery.js"></script>

        <script src="js/bootstrap.min.js"></script>

    </body>

</html>