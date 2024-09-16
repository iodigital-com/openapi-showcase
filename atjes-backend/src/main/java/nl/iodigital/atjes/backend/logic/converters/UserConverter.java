package nl.iodigital.atjes.backend.logic.converters;

import nl.iodigital.atjes.backend.domain.User;
import nl.iodigital.atjes.backend.models.UserModel;

public class UserConverter {
    public static User toEntity(UserModel model) {
        return new User(model.getId(), model.getName());
    }

    public static UserModel toModel(User entity) {
        return entity != null ? new UserModel(entity.id(), entity.name()) : null;
    }
}
