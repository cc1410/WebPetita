/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import excepciones.Excepciones;
import java.io.IOException;
import java.sql.SQLException;
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
public class Login extends HttpServlet {



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
        Conexion conexion = new Conexion();
        if ("Login".equals(request.getParameter("login"))) {//si clicamos en login
            //recogemos los datos del login

            String mail = request.getParameter("mail");
            String password = request.getParameter("password");
            try {
                Usuario user = conexion.loginUser(mail, password);
                // Guardas en la variable de sesión el user o el mail
                System.out.println(user.getNombre());
                int tipo = user.getTipo();
                if (tipo == 0){
                    request.getSession(true).setAttribute("login", user);
                response.sendRedirect(request.getContextPath() + "/homeadmin.jsp");
                }else if(tipo == 1){
                    request.getSession(true).setAttribute("login", user);
                response.sendRedirect(request.getContextPath() + "/home.jsp");
                }
                
                
            } catch (Excepciones | SQLException ex) {
                request.setAttribute("status", ex.getMessage());
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
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
