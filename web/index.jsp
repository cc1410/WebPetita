<%-- 
    Document   : index
    Created on : 04-may-2018, 18:33:36
    Author     : Juan Elberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
         <script src="https://use.typekit.net/ayg4pcz.js"></script>
    <script>try{Typekit.load({ async: true });}catch(e){}</script>

    <div class="container">
        <h1 class="welcome text-center"><img src="img/graduate-student-avat 512.png"></h1>
        <div class="card card-container">
        <h2 class='login_title text-center'>Login</h2>
        <hr>
 
        <form class="form-signin" action="Login">
                <span id="reauth-email" class="reauth-email"></span>
                <p class="input_title">Email</p>
                <input type="text" name="mail" id="inputEmail" class="login_box" placeholder="user01@IceCode.com" required autofocus>
                <p class="input_title">Password</p>
                <input type="password" name="password" id="inputPassword" class="login_box" placeholder="******" required>
                <div id="remember" class="checkbox">
                    <label>
                        
                    </label>
                </div>
                <input class="btn btn-lg btn-primary" type="submit" name="login" value="Login">
            </form>
        <!-- /form -->
        </div><!-- /card-container -->
    </div><!-- /container -->
    <%
            String status = (String) request.getAttribute("status");
            if (status != null) {
        %>
    <div class="alert alert-danger">
        
        <strong><%=  status %></strong> 
    </div>
        <%
            }
%>
    </body>
</html>
