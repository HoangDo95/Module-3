package service.facility;

import model.facility.Facility;
import repository.facility.FacilityRepository;
import repository.facility.FacilityRepositoryImpl;

import java.util.List;

public class FacilityServiceImpl implements FacilityService{
    private FacilityRepository facilityRepository = new FacilityRepositoryImpl();

    @Override
    public List<Facility> findAll() {
        return facilityRepository.findAll();
    }

    @Override
    public Facility findById(int id) {
        return facilityRepository.findById(id);
    }

    @Override
    public void create(Facility facility) {
        facilityRepository.create(facility);
    }

    @Override
    public void edit(Facility facility) {
        facilityRepository.edit(facility);
    }

    @Override
    public List<Facility> findByFacility(String findName, String findRoom, String findConvenience) {
        return facilityRepository.findByFacility(findName,findRoom,findConvenience);
    }

    @Override
    public void delete(int id) {
        facilityRepository.delete(id);
    }
}
