package First.web.services;

import First.web.models.Product;
import org.jspecify.annotations.Nullable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProductService {
    private List<Product> products = new ArrayList<>();
    private long ID = 0;
    {
        products.add(new Product(++ID,"PlayStation 5","Simple description",67000,"Moskow","vova"));
        products.add(new Product(++ID,"Iphone 5","Simple description",24000,"Saratov","roma"));
    }

    public List<Product> listProducts() {return products;}

    public void saveProduct(Product product){
        product.setId(++ID);
        products.add(product);
    }

    public void deleteProduct(Long id){
            products.removeIf(product -> product.getId().equals(id));
    }

    public Product getProductById(Long id) {
        for(Product product : products){
            if (product.getId().equals(id)) return product;
        }
        return null;
    }
}
