package nl.iodigital.atjes.backend.logic.service;

import org.springframework.stereotype.Service;

import nl.iodigital.atjes.backend.logic.converters.UserConverter;
import nl.iodigital.atjes.backend.logic.db.UserDao;
import nl.iodigital.atjes.backend.models.UserModel;

@Service
public class UserService {

    private final UserDao userDao;

    public UserService(UserDao userDao) {
        this.userDao = userDao;
    }

    public void registerUser(UserModel user) {
        userDao.save(UserConverter.toEntity(user));
    }

    public UserModel getUser(String userId) {
        return UserConverter.toModel(userDao.findById(userId).orElse(null));
    }
}
