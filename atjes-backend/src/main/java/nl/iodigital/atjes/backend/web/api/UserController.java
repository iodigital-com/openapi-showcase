package nl.iodigital.atjes.backend.web.api;

import org.springframework.http.ResponseEntity;

import nl.iodigital.atjes.backend.logic.service.UserService;
import nl.iodigital.atjes.backend.models.UserModel;

public class UserController implements nl.iodigital.atjes.backend.controllers.UserController {
    UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @Override
    public ResponseEntity<UserModel> getUser(String id) {
        return ResponseEntity.ok(userService.getUser(id));
    }

    @Override
    public ResponseEntity<Void> registerUser(UserModel userDto) {
        userService.registerUser(userDto);
        return ResponseEntity.ok(null);
    }
}
