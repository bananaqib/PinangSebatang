<%-- 
    Document   : createAppointment
    Created on : Nov 21, 2017, 1:51:46 AM
    Author     : kerol
--%>

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

        <title>UHC-APS - Appointment Scheduling System</title>
        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-datetimepicker.css" rel="stylesheet">
        <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <!--<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />-->        
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/bootstrap.min.js"></script>          
        <script src="js/moment.js"></script>          
        <script src="js/bootstrap-datetimepicker.js"></script>          




        <!-- Custom CSS -->
        <style>
            body {
                padding-top: 70px;
                /* Required padding for .navbar-fixed-top. Remove if using .navbar-static-top. Change if height of navigation changes. */
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

            .form-group-sm{
                padding-bottom: 10px;
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
                    <a class="navbar-brand" href="index.html">UHC APS</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="about.jsp">About</a>
                        </li>
                        <li>
                            <a href="#">Services</a>
                        </li>
                        <li>
                            <a href="contact.jsp">Contact</a>
                        </li>
                        <li>
                            <a href="logout.jsp">Logout</a>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>

        <!-- Page Content -->
        <div class="container">
            <h3>Make Appointment</h3>
            <hr>
            <form method="post" class="form-horizontal" action="createAppointmentServlet">
                <div class="form-group-sm">
                    <label for="appType">Appointment Type</label>
                    <select class="form-control" id="appType" name="appType">
                        <option value="MOC">Medical Outpatient Clinic</option>
                        <option value="ML">Medical Laboratory</option>
                        <option value="XR">Radiology / X-Ray</option>
                        <option value="DSO">Dental Surgery Outpatient</option>
                    </select>
                </div>
                <div class="form-group-sm">
                    <label for="appDate">Appointment Date</label>                    
                    <div class='input-group date' id='datetimepicker1'>
                        <input type='text' name="appDate" class="form-control" placeholder="YYYY-MM-DD H:m" />
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
                <div class="form-group-sm">
                    <label for="appType">Doctor</label>
                    <select class="form-control" id="appType" name="appDoc">
                        <option value="Khairul Imran">Dr. Khairul Imran</option>
                        <option value="Hazwan Azizan">Dr. Hazwan Azizan</option>

                    </select>
                </div>
                <div class="form-group-sm">
                    <label for="appDescr">Appointment Description</label>
                    <textarea class="form-control" id="appDescr" name="appDescr"></textarea>
                </div>
                <br>
                <div class="form-group-sm" align="center">
                    <button class="btn btn-primary " name="save" type="submit">Submit</button>
                </div>
                <!-- /.row -->
            </form>
        </div>
        <!-- /.container -->
        <script type="text/javascript">
            $(function () {
                $('#datetimepicker1').datetimepicker();
            });
        </script>            
    </body>
</html>



