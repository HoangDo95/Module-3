package controller;

import model.employee.Employee;
import service.employee.EmployeeService;
import service.employee.EmployeeServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "EmployeeServlet", urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {
    static List<Employee> employeeList = new ArrayList<>();
    private EmployeeService employeeService = new EmployeeServiceImpl();

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
//                showEdit(request, response);
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
//                editCustomer(request, response);
                break;
            case "delete":
//                deleteCustomer(request, response);
                break;
        }
    }



    private void findAll(HttpServletRequest request, HttpServletResponse response) {
        employeeList = employeeService.findAll();
        request.setAttribute("employeeList", employeeList);

        try {
            request.getRequestDispatcher("view/employee/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void showCreate(HttpServletRequest request, HttpServletResponse response) {
        employeeList = employeeService.findAll();
        request.setAttribute("employeeList",employeeList);

        try {
            request.getRequestDispatcher("view/employee/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
        String nameE = request.getParameter("nameE");
        String dayOfBirthE = request.getParameter("dayOfBirthE");
        String idCardE = request.getParameter("idCardE");
        double salaryE = Double.parseDouble(request.getParameter("salaryE"));
        String phoneE = request.getParameter("phoneE");
        String emailE = request.getParameter("emailE");
        String addressE = request.getParameter("addressE");
        int idPosition = Integer.parseInt(request.getParameter("idPosition"));
        int idEducation = Integer.parseInt(request.getParameter("idEducation"));
        int idDivision = Integer.parseInt(request.getParameter("idDivision"));
        String userName = request.getParameter("userName");
        Employee employee = new Employee(nameE,dayOfBirthE,idCardE,salaryE,phoneE,emailE,addressE,idPosition,idEducation,idDivision,userName);
        employeeService.create(employee);
        try {
            response.sendRedirect("/employee");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
