package repository.customer.impl;

import model.customer.CustomerType;
import repository.BaseRepository;
import repository.customer.CusTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CusTypeRepositoryImpl implements CusTypeRepository {
    private static final String FIND_ALL = "SELECT * FROM customer_type";

    @Override
    public List<CustomerType> findAll() {
        List<CustomerType> customerTypeList = new ArrayList<>();
        customerTypeList.clear();
        try {
            Connection connection = new BaseRepository().getConnection();

            PreparedStatement preparedStatement =
                    connection.prepareStatement(FIND_ALL);

            ResultSet resultSet = preparedStatement.executeQuery();
            CustomerType customerType = null;
            while (resultSet.next()) {
                int id = resultSet.getInt("customer_type_id");
                String name = resultSet.getString("customer_type_name");
                customerType = new CustomerType(id, name);
                customerTypeList.add(customerType);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return customerTypeList;
    }
}
