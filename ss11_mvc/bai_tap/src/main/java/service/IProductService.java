package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();

    Product findById(int id);

    void create(Product product);

    void edit( int id, Product product);

    List<Product> findByName(String name);

    void delete(int id);
}
