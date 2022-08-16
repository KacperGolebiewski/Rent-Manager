package pl.coderslab.rentmanager.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.rentmanager.exception.NotSuchPropertyExistsException;
import pl.coderslab.rentmanager.exception.NotSuchTenantExistsException;
import pl.coderslab.rentmanager.model.CurrentUser;
import pl.coderslab.rentmanager.model.Tenant;
import pl.coderslab.rentmanager.model.User;
import pl.coderslab.rentmanager.repository.PropertyRepository;
import pl.coderslab.rentmanager.repository.TenantRepository;

import javax.validation.Valid;

@Controller
@RequestMapping("/tenant")
public class TenantController {


    private final TenantRepository tenantRepository;
    private final PropertyRepository  propertyRepository;

    public TenantController(TenantRepository tenantRepository, PropertyRepository propertyRepository) {
        this.tenantRepository = tenantRepository;
        this.propertyRepository = propertyRepository;
    }


    @GetMapping("/add")
    public String addTenant(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        User user = customUser.getUser();
        model.addAttribute("tenant", new Tenant());
        model.addAttribute("properties", propertyRepository.findAllByUserId(user.getId()));
        return "tenant/add";
    }

    @PostMapping("/add")
    public String saveTenant(@AuthenticationPrincipal CurrentUser customUser, Model model, @Valid Tenant tenant, BindingResult result) {
        if (result.hasErrors()) {
            return "/tenant/add";
        }
        User user = customUser.getUser();
        tenant.setUser(user);
        tenantRepository.save(tenant);
        return "redirect:/user/tenant";
    }

    @GetMapping("/edit/{id}")
    public String editTenant(@PathVariable long id, Model model) {
        if(tenantRepository.findById(id).isEmpty()) {
            throw new NotSuchTenantExistsException("Tenant with such id does not exist!!");
        }
        model.addAttribute("properties", propertyRepository.findAll());
        model.addAttribute("tenant", tenantRepository.findById(id));
        return "tenant/edit";
    }

    @PostMapping("/edit/{id}")
    public String saveEditedTenant(@AuthenticationPrincipal CurrentUser customUser, Model model, @Valid Tenant tenant, BindingResult result) {
        if (result.hasErrors()) {
            model.addAttribute("property", propertyRepository.findAll());
            model.addAttribute("tenants", tenantRepository.findAll());

            return "tenant/edit";
        }
        User user = customUser.getUser();
        tenant.setUser(user);
        tenantRepository.save(tenant);
        return "redirect:/user/tenant";
    }

    @GetMapping("/confirm-delete/{id}")
    public String confirmDeleteTenant(@PathVariable long id, Model model) {
        model.addAttribute("tenant", tenantRepository.findById(id).orElseThrow(()-> new NotSuchTenantExistsException("Tenant with such id does not exist!!")));
        model.addAttribute("id", id);
        return "tenant/delete";
    }

    @GetMapping("/delete/{id}")
    public String deleteTenant(@PathVariable long id) {
        Tenant tenant = tenantRepository.findById(id).orElseThrow(()-> new NotSuchTenantExistsException("Tenant with such id does not exist!!"));
        tenant.setProperty(null);
        tenantRepository.save(tenant);
        return "redirect:/user/tenant";
    }


}
