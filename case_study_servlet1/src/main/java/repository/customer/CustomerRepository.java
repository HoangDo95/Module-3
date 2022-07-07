package repository.customer;

import model.customer.Customer;

import java.util.List;

public interface CustomerRepository {
    List<Customer> findAll();

    Customer findById(int id);

    void create(Customer customer);

    void edit(Customer customer);

    void delete(int id);

}
