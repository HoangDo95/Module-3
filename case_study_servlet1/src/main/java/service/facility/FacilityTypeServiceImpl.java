package service.facility;

import model.facility.FacilityType;
import repository.facility.FacilityTypeRepository;
import repository.facility.FacilityTypeRepositoryImpl;

import java.util.List;

public class FacilityTypeServiceImpl implements FacilityTypeService{
    private FacilityTypeRepository facilityTypeRepository = new FacilityTypeRepositoryImpl();
    @Override
    public List<FacilityType> findAll() {
        return facilityTypeRepository.findAll();
    }
}
