package repository.facility;

import model.customer.Customer;
import model.facility.Facility;
import repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepositoryImpl implements FacilityRepository {
    static List<Facility> facilityList = new ArrayList<>();
    private final String FIND_ALL = "select * from facilyti";
    private final String INSERT = "insert into facilyti(facilyti_name, facilyti_area, facilyti_cost, facilyti_max_people, rent_type_id, facilyti_type_id, standard_room, description_other_convenience, pool_area, number_of_floors, facilyti_free ) values (?,?,?,?,?,?,?,?,?,?,?)";
    private final String FIND_BY_ID = "select * from facilyti where facilyti_id = ?";
    private final String UPDATE = "update facilyti set facilyti_name = ?, facilyti_area = ?, facilyti_cost = ?, facilyti_max_people = ?, rent_type_id = ?, facilyti_type_id = ?, standard_room = ?, description_other_convenience = ?, pool_area = ?, number_of_floors = ?, facilyti_free = ? where facilyti_id = ?";
    private final String FIND_FACILITY = " select * from facilyti where facilyti_name like ? and standard_room like ? and facilyti_free like ?";
private final String DELETE = "delete from facilyti where facilyti_id = ? ";

    @Override
    public List<Facility> findAll() {
        facilityList.clear();
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            Facility facility = null;

            while (resultSet.next()) {
                int idF = resultSet.getInt("facilyti_id");
                String nameF = resultSet.getString("facilyti_name");
                int areaF = resultSet.getInt("facilyti_area");
                double costF = resultSet.getDouble("facilyti_area");
                int maxPeopleF = resultSet.getInt("facilyti_max_people");
                int idRT = resultSet.getInt("rent_type_id");
                int idFT = resultSet.getInt("facilyti_type_id");
                String standardRoom = resultSet.getString("standard_room");
                String convenience = resultSet.getString("description_other_convenience");
                double poolArea = resultSet.getDouble("pool_area");
                int floors = resultSet.getInt("number_of_floors");
                String freeF = resultSet.getString("facilyti_free");

                facility = new Facility(idF, nameF, areaF, costF, maxPeopleF, idRT, idFT, standardRoom, convenience, poolArea, floors, freeF);
                facilityList.add(facility);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return facilityList;
    }

    @Override
    public Facility findById(int id) {
        facilityList.clear();
        Facility facility = null;
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int idF = resultSet.getInt("facilyti_id");
                String nameF = resultSet.getString("facilyti_name");
                int areaF = resultSet.getInt("facilyti_area");
                double costF = resultSet.getDouble("facilyti_area");
                int maxPeopleF = resultSet.getInt("facilyti_max_people");
                int idRT = resultSet.getInt("rent_type_id");
                int idFT = resultSet.getInt("facilyti_type_id");
                String standardRoom = resultSet.getString("standard_room");
                String convenience = resultSet.getString("description_other_convenience");
                double poolArea = resultSet.getDouble("pool_area");
                int floors = resultSet.getInt("number_of_floors");
                String freeF = resultSet.getString("facilyti_free");

                facility = new Facility(idF, nameF, areaF, costF, maxPeopleF, idRT, idFT, standardRoom, convenience, poolArea, floors, freeF);
                facilityList.add(facility);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return facility;
    }

    @Override
    public void create(Facility facility) {
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1, facility.getNameF());
            preparedStatement.setInt(2, facility.getAreaF());
            preparedStatement.setDouble(3, facility.getCostF());
            preparedStatement.setInt(4, facility.getMaxPeopleF());
            preparedStatement.setInt(5, facility.getIdRentType());
            preparedStatement.setInt(6, facility.getIdFacType());
            preparedStatement.setString(7, facility.getStandardRoom());
            preparedStatement.setString(8, facility.getConvenience());
            preparedStatement.setDouble(9, facility.getPoolArea());
            preparedStatement.setInt(10, facility.getFloors());
            preparedStatement.setString(11, facility.getFreeF());

            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void edit(Facility facility) {
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1, facility.getNameF());
            preparedStatement.setInt(2, facility.getAreaF());
            preparedStatement.setDouble(3, facility.getCostF());
            preparedStatement.setInt(4, facility.getMaxPeopleF());
            preparedStatement.setInt(5, facility.getIdRentType());
            preparedStatement.setInt(6, facility.getIdFacType());
            preparedStatement.setString(7, facility.getStandardRoom());
            preparedStatement.setString(8, facility.getConvenience());
            preparedStatement.setDouble(9, facility.getPoolArea());
            preparedStatement.setInt(10, facility.getFloors());
            preparedStatement.setString(11, facility.getFreeF());
            preparedStatement.setInt(12, facility.getIdF());
            preparedStatement.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<Facility> findByFacility(String findName, String findRoom, String findConvenience) {
        facilityList.clear();
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement =
                    connection.prepareStatement(FIND_FACILITY);
            preparedStatement.setString(1, "%" + findName + "%");
            preparedStatement.setString(2, "%" + findRoom + "%");
            preparedStatement.setString(3, "%" + findConvenience + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            Facility facility = null;

            while (resultSet.next()) {
                int idF = resultSet.getInt("facilyti_id");
                String nameF = resultSet.getString("facilyti_name");
                int areaF = resultSet.getInt("facilyti_area");
                double costF = resultSet.getDouble("facilyti_area");
                int maxPeopleF = resultSet.getInt("facilyti_max_people");
                int idRT = resultSet.getInt("rent_type_id");
                int idFT = resultSet.getInt("facilyti_type_id");
                String standardRoom = resultSet.getString("standard_room");
                String convenience = resultSet.getString("description_other_convenience");
                double poolArea = resultSet.getDouble("pool_area");
                int floors = resultSet.getInt("number_of_floors");
                String freeF = resultSet.getString("facilyti_free");

                facility = new Facility(idF, nameF, areaF, costF, maxPeopleF, idRT, idFT, standardRoom, convenience, poolArea, floors, freeF);
                facilityList.add(facility);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return facilityList;
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
