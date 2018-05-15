/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import excepciones.Excepciones;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdbcPepitaWeb.Conexion;
import model.Usuario;

/**
 *
 * @author Juan Elberto
 */
public class Update extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        Conexion conexion = new Conexion();

        //******************************************************** modificar perfil ********************************************************************************************
        if ("Cambiar".equals(request.getParameter("cambiarPerfil"))) {
            //recogemos los datos del formulario 
            String name = request.getParameter("nombre");
            String lastname = request.getParameter("apellido");
            String dni = request.getParameter("dni");
            String mail = request.getParameter("email");
            int tipo = Integer.parseInt(request.getParameter("tipo"));
            //creamos un Empleado con los datos recogido del fomulario
            Usuario a = new Usuario(name, lastname, dni, mail, tipo);
            try {

                conexion.modificarPerfil(a);

                request.setAttribute("cambioPerfil", "Perfil modificado");
            } catch (Excepciones ex) {
                request.setAttribute("cambioPerfil", ex.getMessage());
            }
            request.getRequestDispatcher("/perfilAdmin.jsp").forward(request, response);
        } //******************************************************** modificar Password *****************************************************************************
        else if ("Cambiar".equals(request.getParameter("cambiarPassword"))) {
            //recogemos los datos del formulario 
            String pass = request.getParameter("pass");
            String mail = request.getParameter("email");
            //creamos un Empleado con los datos recogido del fomulario
            Usuario a = new Usuario(pass, mail);
            try {

                conexion.modificarPassword(a);

                request.setAttribute("cambioPerfil", "Password modificado");
            } catch (Excepciones ex) {
                request.setAttribute("cambioPerfil", ex.getMessage());
            }
            request.getRequestDispatcher("/perfilAdmin.jsp").forward(request, response);
        } else if ("Asignar".equals(request.getParameter("asignarCursoClase"))) {
            String[] listClase = request.getParameterValues("clase");
            String nombreCurso = request.getParameter("curso");
            for (String clase : listClase) {
                try {
                    conexion.asignarCursoClase(nombreCurso, clase);
                    request.setAttribute("status", "Asignacion completa");
                } catch (SQLException ex) {
                    request.setAttribute("status", ex.getMessage());
                }
            }
            request.getRequestDispatcher("/asignaciones.jsp").forward(request, response);
        } else if ("Asignar".equals(request.getParameter("asignarTutorClase"))) {
            String nombreClase = request.getParameter("clase");
            String nombreProfesor = request.getParameter("profesor");
            try {
                conexion.asignarClaseTutor(nombreProfesor, nombreClase);
                request.setAttribute("status", "Asignacion completa");
            } catch (SQLException ex) {
                request.setAttribute("status", ex.getMessage());
            }
            request.getRequestDispatcher("/asignaciones.jsp").forward(request, response);
        } else if ("Asignar".equals(request.getParameter("asignarCursoAsignatura"))) {
            String nombreCurso = request.getParameter("curso");
            String[] listaAsignatura = request.getParameterValues("asignatura");
            try {
                for (String asignatura : listaAsignatura) {
                    conexion.asignarCursoAsignatura(asignatura, nombreCurso);
                    request.setAttribute("status", "Asignacion completa");
                }
            } catch (SQLException ex) {
                request.setAttribute("status", ex.getMessage());
            }
            request.getRequestDispatcher("/asignaciones.jsp").forward(request, response);
        } else if ("Asignar".equals(request.getParameter("asignarClaseAlumno"))) {
            String nombreClase = request.getParameter("clase");
            String[] listaAlumno = request.getParameterValues("alumno");
            try {
                for (String alumno : listaAlumno) {
                    conexion.asignarClaseAlumno(alumno, nombreClase);
                    request.setAttribute("status", "Asignacion completa");
                }
            } catch (SQLException ex) {
                request.setAttribute("status", ex.getMessage());
            }
            request.getRequestDispatcher("/asignaciones.jsp").forward(request, response);
        } else if ("Asignar".equals(request.getParameter("asignarProfesorAsignatura"))) {
            String profesor = request.getParameter("profesor");
            String[] listaAsignatura = request.getParameterValues("asignatura");
            try {
                for (String asignatura : listaAsignatura) {
                    conexion.asignarProfesorAsignatura(profesor, asignatura);
                    request.setAttribute("status", "Asignacion completa");
                }
            } catch (SQLException ex) {
                request.setAttribute("status", ex.getMessage());
            }
            request.getRequestDispatcher("/asignaciones.jsp").forward(request, response);
        } else if ("Eliminar".equals(request.getParameter("eliminar"))) {
            String mail = request.getParameter("alumno");
            conexion.eliminarAlumno(mail);
            request.setAttribute("status", "Alumno eliminado");
            request.getRequestDispatcher("/mensajeEliminar.jsp").forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Update.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Update.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
