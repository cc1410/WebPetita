<%-- 
    Document   : homeadmin
    Created on : 29-abr-2018, 21:20:46
    Author     : Juan Elberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/home.css" rel="stylesheet" type="text/css"/>
        <link href="css/buttonshome.css" rel="stylesheet" type="text/css"/>
        <link href="css/menuhome.css" rel="stylesheet" type="text/css"/>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
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
                    <a class="navbar-brand" href="#"><img src="img/MINILOGO.png" style="width: 30px; height: 30px;"> PepitaSchool</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Home<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
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
                        </li>
                        <li><a href=homeadmin.jsp">Home<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
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
                        </li>
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
                    <button type="button" class="btn btn-success btn-lg btn3d"><span class="glyphicon glyphicon-ok"></span> Crear Asignaturas</button>
                </div>
                <div class="col-md-2">
                    <button type="button" class="btn btn-info btn-lg btn3d"><span class="glyphicon glyphicon-paperclip"></span> Crear Curso</button>
                </div>
                <div class="col-md-2">
                    <button type="button" class="btn btn-warning btn-lg btn3d"><span class="glyphicon glyphicon-book"></span> Asignaciones</button>
                </div>
                <div class="col-md-2">
                    <button type="button" class="btn3d btn btn-default1 btn-lg"><span class="glyphicon glyphicon-eye-open"></span> Notas</button>
                </div>
            </div>
            
               <!--<div class="col-md-12">
                    <form class="form-horizontal">
                        <fieldset>

                           
                            <legend>Lista de Asistencia</legend>

                           
                            <div class="form-group">
                                <label class="col-md-6 " for="radios">Alumno1 Apellidos </label>
                                <div class="col-md-6"> 
                                    <label class="radio-inline" for="radios-0">
                                        <input type="radio" name="radios" id="radios-0" value="asistir" checked="checked">
                                        asistir
                                    </label> 
                                    <label class="radio-inline" for="radios-1">
                                        <input type="radio" name="radios" id="radios-1" value="retraso">
                                        retraso
                                    </label> 
                                    <label class="radio-inline" for="radios-2">
                                        <input type="radio" name="radios" id="radios-2" value="ausencia">
                                        ausencia
                                    </label> 
                                    <label class="radio-inline" for="radios-3">
                                        <input type="radio" name="radios" id="radios-3" value="justificada">
                                        justificada
                                    </label>
                                </div>
                            </div>

                        </fieldset>
                    </form>

                </div>
            </div>-->








        <script src="js/menuhome.js" type="text/javascript"></script>
    </body>
</html>

