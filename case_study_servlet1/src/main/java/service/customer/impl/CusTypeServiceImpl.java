package service.customer.impl;

import model.customer.CustomerType;
import repository.customer.CusTypeRepository;
import repository.customer.impl.CusTypeRepositoryImpl;
import service.customer.CusTypeService;

import java.util.List;

public class CusTypeServiceImpl implements CusTypeService {
    private CusTypeRepository cusTypeService = new CusTypeRepositoryImpl();

    @Override
    public List<CustomerType> findAll() {
        return cusTypeService.findAll();
    }
}
