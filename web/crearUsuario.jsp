<%-- 
    Document   : crearUsuario
    Created on : 29-abr-2018, 21:41:52
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
        <link href="css/buttonshome.css" rel="stylesheet" type="text/css"/>
        <link href="css/menuhome.css" rel="stylesheet" type="text/css"/>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



        <title>JSP Page</title>
    </head>
    <% if (logeado != null && logeado.getTipo() == 0) {%>    
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
                        <li ><a href="perfilAdmin.jsp">Profile<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a></li>
                        <li ><a href="index.jsp">Salir<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-remove"></span></a></li><li class="dropdown">
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
                    <a href="crearUsuario.jsp"><button type="button" class="btn3d btn btn-crearUsuario btn-lg"><span class="glyphicon glyphicon-user"></span> Crear Usuarios</button></a>

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
                    <form action="Lista" method="POST">
                        <button type="submit" class="btn btn-modificar btn-lg btn3d" name="listaAlumno" value="listaAlumno"><span class="glyphicon glyphicon-pencil"></span> Eliminar</button></a>
                    </form>
                </div>
            </div>

            <div class="col-md-12">
                <form class="form-horizontal" method="POST" action="Registro">
                    <fieldset>

                        <!-- Form Name -->
                        <legend>Crear un nuevo Usuario</legend>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="nombre">Nombre</label>  
                            <div class="col-md-4">
                                <input id="nombre" name="nombre" type="text" placeholder="Nombre" class="form-control input-md" required="">

                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="apellidos">Apellidos</label>  
                            <div class="col-md-4">
                                <input id="apellidos" name="apellidos" type="text" placeholder="apellidos" class="form-control input-md" required="">

                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="mail">Email</label>  
                            <div class="col-md-4">
                                <input id="mail" name="mail" type="text" placeholder="correo" class="form-control input-md" required="">

                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="password" required="">Password</label>  
                            <div class="col-md-4">
                                <input id="password" name="password" type="text" placeholder="Password" class="form-control input-md">

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="dni" required="">DNI</label>  
                            <div class="col-md-4">
                                <input id="dni" maxlength="9" name="dni" type="text" placeholder="DNI" class="form-control input-md">
                            </div>
                        </div>
                        <!-- Multiple Radios -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="tipo">Tipo Usuario</label>
                            <div class="col-md-4">
                                <div class="radio">
                                    <label for="tipo-0">
                                        <input type="radio" name="tipo" id="tipo-0" value="1" checked="checked">
                                        Profesor
                                    </label>
                                </div>
                                <div class="radio">
                                    <label for="tipo-1">
                                        <input type="radio" name="tipo" id="tipo-1" value="2">
                                        Alumno
                                    </label>
                                </div>
                            </div>
                        </div>
                        <!-- Button (Double) -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="button1id"></label>
                            <div class="col-md-8">
                                <input type="submit" id="button1id" name="crear" class="btn btn-default" value="Crear">
                                <button id="Cancelar" type="reset" name="Cancelar" class="btn btn-danger">Cancelar</button>
                            </div>
                        </div>  

                    </fieldset>
                </form>

                <%
                    String status = (String) request.getAttribute("status");
                    if (status != null) {
                %>
                <div class="col-md-12">
                    <div class="alert alert-danger">

                        <strong><%=status%></strong> 
                    </div>
                    <%
                        }
                    %>
                </div>
                <div class="col-md-12" style="text-align: center; padding-top: 3%;">
                    <h1>Insertar CSV</h1>
                    <label>
                        <input type="file" name="archivo" id="csv" />
                    </label>
                    </br>
                    <label>
                        <input type="submit" name="enviar" id="enviar" value="Subir Archivo" />
                    </label>
                    <div id="drop_zone">Drop files here</div>
                    <output id="list"></output>

                    <script>
                        function handleFileSelect(evt) {
                            evt.stopPropagation();
                            evt.preventDefault();

                            var files = evt.dataTransfer.files; // FileList object.

                            // files is a FileList of File objects. List some properties.
                            var output = [];
                            for (var i = 0, f; f = files[i]; i++) {
                                output.push('<li><strong>', escape(f.name), '</strong> (', f.type || 'n/a', ') - ',
                                        f.size, ' bytes, last modified: ',
                                        f.lastModifiedDate.toLocaleDateString(), '</li>');
                            }
                            document.getElementById('list').innerHTML = '<ul>' + output.join('') + '</ul>';
                        }

                        function handleDragOver(evt) {
                            evt.stopPropagation();
                            evt.preventDefault();
                            evt.dataTransfer.dropEffect = 'copy'; // Explicitly show this is a copy.
                        }

                        // Setup the dnd listeners.
                        var dropZone = document.getElementById('drop_zone');
                        dropZone.addEventListener('dragover', handleDragOver, false);
                        dropZone.addEventListener('drop', handleFileSelect, false);
                    </script>
                </div>

            </div>

        </div>

        <script src="js/menuhome.js" type="text/javascript"></script>
    </body>
    <% }%>
</html>


