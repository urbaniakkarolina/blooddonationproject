package com.example.blooddonationproject;

import com.example.blooddonationproject.model.Facility;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.util.List;

@WebServlet("/ClientServlet")
public class ClientServlet extends HttpServlet {

    private DatabaseUtilClient dbUtil;
    private final String dbUrl = "jdbc:mysql://localhost:3306/blood_donation_centre";

//    public ClientServlet() {
//
//        // Obtain our environment naming context
//        Context initCtx = null;
//        try {
//            initCtx = new InitialContext();
//            Context envCtx = (Context) initCtx.lookup("java:comp/env");
//
//            dataSource = (DataSource)
//                    envCtx.lookup("jdbc/facilities_webapp");
//
//        } catch (NamingException e) {
//            e.printStackTrace();
//        }
//    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);

        try {
            dbUtil = new DatabaseUtilClient(dbUrl);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }


//    @Override
//    public void init() throws ServletException {
//        super.init();
//
//        try {
//
//            dbUtil = new DatabaseUtilClient(dataSource); //obiekt klasy DBU
//
//        } catch (Exception e) {
//            throw new ServletException(e);
//        }
//    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {

            // lista obiektow (MVC)
            listFacilities(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void listFacilities(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // pobranie danych dzieki DBUtil
        List<Facility> facilityList = dbUtil.getFacilitiesForQuery();

        request.setAttribute("FACILITIES_LIST", facilityList);

        // wyslanie danych do JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }
}
