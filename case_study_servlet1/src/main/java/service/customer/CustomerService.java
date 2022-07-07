package service.customer;

import model.customer.Customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

public interface CustomerService {

    List<Customer> findAll();

    Customer findById(int id);

    void create(Customer customer);

    void edit(Customer customer);

    void delete(int id);

//    Map<String, String> validate(HttpServletRequest request, HttpServletResponse response);

}
