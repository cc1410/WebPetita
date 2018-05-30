<%-- 
    Document   : asignaciones
    Created on : 12-may-2018, 9:38:02
    Author     : Juan Elberto
--%>
<%@page import="model.Alumno"%>
<%@page import="model.Asignatura"%>
<%@page import="model.Clase"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Curso"%>
<%@page import="java.util.List"%>
<%@page import="model.Usuario"%>
<%
    Usuario logeado = (Usuario) session.getAttribute("login");

    String nom = logeado.getNombre();


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/contenidoAsignaciones.css" rel="stylesheet" type="text/css"/>
        <link href="css/buttonsCrearAsignacionesAdmin.css" rel="stylesheet" type="text/css"/>
        <link href="css/home.css" rel="stylesheet" type="text/css"/>
        <link href="css/buttonshome.css" rel="stylesheet" type="text/css"/>
        <link href="css/menuhome.css" rel="stylesheet" type="text/css"/>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">


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
                        </li>

                    </ul    >
                </div>
            </div>
        </nav>
        <div class="main">
            <div class="container-fluid">
                <div class="col-md-2">
                    <a href="crearUsuario.jsp"><button type="button" class="btn3d btn btn-default btn-lg"><span class="glyphicon glyphicon-user"></span> Crear Usuarios</button></a>

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
                    <a href="asignaciones.jsp"> <button type="button" class="btn btn-asignaciones btn-lg btn3d"><span class="glyphicon glyphicon-book"></span> Asignaciones</button></a>
                </div>
               <div class="col-md-2">
                    <form action="Lista" method="POST">
                        <button type="submit" class="btn btn-modificar btn-lg btn3d" name="listaAlumno" value="listaAlumno"><span class="glyphicon glyphicon-pencil"></span> Eliminar</button></a>
                    </form>
                </div>
            </div>

            <div class="container" style="padding-top: 5%;">

                <form method="POST" action="Lista" >
                    <select name="asignacion" class="form-control">
                        <option value="Curso-Clase">Curso-Clase</option>
                        <option value="Clase-Tutor">Clase-Tutor</option>
                        <option value="Curso-Asignatura">Curso-Asignatura</option>
                        <option value="Alumno-Clase">Alumno-Clase</option>
                        <option value="Profesor-Asignatura">Profesor-Asignatura</option>
                    </select>
                    <input type="submit" name="Asigancion" value="Asignacion">
                </form>
                <br />
                <div class="row">
                    <%
                        List<Curso> listaCurso = (List) request.getAttribute("listaCurso");
                        List<Clase> listaClase = (List) request.getAttribute("listaClase");
                        List<Usuario> listaAlumno = (List) request.getAttribute("listaAlumno");
                        List<Usuario> listaProfesor = (List) request.getAttribute("listaProfesor");
                        List<Asignatura> listaAsignatura = (List) request.getAttribute("listaAsignatura");
                        if (listaCurso != null && listaClase != null) {
                    %>
                    <form action="Update" method="POST">
                        <label class="col-md-4 control-label" for="selectbasic">Curso</label>
                        <select name="curso" class="form-control" >
                            <%
                                for (Curso c : listaCurso) {
                            %>
                            <option value="<%=c.getNombre()%>"><%=c.getNombre()%></option>
                            <%
                                }
                            %>
                        </select>
                        <label class="col-md-4 control-label" for="selectbasic">Clase</label>
                        <select name="clase" multiple class="form-control" >
                            <%
                                for (Clase c : listaClase) {
                            %>
                            <option value="<%=c.getNombre()%>"><%=c.getNombre()%></option>
                            <%
                                }%>
                        </select>
                        <input type="submit" name="asignarCursoClase" value="Asignar">
                    </form>
                    <%
                    } else if (listaClase != null && listaProfesor != null) {
                    %>
                    <form action="Update" method="POST">
                        <label class="col-md-4 control-label" for="selectbasic">Clase</label>
                        <select name="clase" class="form-control" >
                            <%
                                for (Clase c : listaClase) {
                            %>
                            <option value="<%=c.getNombre()%>"><%=c.getNombre()%></option>
                            <%
                                }
                            %>
                        </select>
                        <label class="col-md-4 control-label" for="selectbasic">Profesor</label>
                        <select name="profesor" class="form-control" >
                            <%
                                for (Usuario p : listaProfesor) {
                                    String profesor = p.getNombre() + " " + p.getApellido();
                            %>
                            <option value="<%=p.getEmail()%>"><%=profesor%></option>
                            <%
                                }%>
                        </select>
                        <input type="submit" name="asignarTutorClase" value="Asignar">
                    </form>
                    <%
                    } else if (listaAsignatura != null && listaCurso != null) {
                    %>
                    <form action="Update" method="POST">
                        <label class="col-md-4 control-label" for="selectbasic">Curso</label>
                        <select name="curso" class="form-control" >
                            <%
                                for (Curso c : listaCurso) {
                            %>
                            <option value="<%=c.getNombre()%>"><%=c.getNombre()%></option>
                            <%
                                }
                            %>
                        </select>
                        <label class="col-md-4 control-label" for="selectbasic">Asignatura</label>
                        <select name="asignatura" multiple class="form-control" >
                            <%
                                for (Asignatura a : listaAsignatura) {
                            %>
                            <option value="<%=a.getNombre()%>"><%=a.getNombre()%></option>
                            <%
                                }%>
                        </select>
                        <input type="submit" name="asignarCursoAsignatura" value="Asignar">
                    </form>
                    <%
                    } else if (listaAlumno != null && listaClase != null) {
                    %>
                    <form action="Update" method="POST">
                        <label class="col-md-4 control-label" for="selectbasic">Clase</label>
                        <select name="clase" class="form-control" >
                            <%
                                for (Clase c : listaClase) {
                            %>
                            <option value="<%=c.getNombre()%>"><%=c.getNombre()%></option>
                            <%
                                }
                            %>
                        </select>
                        <label class="col-md-4 control-label" for="selectbasic">Alumno</label>
                        <select name="alumno" multiple class="form-control" >
                            <%
                                for (Usuario a : listaAlumno) {
                            %>
                            <option value="<%=a.getEmail()%>"><%=a.getNombre()%></option>
                            <%
                                }%>
                        </select>
                        <input type="submit" name="asignarClaseAlumno" value="Asignar">
                    </form>
                    <%
                    } else if (listaProfesor != null && listaAsignatura != null) {
                    %>
                    <form action="Update" method="POST">
                        <label class="col-md-4 control-label" for="selectbasic">Profesor</label>
                        <select name="profesor" class="form-control" >
                            <%
                                for (Usuario u : listaProfesor) {
                            %>
                            <option value="<%=u.getEmail()%>"><%=u.getNombre()%></option>
                            <%
                                }
                            %>
                        </select>
                        <label class="col-md-4 control-label" for="selectbasic">Asignatura</label>
                        <select name="asignatura" multiple class="form-control" >
                            <%
                                for (Asignatura a : listaAsignatura) {
                            %>
                            <option value="<%=a.getNombre()%>"><%=a.getNombre()%></option>
                            <%
                                }%>
                        </select>
                        <input type="submit" name="asignarProfesorAsignatura" value="Asignar">
                    </form>
                    <%
                        }
                    %>

                </div>
            </div>
            <%
                String status = (String) request.getAttribute("status");
                if (status != null) {
            %>
            <div class="alert alert-danger">
                <strong><%=  status%></strong> 
            </div>
            <%
                }
            %>
        </div>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="js/menuhome.js" type="text/javascript"></script>
        <script src="js/contenidoAsignaciones.js" type="text/javascript"></script>
    </body>
</html>
