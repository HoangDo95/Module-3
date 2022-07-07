package controller;

import model.customer.Customer;
import model.customer.CustomerType;
import service.customer.CusTypeService;
import service.customer.CustomerService;
import service.customer.impl.CusTypeServiceImpl;
import service.customer.impl.CustomerServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CusServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {

    private CustomerService customerService = new CustomerServiceImpl();
    private CusTypeService cusTypeService = new CusTypeServiceImpl();
    static List<Customer> customerList = new ArrayList<>();
    static List<CustomerType> customerTypeList = new ArrayList<>();

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
        customerList = customerService.findAll();
        request.setAttribute("customerList", customerList);
        customerTypeList = cusTypeService.findAll();
        request.setAttribute("customerTypeList", customerTypeList);
        try {
            request.getRequestDispatcher("view/customer/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) {
        customerTypeList = cusTypeService.findAll();
        request.setAttribute("customerTypeList", customerTypeList);

        try {
            request.getRequestDispatcher("view/customer/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
//        Map<String, String> validate = customerService.validate(request, response);
//        if (validate.isEmpty()) {
//            customerTypeList = cusTypeService.findAll();
//            request.setAttribute("customerTypeList", customerTypeList);
//
//            customerList = customerService.findAll();
//            request.setAttribute("customerList", customerList);
//            request.setAttribute("smg", "Add new successful");
//            try {
//                request.getRequestDispatcher("view/customer/list.jsp").forward(request, response);
//            } catch (ServletException e) {
//                e.printStackTrace();
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        } else {
//            try {
//                request.setAttribute("validate", validate);
//                request.getRequestDispatcher("view/customer/list.jsp").forward(request, response);
//            } catch (ServletException e) {
//                e.printStackTrace();
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }


        int idCT = Integer.parseInt(request.getParameter("idCT"));
        String name = request.getParameter("name");
        String dayOfBirth = request.getParameter("dayOfBirth");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        Customer customer = new Customer(idCT, name, dayOfBirth, gender, idCard, phone, email, address);
        customerService.create(customer);
        try {
            response.sendRedirect("/customer");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEdit(HttpServletRequest request, HttpServletResponse response) {
        customerTypeList = cusTypeService.findAll();
        request.setAttribute("customerTypeList", customerTypeList);

        int idC = Integer.parseInt(request.getParameter("idC"));
        Customer customer = customerService.findById(idC);
        request.setAttribute("customer", customer);
        try {
            request.getRequestDispatcher("view/customer/edit.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) {
        int idC = Integer.parseInt(request.getParameter("idC"));
        int idCT = Integer.parseInt(request.getParameter("idCT"));
        String name = request.getParameter("name");
        String dayOfBirth = request.getParameter("dayOfBirth");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        Customer customer = new Customer(idC, idCT, name, dayOfBirth, gender, idCard, phone, email, address);
        customerService.edit(customer);
        try {
            response.sendRedirect("/customer");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {

        int idC = Integer.parseInt(request.getParameter("idC"));
        customerService.delete(idC);
        customerList = customerService.findAll();
        request.setAttribute("customerList", customerList);
        customerTypeList = cusTypeService.findAll();
        request.setAttribute("customerTypeList", customerTypeList);

        try {
            request.getRequestDispatcher("view/customer/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
