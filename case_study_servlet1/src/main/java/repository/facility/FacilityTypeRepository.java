package repository.facility;

import model.facility.FacilityType;

import java.util.List;

public interface FacilityTypeRepository {
    List<FacilityType> findAll();
}
