package com.example.blooddonationproject;


import com.example.blooddonationproject.model.Facility;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.List;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {

    private DatabaseUtilAdmin dbUtil;
//    private final String dbUrl = "jdbc:mysql://localhost:3306/blood_donation_centre?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=CET";
    private final String dbUrl = "jdbc:mysql://localhost:3306/blood_donation_centre";

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);

        try {
            dbUtil = new DatabaseUtilAdmin(dbUrl);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {

        response.setContentType("text/html");

        String name = request.getParameter("loginInput");
        String password = request.getParameter("passwordInput");
//        log("abcd");
//        System.out.println(name);
//        System.out.println(password);

        dbUtil.setName(name);
        dbUtil.setPassword(password);

        if (validate(name, password)) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin_view.jsp");

            List<Facility> facilityList = null;
            try {
                facilityList = dbUtil.getFacilitiesForQuery();
            } catch (Exception e) {
                e.printStackTrace();
            }

            // dodanie listy do obiektu zadania
            request.setAttribute("FACILITIES_LIST", facilityList);
            dispatcher.forward(request, response);
        } else {

            RequestDispatcher dispatcher = request.getRequestDispatcher("logging.html");
            dispatcher.include(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {

        try {
            // odczytanie zadania
            String command = request.getParameter("command");

            if (command == null)
                command = "LIST";

            switch (command) {
                case "LIST":
                    listFacilities(request, response);
                    break;

                case "HOME_LIST":
                    homeListFacilities(request, response);
                    break;

                case "ADD":
                    addFacilities(request, response);
                    break;

                case "LOAD":
                    loadFacility(request, response);
                    break;

                case "UPDATE":
                    updateFacility(request, response);
                    break;

                case "DELETE":
                    deleteFacility(request, response);
                    break;

                default:
                    listFacilities(request, response);
            }

        } catch (Exception e) {
            throw new ServletException(e);
        }

    }

    private void deleteFacility(HttpServletRequest request, HttpServletResponse response) throws Exception {

        // odczytanie danych z formularza
        String id = request.getParameter("facilityID");

        // usuniecie obiektu z BD
        dbUtil.deleteFacility(id);

        // wyslanie danych do strony z lista obiektow
        listFacilities(request, response);

    }

    private void updateFacility(HttpServletRequest request, HttpServletResponse response) throws Exception {

        // odczytanie danych z formularza
        int id = Integer.parseInt(request.getParameter("facilityID"));
        String rckikName = request.getParameter("nameInput");
        String address = request.getParameter("addresseInput");
        String postCode = request.getParameter("postCodeInput");
        String city = request.getParameter("cityInput");
        String phoneNumber = request.getParameter("phoneNumberInput");
        String website = request.getParameter("websiteInput");

        // utworzenie nowego obiektu
        Facility facility = new Facility(id, rckikName, address, postCode, city, phoneNumber, website);

        // uaktualnienie danych w BD
        dbUtil.updateFacility(facility);

        // wyslanie danych do strony z lista telefonow
        listFacilities(request, response);

    }

    private void loadFacility(HttpServletRequest request, HttpServletResponse response) throws Exception {
//
//        // odczytanie id obiektu z formularza
//        String id = request.getParameter("facilityID");
//
//        // pobranie  danych telefonu z BD
//        Facility facility = dbUtil.getFacility(id); <- jeszcze nie ma takiej metody
//        Phone phone = dbUtil.getPhone(id);
//
//        // przekazanie telefonu do obiektu request
//        request.setAttribute("FACILITY", facility);
//
//        // wyslanie danych do formmularza JSP (update_phone_form)
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/add_facility_form.jsp");
//        dispatcher.forward(request, response);

    }

    private void addFacilities(HttpServletRequest request, HttpServletResponse response) throws Exception {

        // odczytanie danych z formularza
        String rckikName = request.getParameter("nameInput");
        String address = request.getParameter("addressInput");
        String postCode = request.getParameter("postCodeInput");
        String city = request.getParameter("cityInput");
        String phoneNumber = request.getParameter("phoneNumberInput");
        String website = request.getParameter("websiteInput");

        // dodanie nowego obiektu do BD
        Facility facility = new Facility(rckikName, address, postCode, city, phoneNumber, website);
        dbUtil.addFacility(facility);

        // powrot do listy
        listFacilities(request, response);
    }


    private void listFacilities(HttpServletRequest request, HttpServletResponse response) throws Exception {

        List<Facility> facilityList = dbUtil.getFacilitiesForQuery();

        // dodanie listy do obiektu zadania
        request.setAttribute("FACILITIES_LIST", facilityList);

        // dodanie request dispatcher
        RequestDispatcher dispatcher = request.getRequestDispatcher("/add_facility_form.jsp");

        // przekazanie do JSP
        dispatcher.forward(request, response);
    }

    private void homeListFacilities(HttpServletRequest request, HttpServletResponse response) throws Exception {

        List<Facility> facilityList = dbUtil.getFacilitiesForQuery();

        // dodanie listy do obiektu zadania
        request.setAttribute("FACILITIES_LIST", facilityList);

        // dodanie request dispatcher
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin_view.jsp");

        // przekazanie do JSP
        dispatcher.forward(request, response);
    }


    private boolean validate(String name, String pass) {
        boolean status = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(dbUrl, name, pass);
            status = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}
