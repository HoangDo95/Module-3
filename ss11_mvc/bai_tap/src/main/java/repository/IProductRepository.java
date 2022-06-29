package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();

    Product findById (int id);

    void create(Product product);

    void edit(int id, Product product);

    List<Product> findByName(String name);

    void delete(int id);
}
