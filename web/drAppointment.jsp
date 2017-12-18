<%-- 
    Document   : drAppointment
    Created on : Nov 21, 2017, 1:48:15 AM
    Author     : kerol
--%>
<%@page language="java" import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <!--<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />-->        
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

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
            /*table { width: 80%}*/
            th {font-size: 12px}
            td { font-size: 11px; }
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
                    <a class="navbar-brand" href="#">UHC APS</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="">About</a>
                        </li>
                        <li>
                            <a href="">Services</a>
                        </li>
                        <li>
                            <a href="">Contact</a>
                        </li>
                        <li>
                            <a href="">Logout</a>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>

        <!-- Page Content -->
        <div class="container" >
            <div class="row">
                <div class="col-lg-12 text-center">
                    <img src="images/UTM.gif" alt="logo" width="100" height="100">
                </div>
            </div>            
            <div class="row">
                <h3 align="center">Unversity Health Centre Management System</h3>
            </div>
            <hr>
            <table class="table-responsive table-condensed table-striped" align="center">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Username</th>
                        <th>Patient Name</th>
                        <th>Date</th>
                        <th>Type</th>
                        <th>Matric</th>
                        <th>Description</th>                    
                        <th>Status</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%Iterator itr;%>
                    <% List data = (List) request.getAttribute("data");
                        for (itr = data.iterator(); itr.hasNext();) {
                    %>
                        <tr>
                            <td><%=itr.next()%></td>
                            <td><%=itr.next()%></td>
                            <td><%=itr.next()%></td>
                            <td><%=itr.next()%></td>
                            <td><%=itr.next()%></td>
                            <td><%=itr.next()%></td>
                            <td><%=itr.next()%></td>
                            <td><%=itr.next()%></td>
                            <%}%>
                            <td><div class="btn-group">
                                    <button type="button" class="btn btn-primary btn-xs dropdown-toggle " data-toggle="dropdown">
                                        Action <span class="caret"></span></button>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="">Approve</a></li>
                                        <!--<li><button name="save" type="submit">Submit</button></li>-->
                                        <li><a href="">Reject</a></li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                    
                </tbody>
            </table>
        </div>
        <!-- /.container -->

        <!-- jQuery Version 1.11.1 -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                var date_input = document.getElementById("appDate");
                var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
                var options = {
                    format: 'yyyy-mm-dd h:m',
                    container: container,
                    todayHighlight: true,
                    autoclose: true
                };
                date_input.datepicker(options);

            });
        </script>

    </body>

</html>


<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


