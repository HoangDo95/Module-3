package service.employee;

import model.employee.Employee;
import repository.employee.EmployeeRepository;
import repository.employee.EmployeeRepositoryImpl;

import java.util.List;

public class EmployeeServiceImpl implements EmployeeService{
    private EmployeeRepository employeeRepository = new EmployeeRepositoryImpl();
    @Override
    public List<Employee> findAll() {
        return employeeRepository.findAll();
    }

    @Override
    public Employee findById(int id) {
        return employeeRepository.findById(id);
    }

    @Override
    public void create(Employee employee) {
        employeeRepository.create(employee);
    }

    @Override
    public void edit(Employee employee) {
        employeeRepository.edit(employee);
    }

    @Override
    public void delete(int id) {
        employeeRepository.delete(id);
    }
}
