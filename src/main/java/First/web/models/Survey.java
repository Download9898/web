package First.web.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "survey")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Survey {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    @Column(name = "price")
    private Long price;
    @Column(name = "category")
    private String category;
    @Column(name = "nameUser")
    private String nameUser;
    @Column(name = "phoneUser")
    private String phoneUser;
    @Column(name = "dateOfCreated")
    private LocalDateTime dateOfCreated;
    @Column(name = "emailUser")
    private String emailUser;
    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    private User user;

    @PrePersist
    private void init(){
        dateOfCreated = LocalDateTime.now();
    }

}
