package nl.iodigital.atjes.backend.logic.service;

import java.util.List;

import org.springframework.stereotype.Service;

import nl.iodigital.atjes.backend.logic.converters.BeverageConverter;
import nl.iodigital.atjes.backend.logic.db.BeverageDao;
import nl.iodigital.atjes.backend.models.BeverageModel;

@Service
public class BeverageService {

    private final BeverageDao beverageDao;

    public BeverageService(BeverageDao beverageDao) {
        this.beverageDao = beverageDao;
    }

    public void registerBeverage(BeverageModel beverage) {
        beverageDao.save(BeverageConverter.toEntity(beverage));
    }
    public List<BeverageModel> getBeverages() {
        return BeverageConverter.toModelList(beverageDao.findAll());
    }
    public List<BeverageModel> getBeveragesByPersonId(String personId) {
        return BeverageConverter.toModelList(beverageDao.getAllByPersonId(personId));
    }
}
