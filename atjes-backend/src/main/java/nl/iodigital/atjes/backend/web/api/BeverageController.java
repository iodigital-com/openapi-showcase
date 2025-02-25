package nl.iodigital.atjes.backend.web.api;

import java.util.List;

import org.springframework.http.ResponseEntity;

import nl.iodigital.atjes.backend.logic.service.BeverageService;
import nl.iodigital.atjes.backend.models.BeverageModel;

public class BeverageController implements nl.iodigital.atjes.backend.controllers.BeverageController {
    BeverageService beverageService;

    public BeverageController(BeverageService beverageService) {
        this.beverageService = beverageService;
    }

    @Override
    public ResponseEntity<List<BeverageModel>> getBeverages() {
        return ResponseEntity.ok(beverageService.getBeverages());
    }

    @Override
    public ResponseEntity<List<BeverageModel>> getBeveragesOfUser(String id) {
        return ResponseEntity.ok(beverageService.getBeveragesByPersonId(id));
    }

    @Override
    public ResponseEntity<Void> registerBeverage(BeverageModel beverageModel) {
        beverageService.registerBeverage(beverageModel);
        return ResponseEntity.ok(null);
    }
}
