package service.facility;


import model.facility.Facility;

import java.util.List;

public interface FacilityService {
    List<Facility> findAll();

    Facility findById(int id);

    void create(Facility facility);

    void edit(Facility facility);

    List<Facility> findByFacility(String findName,String findRoom, String FindConvenience);

    void delete(int id);
}
