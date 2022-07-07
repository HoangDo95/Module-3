package service.facility;

import model.facility.RentType;
import repository.facility.RentTypeRepository;
import repository.facility.RentTypeRepositoryImpl;

import java.util.List;

public class RentTypeServiceImpl implements RentTypeService{
    private RentTypeRepository rentTypeRepository = new RentTypeRepositoryImpl();

    @Override
    public List<RentType> findAll() {
        return rentTypeRepository.findAll();
    }
}
