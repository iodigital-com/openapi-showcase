package nl.iodigital.atjes.backend.logic.converters;

import nl.iodigital.atjes.backend.domain.UserEntity;
import nl.iodigital.atjes.backend.models.UserModel;

public class UserConverter {
    public static UserEntity toEntity(UserModel model) {
        return new UserEntity(model.getId(), model.getName());
    }

    public static UserModel toModel(UserEntity entity) {
        return entity != null ? new UserModel(entity.id(), entity.name()) : null;
    }
}
