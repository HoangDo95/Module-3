package repository.customer;


import model.customer.CustomerType;

import java.util.List;

public interface CusTypeRepository {
    List<CustomerType> findAll();
}
