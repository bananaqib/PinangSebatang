<?php

include ('db.php');
session_start();
$id = $_GET['id'];


$sql = "UPDATE appointment SET status='accepted' WHERE id=$id";

if (mysql_query($sql, $db)) {
    header("location:doctorIndex.php");    
} else {
    echo "Error: " . $sql . "<br>" . mysql_error($db);
}


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

