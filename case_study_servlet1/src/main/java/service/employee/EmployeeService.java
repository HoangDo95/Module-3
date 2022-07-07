package service.employee;

import model.employee.Employee;

import java.util.List;

public interface EmployeeService {
    List<Employee> findAll();

    Employee findById(int id);

    void create(Employee employee);

    void edit(Employee employee);

    void delete(int id);
}
