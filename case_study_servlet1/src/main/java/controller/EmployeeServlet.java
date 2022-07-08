package controller;

import model.customer.Customer;
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
                createEmployee(request, response);
                break;
            case "edit":
                editEmployee(request, response);
                break;
            case "delete":
                deleteEmployee(request, response);
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
        request.setAttribute("employeeList", employeeList);

        try {
            request.getRequestDispatcher("view/employee/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response) {

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

        Employee employee = new Employee(nameE, dayOfBirthE, idCardE, salaryE, phoneE, emailE, addressE, idPosition, idEducation, idDivision, userName);
        employeeService.create(employee);
        try {
            response.sendRedirect("/employee");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEdit(HttpServletRequest request, HttpServletResponse response) {
        employeeList = employeeService.findAll();
        request.setAttribute("employeeList", employeeList);

        int idE = Integer.parseInt(request.getParameter("idE"));
        Employee employee = employeeService.findById(idE);
        request.setAttribute("employee", employee);
        try {
            request.getRequestDispatcher("view/employee/edit.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editEmployee(HttpServletRequest request, HttpServletResponse response) {
        int idE = Integer.parseInt(request.getParameter("idE"));
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

        Employee employee = new Employee(idE, nameE, dayOfBirthE, idCardE, salaryE, phoneE, emailE, addressE, idPosition, idEducation, idDivision, userName);
        employeeService.edit(employee);
        try {
            response.sendRedirect("/employee");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        int idE = Integer.parseInt(request.getParameter("idE"));
        employeeService.delete(idE);
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
}
