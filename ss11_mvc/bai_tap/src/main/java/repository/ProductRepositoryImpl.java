package repository;

import model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements IProductRepository {
    static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "Iphone X", 100, 10, "Apple"));
        productList.add(new Product(2, "S22 Ultra", 110, 20, "Samsung"));
        productList.add(new Product(3, "Mi 10", 120, 30, "Xiaomi"));
        productList.add(new Product(4, "Iphone 11", 140, 40, "Apple"));
        productList.add(new Product(5, "Iphone 12", 150, 50, "Apple"));
    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public Product findById(int id) {
        return productList.get(id - 1);
    }

    @Override
    public void create(Product product) {
        productList.add(product);
    }

    @Override
    public void edit(int id, Product product) {
        productList.set(id - 1, product);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> searchList = new ArrayList<>();
        for (Product item : productList) {
            if (item.getName().contains(name)) {
                searchList.add(item);
            }
        }
        return searchList;
    }

    @Override
    public void delete(int id) {
        productList.remove(id - 1);
    }
}
