package pl.coderslab.rentmanager.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.coderslab.rentmanager.model.Tenant;

public class TenantConverter implements Converter<String, Tenant> {

    @Autowired
    private TenantRepository tenantRepository;

    @Override
    public Tenant convert(String source) {
        return tenantRepository.findById(Long.parseLong(source)).orElse(null);
    }
}