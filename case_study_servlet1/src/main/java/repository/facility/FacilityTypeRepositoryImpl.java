package repository.facility;

import model.facility.FacilityType;
import repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityTypeRepositoryImpl implements FacilityTypeRepository{
    static List<FacilityType> facilityTypeList = new ArrayList<>();
    private final String FIND_ALL = "select * from facilyti_type";

    @Override
    public List<FacilityType> findAll() {
        facilityTypeList.clear();
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            FacilityType facilityType = null;

            while (resultSet.next()) {
                int idFT = resultSet.getInt("facilyti_type_id");
                String nameFT = resultSet.getString("facilyti_type_name");

                facilityType = new FacilityType(idFT, nameFT);
                facilityTypeList.add(facilityType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return facilityTypeList;
    }
}
