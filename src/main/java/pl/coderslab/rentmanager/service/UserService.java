package pl.coderslab.rentmanager.service;

import pl.coderslab.rentmanager.model.User;

public interface UserService {
    User findByUserName(String name);
    void saveUser(User user);
}