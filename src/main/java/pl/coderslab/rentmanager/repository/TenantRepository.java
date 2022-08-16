package pl.coderslab.rentmanager.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.rentmanager.exception.NotSuchPropertyExistsException;
import pl.coderslab.rentmanager.model.Property;
import pl.coderslab.rentmanager.model.Tenant;

import java.util.List;

public interface TenantRepository extends JpaRepository <Tenant, Long> {


        List<Tenant> findAllByUserId(Long id);
        Tenant findByPropertyId(Long id);

}
