package controller;

import model.User;
import service.IUserService;
import service.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = "/user")
public class UserServlet extends HttpServlet {
    static List<User> userList = new ArrayList<>();
    private IUserService userService = new UserServiceImpl();

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
            case "delete":
//                showDelete(request, response);
                break;
            case "find":
                findByCountry(request,response);
                break;
            case "sort":
                sortByName(request,response);
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
                createUser(request, response);
                break;
            case "edit":
                editUser(request, response);
                break;
            case "search":
                break;
            default:
                findAll(request, response);
                break;
        }
    }




    private void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        userList = userService.findAll();
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("list.jsp").forward(request, response);
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("create.jsp").forward(request, response);
    }
    private void createUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");


        User user = new User(id, name, email, country);
        userService.create(user);
        response.sendRedirect("/user");
    }

    private void showEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.findById(id);
        request.setAttribute("user", user);
        request.getRequestDispatcher("edit.jsp").forward(request, response);
    }

    private void editUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        User user = new User(id ,name, email, country);

        userService.edit( user);
        response.sendRedirect("/user");
    }

    private void findByCountry(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String findCountry = request.getParameter("findCountry");
        userList = userService.findByCountry(findCountry);
        request.setAttribute("userList",userList);
        request.getRequestDispatcher("list.jsp").forward(request,response);
    }

    private void sortByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        userList = userService.sortByName();
        request.setAttribute("userList",userList);
        request.getRequestDispatcher("list.jsp").forward(request,response);
    }

}
