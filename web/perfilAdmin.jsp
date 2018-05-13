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
        <link href="css/buttonshome.css" rel="stylesheet" type="text/css"/>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link href="css/home.css" rel="stylesheet" type="text/css"/>
        
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
            <div class="container-fluid">
                <div class="col-md-2">
                    <a href="crearUsuario.jsp"><button type="button" class="btn3d btn btn-default btn-lg"><span class="glyphicon glyphicon-user" ></span> Crear Usuarios</button></a>
                
                </div>
                <div class="col-md-2">
                    <a href="crearCurso.jsp"><button type="button" class="btn btn-info btn-lg btn3d"><span class="glyphicon glyphicon-paperclip"></span> Crear Curso</button></a>
                </div>
                <div class="col-md-2">
                    <a href="crearClase.jsp"><button type="button" class="btn btn-primary btn-lg btn3d" ><span class="glyphicon glyphicon-tags"></span> Crear Clases</button></a>
                </div>
                <div class="col-md-2">
                    <a href="crearAsignatura.jsp"><button type="button" class="btn btn-success btn-lg btn3d"><span class="glyphicon glyphicon-ok"></span> Crear Asig.</button></a>
                </div>
                
                <div class="col-md-2">
                    <a href="asignaciones.jsp"> <button type="button" class="btn btn-asign btn-lg btn3d"><span class="glyphicon glyphicon-book"></span> Asignaciones</button></a>
                </div>
                
                <div class="col-md-2">
                    <a href="modoficar.jsp"> <button type="button" class="btn btn-modificar btn-lg btn3d"><span class="glyphicon glyphicon-pencil"></span> Modificar</button></a>
                </div>
<!--                <div class="col-md-2">
                    <button type="button" class="btn3d btn btn-default1 btn-lg"><span class="glyphicon glyphicon-eye-open"></span> Notas</button>
                </div>-->
            </div>

            <div class="col-md-6" style="padding-top: 5%;">
                <div class="well" >
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#home" data-toggle="tab">Profile</a></li>
                        <li><a href="#profile" data-toggle="tab">Password</a></li>
                    </ul>
                    <div id="myTabContent" class="tab-content" style="padding-top: 2%">
                        <div class="tab-pane active in" id="home">
                            <form id="tab" method="POST" action="Update">
                                <label style="padding-bottom: 2%;">Nombre</label>
                                <input type="text"  value="<%= logeado.getNombre()%>" class="input-xlarge" name="nombre"><br>
                                <label style="padding-bottom: 2%;">Apellido</label>
                                <input type="text" value="<%= logeado.getApellido()%>" class="input-xlarge" name="apellido"><br>
                                <label style="padding-bottom: 2%;">DNI</label>
                                <input type="text" value="<%= logeado.getDni()%>" class="input-xlarge" name="dni"><br>
                                <label style="padding-bottom: 2%;">Email: </label>
                                <label><%= logeado.getEmail()%></label>
                                <!--<input type="text" value="<%= logeado.getEmail()%>"readonly class="input-xlarge"><br>-->
                                <input type="hidden"  value="<%= logeado.getEmail()%>" class="input-xlarge" name="email"><br>
                                <input type="hidden" value="<%= logeado.getTipo()%>" name="tipo" >
                                <div>
                                    <input type="submit" name="cambiarPerfil" value="Cambiar"   class="btn btn-primary">
                                </div>
                            </form>
                        </div>
                        <div class="tab-pane fade" id="profile">
                            <form id="tab2" method="POST" action="Update">
                                <label>New Password</label>
                                <input type="password" class="input-xlarge" value="<%= logeado.getPassword()%>" name="pass">
                                <input type="hidden" value="<%= logeado.getEmail()%>" class="input-xlarge" name="email"><br>
                                <div>
                                    <input type="submit" name="cambiarPassword" value="Cambiar" class="btn btn-primary">
                                </div>
                            </form>
                        </div>
                    </div>
                </div> 
                <%
                    String status = (String) request.getAttribute("cambioPerfil");
                    if (status != null) {
                %>
                <div class="alert alert-danger">
                    <strong><%=  status%></strong> 
                </div>
                <%
                    }
                %>
            </div>

        </div>


    </body>
</html>
