/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import objetos.Usuario;

/**
 *
 * @author Juan Elberto
 */
public class Registro extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        if ("button1id".equals(request.getParameter("boton"))) {//si clicamos en alta de usuario 
            //recogemos los datos del formulario 

            String name = request.getParameter("nombre");
            String lastname = request.getParameter("apellidos");
            String mail = request.getParameter("mail");
            String password = request.getParameter("password");
            int tipo = Integer.getInteger( request.getParameter("tipo"));

            
            
            //creamos un Empleado con los datos recogido del fomulario
            Usuario a = new Usuario(name, lastname, mail, password, tipo);
            
            
            try {

                
                request.setAttribute("status", "Empleado dado de alta");
            } catch (Exception ex) {
                request.setAttribute("status", "No se ha podido dar de alta el usuario");
            }
            request.getRequestDispatcher("crearUsuario.jsp").forward(request, response);
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
