package pl.coderslab.rentmanager.repository;

import org.hibernate.query.NativeQuery;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.rentmanager.model.Billing;
import pl.coderslab.rentmanager.model.Property;
import pl.coderslab.rentmanager.model.Tenant;

import javax.transaction.Transactional;
import java.awt.print.Book;
import java.util.List;

public interface PropertyRepository extends JpaRepository <Property, Long>{

    List<Property>  findAllByUserId(Long id);
}
