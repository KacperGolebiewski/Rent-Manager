package pl.coderslab.rentmanager.model;

import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Billing {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    private Tenant tenant;
    private double rent;
    @NotBlank
    private String status;
    @NotNull
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate billingStart;
    @NotNull
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate billingEnd;
    @ManyToOne
    private User user;



    @Column(name = "created")
    private LocalDateTime created;
    @Column(name = "updated")
    private LocalDateTime updated;

    @PrePersist
    public void prePersist() {
        created = LocalDateTime.now();
    }

    @PreUpdate
    public void preUpdate() {
        updated = LocalDateTime.now();
    }


}
