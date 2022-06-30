package service;

import model.User;

import java.util.List;

public interface IUserService {
    List<User> findAll();

    User findById(int id);

    void create(User user);

    void edit(User user);

    List<User> findByCountry(String findCountry);

    List<User> sortByName();

    void delete(int id);

}
