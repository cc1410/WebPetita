<%-- 
    Document   : perfilAdmin
    Created on : 12-may-2018, 18:05:23
    Author     : Juan Elberto
--%>

<%@page import="model.Usuario"%>
<%
    Usuario logeado = (Usuario) session.getAttribute("login");

    String nom = logeado.getNombre();


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link href="css/home.css" rel="stylesheet" type="text/css"/>
        <link href="css/buttonsCrearUsuarioAdmin.css" rel="stylesheet" type="text/css"/>
        <link href="css/menuhome.css" rel="stylesheet" type="text/css"/>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-inverse sidebar" role="navigation">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#"><img src="img/MINILOGO.png" style="width: 30px; height: 30px;"> <%=  nom%></a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li ><a href="homeadmin.jsp">Home<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
                        <li class="active"><a href="perfilAdmin.jsp">Profile<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a></li>
                        <li ><a href="#">Messages<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-envelope"></span></a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Settings <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-cog"></span></a>
                            <ul class="dropdown-menu forAnimate" role="menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                                <li class="divider"></li>
                                <li><a href="#">One more separated link</a></li>
                            </ul>

                    </ul>
                </div>

            </div>

        </nav>

        <div class="main">

            <div class="col-md-6">
                <div class="well">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#home" data-toggle="tab">Profile</a></li>
                        <li><a href="#profile" data-toggle="tab">Password</a></li>
                    </ul>
                    <div id="myTabContent" class="tab-content" style="padding-top: 2%">
                        <div class="tab-pane active in" id="home">
                            <form id="tab">
                                <label style="padding-bottom: 2%;">Nombre</label>
                                <input type="text" value="<%= logeado.getNombre() %>" class="input-xlarge"><br>
                                <label style="padding-bottom: 2%;">Apellido</label>
                                <input type="text" value="<%= logeado.getApellido() %>" class="input-xlarge"><br>
                                <label style="padding-bottom: 2%;">DNI</label>
                                <input type="text" value="<%= logeado.getDni()%>" class="input-xlarge"><br>
                                <label style="padding-bottom: 2%;">Email</label>
                                <input type="text" placeholder="<%= logeado.getEmail() %>" class="input-xlarge"><br>
                                
                                <div>
                                    <button class="btn btn-primary">Update</button>
                                </div>
                            </form>
                        </div>
                        <div class="tab-pane fade" id="profile">
                            <form id="tab2">
                                <label>New Password</label>
                                <input type="password" class="input-xlarge" value="<%= logeado.getPassword() %>">
                                <div>
                                    <button class="btn btn-primary">Update</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div> 
            </div>


    </body>
</html>
