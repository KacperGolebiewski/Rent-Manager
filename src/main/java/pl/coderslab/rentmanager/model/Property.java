package pl.coderslab.rentmanager.model;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.List;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Property {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Size(min = 5)
    private String name;
    @NotBlank
    private String address;
    @NotBlank
    private String town;
    @Size(max = 600)
    private String description;
    private double rent;
    @ManyToOne
    private User user;


}
