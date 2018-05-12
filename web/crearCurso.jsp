<%-- 
    Document   : crearCurso
    Created on : 12-may-2018, 9:34:54
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
                        <li class="active"><a href="homeadmin.jsp">Home<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
                        <li ><a href="#">Profile<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a></li>
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
            <div class="container-fluid">
                <div class="col-md-2">
                    <a href="crearUsuario.jsp"><button type="button" class="btn3d btn btn-default btn-lg"><span class="glyphicon glyphicon-user"></span> Crear Usuarios</button></a>
                
                </div>
                <div class="col-md-2">
                    <a href="crearClase.jsp"><button type="button" class="btn btn-primary btn-lg btn3d" ><span class="glyphicon glyphicon-tags"></span> Crear Clases</button></a>
                </div>
                <div class="col-md-2">
                    <a href="crearAsignatura.jsp"><button type="button" class="btn btn-success btn-lg btn3d"><span class="glyphicon glyphicon-ok"></span> Crear Asig.</button></a>
                </div>
                <div class="col-md-2">
                    <a href="crearCurso.jsp"><button type="button" class="btn btn-info btn-lg btn3d"><span class="glyphicon glyphicon-paperclip"></span> Crear Curso</button></a>
                </div>
                <div class="col-md-2">
                    <a href="asignaciones.jsp"> <button type="button" class="btn btn-warning btn-lg btn3d"><span class="glyphicon glyphicon-book"></span> Asignaciones</button></a>
                </div>
<!--                <div class="col-md-2">
                    <button type="button" class="btn3d btn btn-default1 btn-lg"><span class="glyphicon glyphicon-eye-open"></span> Notas</button>
                </div>-->
            </div>

            <div class="col-md-12">
                <form class="form-horizontal" method="POST">
                    <fieldset>

                        <!-- Form Name -->
                        <legend>Crear un nuevo curso</legend>

                       
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Titulo</label>  
                                    <div class="col-md-4">
                                        <input id="textinput" name="textinput" type="text" placeholder="titulo de asignatura" class="form-control input-md" required="">

                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="year">Año</label>  
                                    <div class="col-md-4">
                                        <input id="year" name="year" type="text" placeholder="ej: 2018 / 2019" class="form-control input-md" required="">

                                    </div>
                                </div>

                                <!-- Button (Double) -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="button1id"></label>
                                    <div class="col-md-8">
                                        <button id="button1id" name="button1id" class="btn btn-success">Insertar</button>
                                        <button id="button2id" name="button2id" class="btn btn-danger">Cancelar</button>
                                    </div>
                                </div>

                            </fieldset>
                        </form>

                </fieldset>
                </form>


            </div>

    </body>
</html>
