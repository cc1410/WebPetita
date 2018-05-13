/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdbcPepitaWeb.Conexion;
import model.Asignatura;
import model.Clase;
import model.Curso;
import model.Usuario;

/**
 *
 * @author Juan Elberto
 */
public class Lista extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Conexion conexion = new Conexion();
        if ("Asignacion".equals(request.getParameter("Asigancion"))) {
            String asignacion = request.getParameter("asignacion");
            try {
                if (asignacion.equals("Curso-Clase")) {
                    List<Curso> listaCurso = conexion.listaCurso();
                    List<Clase> listaClase = conexion.listaClase();
                    request.setAttribute("listaCurso", listaCurso);
                    request.setAttribute("listaClase", listaClase);
                } else if (asignacion.equals("Curso-Asignatura")) 
                {
                    List<Curso> listaCurso = conexion.listaCurso();
                    List<Asignatura> listaAsignatura = conexion.listaAsignatura();
                    request.setAttribute("listaAsignatura", listaAsignatura);
                    request.setAttribute("listaCurso", listaCurso);
                } else if (asignacion.equals("Clase-Tutor")) 
                {
                    List<Clase> listaClase = conexion.listaClase();
                    List<Usuario> listProfesor = conexion.listaProfesorNotTutor();
                    request.setAttribute("listaProfesor", listProfesor);
                    request.setAttribute("listaClase", listaClase);
                } else if (asignacion.equals("Alumno-Clase")) 
                {
                    List<Usuario> listaAlumno = conexion.listaAlumnos();
                    List<Clase> listaClase = conexion.listaClase();
                    request.setAttribute("listaAlumno", listaAlumno);
                    request.setAttribute("listaClase", listaClase);
                } else if (asignacion.equals("Profesor-Asignatura")) 
                {
                    List<Usuario> listProfesor = conexion.listaProfesor();
                    List<Asignatura> listaAsignatura = conexion.listaAsignatura();
                    request.setAttribute("listaAsignatura", listaAsignatura);
                    request.setAttribute("listaProfesor", listProfesor);
                }
            } catch (SQLException ex) {
                request.setAttribute("status", ex.getMessage());
            }
            request.getRequestDispatcher("/asignaciones.jsp").forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
