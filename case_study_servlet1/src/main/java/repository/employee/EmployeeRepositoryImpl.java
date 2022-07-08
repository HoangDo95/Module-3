package repository.employee;

import model.employee.Employee;
import repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepositoryImpl implements EmployeeRepository {
    static List<Employee> employeeList = new ArrayList<>();
    private final String FIND_ALL = "SELECT * FROM employee";
    private final String FIND_BY_ID = "select * from employee where employee_id = ?";
    private final String INSERT = "insert into employee(name, date_of_birth, id_card, salary, phone_number, email, address, position_id, education_degree_id, division_id, user_name) values (?,?,?,?,?,?,?,?,?,?,?)";
    private final String UPDATE = "update employee set name = ?, date_of_birth = ?, id_card = ?, salary = ?, phone_number = ?, email = ?, address = ?, position_id = ?, education_degree_id = ?, division_id = ?, user_name = ? where employee_id = ?";
    private final String DELETE = "delete from employee where employee_id = ?";
    @Override
    public List<Employee> findAll() {
        employeeList.clear();
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            Employee employee = null;

            while (resultSet.next()) {
                int idE = resultSet.getInt("employee_id");
                String nameE = resultSet.getString("name");
                String dayOfBirthE = resultSet.getString("date_of_birth");
                String idCardE = resultSet.getString("id_card");
                double salaryE = resultSet.getDouble("salary");
                String phoneE = resultSet.getString("phone_number");
                String emailE = resultSet.getString("email");
                String addressE = resultSet.getString("address");
                int idPosition = resultSet.getInt("position_id");
                int idEducation = resultSet.getInt("education_degree_id");
                int idDivision = resultSet.getInt("division_id");
                String userName = resultSet.getString("user_name");

                employee = new Employee(idE, nameE, dayOfBirthE, idCardE, salaryE, phoneE, emailE, addressE, idPosition, idEducation, idDivision, userName);
                employeeList.add(employee);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return employeeList;
    }

    @Override
    public Employee findById(int id) {
        employeeList.clear();
        Employee employee = null;
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String nameE = resultSet.getString("name");
                String dayOfBirthE = resultSet.getString("date_of_birth");
                String idCardE = resultSet.getString("id_card");
                double salaryE = resultSet.getDouble("salary");
                String phoneE = resultSet.getString("phone_number");
                String emailE = resultSet.getString("email");
                String addressE = resultSet.getString("address");
                int idPosition = resultSet.getInt("position_id");
                int idEducation = resultSet.getInt("education_degree_id");
                int idDivision = resultSet.getInt("division_id");
                String userName = resultSet.getString("user_name");
                employee = new Employee(nameE, dayOfBirthE, idCardE, salaryE, phoneE, emailE, addressE, idPosition, idEducation, idDivision, userName);
                employeeList.add(employee);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employee;
    }

    @Override
    public void create(Employee employee) {
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1, employee.getNameE());
            preparedStatement.setString(2, employee.getDayOfBirthE());
            preparedStatement.setString(3, employee.getIdCardE());
            preparedStatement.setDouble(4, employee.getSalaryE());
            preparedStatement.setString(5, employee.getPhoneE());
            preparedStatement.setString(6, employee.getEmailE());
            preparedStatement.setString(7, employee.getAddressE());
            preparedStatement.setInt(8, employee.getIdPosition());
            preparedStatement.setInt(9, employee.getIdEducation());
            preparedStatement.setInt(10, employee.getIdDivision());
            preparedStatement.setString(11, employee.getUserName());

            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void edit(Employee employee) {
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1, employee.getNameE());
            preparedStatement.setString(2, employee.getDayOfBirthE());
            preparedStatement.setString(3, employee.getIdCardE());
            preparedStatement.setDouble(4, employee.getSalaryE());
            preparedStatement.setString(5, employee.getPhoneE());
            preparedStatement.setString(6, employee.getEmailE());
            preparedStatement.setString(7, employee.getAddressE());
            preparedStatement.setInt(8, employee.getIdPosition());
            preparedStatement.setInt(9, employee.getIdEducation());
            preparedStatement.setInt(10, employee.getIdDivision());
            preparedStatement.setString(11, employee.getUserName());
            preparedStatement.setInt(12, employee.getIdE());
            preparedStatement.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
