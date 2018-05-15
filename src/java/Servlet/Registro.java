/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import excepciones.Excepciones;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class Registro extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
         Conexion conexion = new Conexion();
         
         //******************************************************** insertar usuario ********************************************************************************************
        if ("Crear".equals(request.getParameter("crear"))) {//clicamos en alta de usuario 
            //recogemos los datos del formulario 
            String name = request.getParameter("nombre");
            String lastname = request.getParameter("apellidos");
            String mail = request.getParameter("mail");
            String dni = request.getParameter("dni");
            String password = request.getParameter("password");
            int tipo = Integer.parseInt(request.getParameter("tipo"));
            //creamos un Empleado con los datos recogido del fomulario
            Usuario a = new Usuario(name, lastname, password, dni, mail, tipo);
            try {
                if(a.getTipo() == 1 || a.getTipo() == 2){
                    conexion.insertarUsuario(a);
                }
                request.setAttribute("status", "Usuario dado de alta");
            } catch (Excepciones ex) {
                request.setAttribute("status", ex.getMessage());
            }
            request.getRequestDispatcher("/crearUsuario.jsp").forward(request, response);
        }
        //******************************************************** insertar Curso ********************************************************************************************
        else if ("insertar".equals(request.getParameter("insertarCurso"))) {
             String tituloCurso = request.getParameter("tituloCurso");
            int year = Integer.parseInt(request.getParameter("year"));
            Curso a = new Curso(tituloCurso, year);
            try {
                conexion.insertarCurso(a);
                request.setAttribute("curso", "Curso dado de alta");
            } catch (Excepciones ex) {
                request.setAttribute("curso", ex.getMessage());
            }
            request.getRequestDispatcher("/crearCurso.jsp").forward(request, response);
        }
        // ******************************************************** insertar clase ********************************************************************************************
        else if ("insertar".equals(request.getParameter("insertarClase"))) {
             String tituloClase = request.getParameter("nombreClase");
             
            Clase a = new Clase(tituloClase);
            try {
                conexion.insertarClase(a);
                request.setAttribute("clase", "Clase dada de alta");
            } catch (Excepciones ex) {
                request.setAttribute("clase", ex.getMessage());
            }
            request.getRequestDispatcher("/crearClase.jsp").forward(request, response);
        }
        // ******************************************************** insertar asignatura ********************************************************************************************
        else if ("Insertar".equals(request.getParameter("insertarAsignatura"))) {
             String tituloAsignatura = request.getParameter("nombreAsignatura");
             
            Asignatura a = new Asignatura(tituloAsignatura);
            try {
                conexion.insertarAsignatura(a);
                request.setAttribute("asignatura", "Asignatura dada de alta");
            } catch (Excepciones ex) {
                request.setAttribute("asignatura", ex.getMessage());
            }
            request.getRequestDispatcher("/crearAsignatura.jsp").forward(request, response);
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
            Logger.getLogger(Registro.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Registro.class.getName()).log(Level.SEVERE, null, ex);
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
