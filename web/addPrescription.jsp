<%-- 
    Document   : createPrescription
    Created on : Dec 18, 2017, 5:15:54 PM
    Author     : kerol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <div class="panel panel-default">
            <div class="panel-heading"><h4>Create Prescription</h4></div>
            <div class="panel-body">
                <form method="post" action="AddPrescription" class="form-horizontal">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="form-group-sm">
                                <label for="name">Name :</label>
                                <input class="form-control" type="text" name="name"><br>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-2">
                            <div class="form-group-sm">
                                <label for="qty">Quantity : </label>
                                <input class="form-control" type="text" name="qty"><br>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-8">
                            <div class="form-group-sm">
                                <label for="descr">Description : </label>
                                <textarea class="form-control" name="descr" rows="10" cols="30"></textarea>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-lg-4">
                            <a class="btn btn-danger" href="staffIndex.jsp">Back</a>
                            <input class="btn btn-primary" type="submit">
                        </div>
                    </div>
                </form>
            </div>
        </div>


        <!--<p align="center"><a class="btn btn-danger" href="staffIndex.jsp">Back</a></p>-->
    </div>
</body>
</html>
