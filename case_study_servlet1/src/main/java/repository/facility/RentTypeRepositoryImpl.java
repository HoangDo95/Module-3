package repository.facility;

import model.facility.RentType;
import repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RentTypeRepositoryImpl implements RentTypeRepository{
    static List<RentType> rentTypeList = new ArrayList<>();
    private final String FIND_ALL = "select * from rent_type";

    @Override
    public List<RentType> findAll() {
        rentTypeList.clear();
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            RentType rentType = null;

            while (resultSet.next()) {
                int idRT = resultSet.getInt("rent_type_id");
                String nameRT = resultSet.getString("rent_type_name");

                rentType = new RentType(idRT, nameRT);
                rentTypeList.add(rentType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rentTypeList;
    }
}
