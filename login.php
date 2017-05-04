<?php
session_start();
if ( isset($_SESSION['kepribadian_naive_bayes_id']) ) {
    header("location:index.php");
}

$login = 0;
if (isset($_GET['login'])) {
    $login = $_GET['login'];
}

if ($login == 1) {
    $komen = "Silahkan Login Ulang, Cek username dan Password Anda!!";
}

include_once "fungsi.php";
?>
﻿<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <!--[if IE]>
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
            <![endif]-->
        <title>Login Page</title>
        <link href="images/icon/login.gif" rel="shortcut icon" />
        <!-- BOOTSTRAP CORE STYLE  -->
        <link href="assets/css/bootstrap.css" rel="stylesheet" />
        <!-- FONT AWESOME ICONS  -->
        <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLE  -->
        <link href="assets/css/style.css" rel="stylesheet" />
        <!-- HTML5 Shiv and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!--OVERWRITE STYLE-->
        <style>
            .navbar-inverse .navbar-brand{
                color: #fff;
            }
        </style>
    </head>
    <body>
        <!-- HEADER END-->
        <div class="navbar navbar-inverse set-radius-zero" style="height: 90px;">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="" style="width: 950px;">
                        Klasifikasi Karakteristik Kepribadian Manusia 
                        (Metode Naïve Bayes)
                    </a>
                </div>

            </div>
        </div>

        <!-- LOGO HEADER END-->
        <section class="menu-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="navbar-collapse collapse ">
                            <ul id="menu-top" class="nav navbar-nav navbar-right">
                                <li><a  href="index.php">Home</a></li>
                                <?php
                                if (empty($_SESSION['kepribadian_naive_bayes_id'])) {
                                    ?>
                                    <li><a class='menu-top-active'" href="login.php">Login</a></li>
                                    <?php
                                }
                                ?>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </section>
        <!-- MENU SECTION END-->

        <!-- MENU SECTION END-->
        <div class="content-wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h4 class="page-head-line">Please Login To Enter </h4>

                    </div>

                </div>
                <div class="row">
                    <div class="col-md-6">
                        <br />
                        <?php
                        if (isset($komen)) {
                            display_error("Login failed");
                        }
                        ?>
                        <form method="post" action="cek-login.php" >
                            <label>Enter User ID : </label>
                            <input type="text" class="form-control" name="username" />
                            <label>Enter Password :  </label>
                            <input type="password" class="form-control" name="password" />
                            <hr />
                            <button type="submit" class="btn btn-info">
                                <span class="glyphicon glyphicon-user"></span> &nbsp;Log Me In 
                            </button>&nbsp;
                        </form>
                    </div>


                </div>
            </div>
        </div>
        <!-- CONTENT-WRAPPER SECTION END-->

        <?php
        include "footer.php";
        ?>
        <!-- JAVASCRIPT AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
        <!-- CORE JQUERY SCRIPTS -->
        <script src="assets/js/jquery-1.11.1.js"></script>
        <!-- BOOTSTRAP SCRIPTS  -->
        <script src="assets/js/bootstrap.js"></script>
    </body>
</html>
