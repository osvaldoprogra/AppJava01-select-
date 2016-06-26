/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import accesodato.Conex;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import negocio.Tarea1;

/**
 *
 * @author XM21
 */
public class Tareai extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Conex con = new Conex();
            Tarea1 t = new Tarea1();
            if (request.getParameter("eliminar") != null) {
                int eliminar_id = Integer.parseInt(request.getParameter("eliminar"));
                t.setTarea_id(eliminar_id);
                t.delete();

                response.sendRedirect("lista.jsp");

            } else if (request.getParameter("editar") != null) {

                int id = Integer.parseInt(request.getParameter("id"));
                String nombre = request.getParameter("nombre");
                String fecha = request.getParameter("fecha");

                int idresp= Integer.parseInt(request.getParameter("responsables"));
                t.setTarea_id(id);
                t.setNombre(nombre);
                t.setFecha(fecha);
                t.setResponsable_id(idresp);
                t.update();
                response.sendRedirect("lista.jsp");
            } else {
                String fecha = request.getParameter("fecha");
                String nombre = request.getParameter("nombre");
                int apellido = Integer.parseInt(request.getParameter("responsables"));
                t.setNombre(nombre);
                t.setFecha(fecha);
                t.setResponsable_id(apellido);
                t.save();
              response.sendRedirect("lista.jsp");
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
