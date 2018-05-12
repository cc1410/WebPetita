/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
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
public class Registro extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         Conexion conexion = new Conexion();
        if ("Crear".equals(request.getParameter("crear"))) {//si clicamos en alta de usuario 
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
                if(a.getTipo() == 1){
                    conexion.insertarProfesor(a);
                }
                request.setAttribute("status", "Usuario dado de alta");
            } catch (Exception ex) {
                request.setAttribute("status", ex);
            }
            request.getRequestDispatcher("/crearUsuario.jsp").forward(request, response);
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
