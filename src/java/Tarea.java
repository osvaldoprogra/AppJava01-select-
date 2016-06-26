/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import accesodato.Conex;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import negocio.Responsable;
import negocio.Servicio;
import negocio.Unidad;

/**
 *
 * @author XM21
 */
public class Tarea extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
       Conex con = new Conex();
            if (request.getParameter("servicio_id") != null) {
                String servicio_id = request.getParameter("servicio_id");
                con.setConsulta("select * from Unidades where servicio_id='" + servicio_id + "'");
                ArrayList lista = new ArrayList();

                try {
                    while (con.getResultado().next()) {
                       Unidad uni=new Unidad();
                       uni.setUnidad_id(con.getResultado().getInt("unidad_id"));
                       uni.setNombre(con.getResultado().getString("nombre"));
                       uni.setServicio_id(con.getResultado().getInt("servicio_id"));
                       uni.setEstado(con.getResultado().getString("estado"));
                       lista.add(uni);
                    }
                } catch (SQLException ex) {
                }
                String json = new Gson().toJson(lista);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            } else if (request.getParameter("unidad_id") != null) {
                
                String unidad_id = request.getParameter("unidad_id");
                con.setConsulta("select * from Responsables where unidad_id='" + unidad_id + "'");
                ArrayList lista = new ArrayList();
                try {
                    while (con.getResultado().next()) {
                       Responsable res=new Responsable();
                       res.setResponsable_id(con.getResultado().getInt("reponsable_id"));
                       res.setNombre(con.getResultado().getString("nombre"));
                       res.setUnidad_id(con.getResultado().getInt("unidad_id"));
                       res.setEstado(con.getResultado().getString("estado"));
                        lista.add(res);
                    }
                } catch (SQLException ex) {
                }
                String json = new Gson().toJson(lista);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            } else {
                con.setConsulta("select * from servicios");
                ArrayList lista = new ArrayList();
                try {
                    while (con.getResultado().next()) {
                        Servicio serv = new Servicio();
                        serv.setServicio_id(con.getResultado().getInt("servicio_id"));
                        serv.setNombre(con.getResultado().getString("nombre"));
                        serv.setEstado(con.getResultado().getString("estado"));
                        lista.add(serv);
                    }
                } catch (SQLException ex) {
                }
                String json = new Gson().toJson(lista);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
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
