package nl.iodigital.atjes.backend.logic.converters;

import java.util.List;
import java.util.stream.Collectors;

import nl.iodigital.atjes.backend.domain.Beverage;
import nl.iodigital.atjes.backend.models.BeverageModel;

public class BeverageConverter {
    public static Beverage toEntity(BeverageModel model) {
        return new Beverage(model.getPersonId(), model.getBeverageName(), model.getQuantity());
    }

    public static BeverageModel toModel(Beverage entity) {
        return entity != null ? new BeverageModel(entity.personId(), entity.beverageName(), entity.quantity()) : null;
    }

    public static List<BeverageModel> toModelList(List<Beverage> models) {
        return models.stream()
                .map(BeverageConverter::toModel)
                .collect(Collectors.toList());
    }
}
