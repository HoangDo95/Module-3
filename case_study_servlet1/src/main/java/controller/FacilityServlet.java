package controller;

import model.customer.Customer;
import model.facility.Facility;
import model.facility.FacilityType;
import model.facility.RentType;
import service.facility.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "FacilityServlet", urlPatterns = "/facility")
public class FacilityServlet extends HttpServlet {
    private FacilityService facilityService = new FacilityServiceImpl();
    static List<Facility> facilityList = new ArrayList<>();
    private RentTypeService rentTypeService = new RentTypeServiceImpl();
    static List<RentType> rentTypeList = new ArrayList<>();
    private FacilityTypeService facilityTypeService = new FacilityTypeServiceImpl();
    static List<FacilityType> facilityTypeList = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreate(request, response);
                break;
            case "edit":
                showEdit(request, response);
                break;
            case "find":
                findFacility(request,response);
            default:
                findAll(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createCustomer(request, response);
                break;
            case "edit":
                editCustomer(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
        }
    }


    private void findAll(HttpServletRequest request, HttpServletResponse response) {
        facilityList = facilityService.findAll();
        request.setAttribute("facilityList", facilityList);
        rentTypeList = rentTypeService.findAll();
        request.setAttribute("rentTypeList",rentTypeList);
        facilityTypeList = facilityTypeService.findAll();
        request.setAttribute("facilityTypeList",facilityTypeList);

        try {
            request.getRequestDispatcher("view/facility/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void showCreate(HttpServletRequest request, HttpServletResponse response) {
        rentTypeList = rentTypeService.findAll();
        request.setAttribute("rentTypeList",rentTypeList);
        facilityTypeList = facilityTypeService.findAll();
        request.setAttribute("facilityTypeList",facilityTypeList);

        try {
            request.getRequestDispatcher("view/facility/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
        String nameF = request.getParameter("nameF");
        int areaF = Integer.parseInt(request.getParameter("areaF"));
        double costF = Double.parseDouble(request.getParameter("costF"));
        int maxPeopleF = Integer.parseInt(request.getParameter("maxPeopleF"));
        int idRT = Integer.parseInt(request.getParameter("idRT"));
        int idFT = Integer.parseInt(request.getParameter("idFT"));
        String standardRoom = request.getParameter("standardRoom");
        String convenience = request.getParameter("convenience");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int floors = Integer.parseInt(request.getParameter("floors"));
        String freeF = request.getParameter("freeF");

        Facility facility = new Facility(nameF,areaF,costF,maxPeopleF,idRT,idFT,standardRoom,convenience,poolArea,floors,freeF);
        facilityService.create(facility);
        try {
            response.sendRedirect("/facility");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void showEdit(HttpServletRequest request, HttpServletResponse response) {
        rentTypeList = rentTypeService.findAll();
        request.setAttribute("rentTypeList",rentTypeList);
        facilityTypeList = facilityTypeService.findAll();
        request.setAttribute("facilityTypeList",facilityTypeList);

        int idF = Integer.parseInt(request.getParameter("idF"));
        Facility facility = facilityService.findById(idF);
        request.setAttribute("facility", facility);
        try {
            request.getRequestDispatcher("view/facility/edit.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) {
        int idF = Integer.parseInt(request.getParameter("idF"));
        String nameF = request.getParameter("nameF");
        int areaF = Integer.parseInt(request.getParameter("areaF"));
        double costF = Double.parseDouble(request.getParameter("costF"));
        int maxPeopleF = Integer.parseInt(request.getParameter("maxPeopleF"));
        int idRT = Integer.parseInt(request.getParameter("idRT"));
        int idFT = Integer.parseInt(request.getParameter("idFT"));
        String standardRoom = request.getParameter("standardRoom");
        String convenience = request.getParameter("convenience");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int floors = Integer.parseInt(request.getParameter("floors"));
        String freeF = request.getParameter("freeF");

        Facility facility = new Facility(idF,nameF,areaF,costF,maxPeopleF,idRT,idFT,standardRoom,convenience,poolArea,floors,freeF);
        facilityService.edit(facility);
        try {
            response.sendRedirect("/facility");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void findFacility(HttpServletRequest request, HttpServletResponse response) {
        String findName = request.getParameter("findName");
        String findRoom = request.getParameter("findRoom");
        String findConvenience = request.getParameter("findConvenience");

        facilityList = facilityService.findByFacility(findName,findRoom,findConvenience);
        request.setAttribute("facilityList",facilityList);
        rentTypeList = rentTypeService.findAll();
        request.setAttribute("rentTypeList",rentTypeList);
        facilityTypeList = facilityTypeService.findAll();
        request.setAttribute("facilityTypeList",facilityTypeList);

        try {
            request.getRequestDispatcher("view/facility/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int idF = Integer.parseInt(request.getParameter("idF"));
        facilityService.delete(idF);
        facilityList = facilityService.findAll();
        request.setAttribute("facilityList",facilityList);
        try {
            request.getRequestDispatcher("view/facility/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
