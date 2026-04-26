package First.web.controllers;

import First.web.models.Image;
import First.web.models.Product;
import First.web.models.User;
import First.web.services.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.Base64;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequiredArgsConstructor
public class ProductController {
    private final ProductService productService;


    @GetMapping("/")
    public  String products(@RequestParam(name = "searchWord", required = false) String title, Principal principal, Model model){
        model.addAttribute("products",productService.listProducts(title));
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        model.addAttribute("searchWord", title);
        return "products";
    }



    @GetMapping("/product/{id}")
    public String productInfo(@PathVariable Long id, Model model, Principal principal) {
        Product product = productService.getProductById(id);
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        model.addAttribute("product", product);
        model.addAttribute("images", product.getImages());
        model.addAttribute("authorProduct", product.getUser());
        return "product-info";
    }


    @GetMapping("/my/products") // ← новый маршрут
    public String myProducts(Model model, Principal principal) {
        User user = productService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("products", user.getProducts());
        return "my-products";
    }

//    @GetMapping("/product/{id}") //старая версия
//    public String productInfo(@PathVariable Long id, Model model){
//        Product product = productService.getProductById(id);
//        model.addAttribute("product",product);
//
//        List<String> strA = product.getImages().stream().map(s ->{
//            return Base64.getEncoder().encodeToString(s.getBytes());
//        }).collect(Collectors.toList());
//        model.addAttribute("images", strA);
//
//        //model.addAttribute("images",product.getImages());
//        return "product-info";
//    }

    @PostMapping("/product/create")
    public String createProduct(@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2,
                                @RequestParam("file3") MultipartFile file3, Product product, Principal principal) throws IOException {
        productService.saveProduct(principal, product, file1, file2, file3);
        return "redirect:/my/products";
    }
    @PostMapping("/product/delete/{id}")
    public String deleteProduct(@PathVariable Long id){
        productService.deleteProduct(id);
        return "redirect:/my/products";
    }

//    @GetMapping("/images/{id}") //старая версия
//    public ResponseEntity<?> getImage(@PathVariable Long id) {
//        Image image = productService.getImageById(id);
//        return ResponseEntity.ok()
//                .header("Content-Type", image.getContentType())
//                .body(image.getBytes());
//    }

    @GetMapping("/images/{id}")
    public ResponseEntity<byte[]> getImage(@PathVariable Long id) {
        return productService.getImageResponse(id);
    }
}
