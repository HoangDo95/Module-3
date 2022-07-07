package repository.customer.impl;

import model.customer.Customer;

import repository.BaseRepository;
import repository.customer.CustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements CustomerRepository {
    static List<Customer> customerList = new ArrayList<>();
    private static final String FIND_ALL = "SELECT * FROM customer";
    private final String INSERT = "insert into customer( customer_type_id, customer_name, customer_birthday, customer_gender, customer_id_card, customer_phone, customer_email, customer_address) values (?,?,?,?,?,?,?,?)";
    private final String FIND_BY_ID = "select * from customer where customer_id = ?";
    private final String UPDATE = "update customer set customer_type_id = ?, customer_name = ?, customer_birthday = ?, customer_gender = ?, customer_id_card = ?, customer_phone = ?, customer_email = ?, customer_address = ? where customer_id = ?";
    private final String DELETE = "delete from customer where customer_id = ? ";

    @Override
    public List<Customer> findAll() {
        customerList.clear();
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            Customer customer = null;

            while (resultSet.next()) {
                int idC = resultSet.getInt("customer_id");
                int idCT = resultSet.getInt("customer_type_id");
                String name = resultSet.getString("customer_name");
                String dayOfBirth = resultSet.getString("customer_birthday");
                int gender = resultSet.getInt("customer_gender");
                String idCard = resultSet.getString("customer_id_card");
                String phone = resultSet.getString("customer_phone");
                String email = resultSet.getString("customer_email");
                String address = resultSet.getString("customer_address");

                customer = new Customer(idC, idCT, name, dayOfBirth, gender, idCard, phone, email, address);
                customerList.add(customer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }

    @Override
    public Customer findById(int id) {
        customerList.clear();
        Customer customer = null;
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int idC = resultSet.getInt("customer_id");
                int idCT = resultSet.getInt("customer_type_id");
                String name = resultSet.getString("customer_name");
                String dayOfBirth = resultSet.getString("customer_birthday");
                int gender = resultSet.getInt("customer_gender");
                String idCard = resultSet.getString("customer_id_card");
                String phone = resultSet.getString("customer_phone");
                String email = resultSet.getString("customer_email");
                String address = resultSet.getString("customer_address");

                customer = new Customer(idC, idCT, name, dayOfBirth, gender, idCard, phone, email, address);
                customerList.add(customer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customer;
    }

    @Override
    public void create(Customer customer) {
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setInt(1, customer.getIdCusType());
            preparedStatement.setString(2, customer.getName());
            preparedStatement.setString(3, customer.getDayOfBirth());
            preparedStatement.setInt(4, customer.getGender());
            preparedStatement.setString(5, customer.getIdCard());
            preparedStatement.setString(6, customer.getPhoneNumber());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getAddress());

            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void edit(Customer customer) {
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setInt(1, customer.getIdCusType());
            preparedStatement.setString(2, customer.getName());
            preparedStatement.setString(3, customer.getDayOfBirth());
            preparedStatement.setInt(4, customer.getGender());
            preparedStatement.setString(5, customer.getIdCard());
            preparedStatement.setString(6, customer.getPhoneNumber());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getAddress());
            preparedStatement.setInt(9, customer.getIdCustomer());
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
