package repository.employee;


import model.employee.Employee;

import java.util.List;

public interface EmployeeRepository {
    List<Employee> findAll();

    Employee findById(int id);

    void create(Employee employee);

    void edit(Employee employee);

    void delete(int id);

}
