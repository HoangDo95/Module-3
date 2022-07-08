package service.customer.impl;

import model.customer.Customer;
import repository.customer.CustomerRepository;
import repository.customer.impl.CustomerRepositoryImpl;
import service.customer.CustomerService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImpl implements CustomerService {

    private CustomerRepository customerRepository = new CustomerRepositoryImpl();

    @Override
    public List<Customer> findAll() {
        return customerRepository.findAll();
    }

    @Override
    public Customer findById(int id) {
        return customerRepository.findById(id);
    }

    @Override
    public void create(Customer customer) {
        customerRepository.create(customer);
    }

    @Override
    public void edit(Customer customer) {
        customerRepository.edit(customer);
    }

    @Override
    public void delete(int id) {
        customerRepository.delete(id);
    }

    @Override
    public Map<String, String> validate(HttpServletRequest request, HttpServletResponse response) {
        String REGEX_NAME = "^([A-Z]{1}[a-z]{1,}\\s{1}){1,}([A-Z]{1}[a-z]{1,})$";
        String REGEX_PHONE_NUMBER = "^(091|090|\\(\\+84\\)90|\\(\\+84\\)91)\\d{7}$";
        String ID_CARD_REGEX = "^\\d{9}$";
        String REGEX_ADDRESS = "^((\\d{1,})?[//]?)+((\\s)?([A-Z]{1}[a-z]{1,}))+$";

        Map<String, String> error = new HashMap<>();
        int idCT = Integer.parseInt(request.getParameter("idCT"));

        String name = request.getParameter("name");
        if (!name.matches(REGEX_NAME)) {
            error.put("customer_name", "Wrong format name");
        }

        String dayOfBirth = request.getParameter("dayOfBirth");

        int gender = Integer.parseInt(request.getParameter("gender"));

        String idCard = request.getParameter("idCard");
        if (!idCard.matches(ID_CARD_REGEX)) {
            error.put("customer_id_card", "Wrong format idCard");
        }

        String phone = request.getParameter("phone");
        if (!phone.matches(REGEX_PHONE_NUMBER)) {
            error.put("customer_phone", "Wrong format phone");
        }

        String email = request.getParameter("email");

        String address = request.getParameter("address");
        if (!address.matches(REGEX_ADDRESS)) {
            error.put("customer_address", "Wrong format address");
        }

        if (error.isEmpty()) {
            Customer customer = new Customer(idCT, name, dayOfBirth, gender, idCard, phone, email, address);
            create(customer);
        }
        return error;
    }
}
