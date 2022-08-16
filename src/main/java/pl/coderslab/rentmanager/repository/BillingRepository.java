package pl.coderslab.rentmanager.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.rentmanager.model.Billing;
import pl.coderslab.rentmanager.model.Property;
import pl.coderslab.rentmanager.model.Tenant;

import java.util.List;

public interface BillingRepository extends JpaRepository<Billing, Long> {

    @Query(nativeQuery = true, value="select * from billing where user_id=?1 order by updated desc")
    List<Billing>  findByCreatedDesc(Long id);

    @Query(nativeQuery = true, value="select * from billing where user_id=?1 order by updated desc")
    List<Billing>  findByUpdatedDesc(Long id);

    List<Billing>  findAllByUserId(Long id);


}
