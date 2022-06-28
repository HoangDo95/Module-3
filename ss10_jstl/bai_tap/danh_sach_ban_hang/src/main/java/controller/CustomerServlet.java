package controller;

import model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Converter Servlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    static List<Customer> customerList = new ArrayList<>();
    static {
        customerList.add(new Customer("Mai Van Hoang", "1983/08/20","Ha Noi","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSstAmPNQLPrPC0azNfD4P4OBiBYJm3x-ssbA&usqp=CAU"));
        customerList.add(new Customer("Nguyen Van Nam", "1983/08/21","Bac Giang","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSstAmPNQLPrPC0azNfD4P4OBiBYJm3x-ssbA&usqp=CAU"));
        customerList.add(new Customer("Nguyen Thai Hoa", "1983/08/22","Nam Dinh","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSstAmPNQLPrPC0azNfD4P4OBiBYJm3x-ssbA&usqp=CAU"));
        customerList.add(new Customer("Tran Dang Khoa", "1983/08/17","Ha Tay","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSstAmPNQLPrPC0azNfD4P4OBiBYJm3x-ssbA&usqp=CAU"));
        customerList.add(new Customer("Nguyen Dinh Thi", "1983/08/19","Ha Noi","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSstAmPNQLPrPC0azNfD4P4OBiBYJm3x-ssbA&usqp=CAU"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList",customerList);
        request.getRequestDispatcher("display.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
