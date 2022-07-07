package service.customer;


import model.customer.CustomerType;

import java.util.List;

public interface CusTypeService {
    List<CustomerType> findAll();
}
