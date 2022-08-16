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
import pl.coderslab.rentmanager.model.CurrentUser;
import pl.coderslab.rentmanager.model.Property;
import pl.coderslab.rentmanager.model.Tenant;
import pl.coderslab.rentmanager.model.User;
import pl.coderslab.rentmanager.repository.PropertyRepository;
import pl.coderslab.rentmanager.repository.TenantRepository;

import javax.validation.Valid;

@Controller
@RequestMapping("/property")
public class PropertyController {

    private final PropertyRepository propertyRepository;
    private final TenantRepository  tenantRepository;

    public PropertyController(PropertyRepository propertyRepository, TenantRepository tenantRepository) {
        this.propertyRepository = propertyRepository;
        this.tenantRepository = tenantRepository;
    }


    @GetMapping("/add")
    public String addProperty(Model model) {
        model.addAttribute("property", new Property());
        return "property/add";
    }

    @PostMapping("/add")
    public String saveProperty(@AuthenticationPrincipal CurrentUser customUser, Model model, @Valid Property property, BindingResult result) {
        if (result.hasErrors()) {
            return "/property/add";
        }
        User user = customUser.getUser();
        property.setUser(user);
        propertyRepository.save(property);
        return "redirect:/user/property";
    }

    @GetMapping("/edit/{id}")
    public String editProperty(@PathVariable long id, Model model) {
        if(propertyRepository.findById(id).isEmpty()) {
            throw new NotSuchPropertyExistsException("Property with such id does not exist!!");
        }
            model.addAttribute("property", propertyRepository.findById(id));
        return "property/edit";
    }

    @PostMapping("/edit/{id}")
    public String saveEditedProperty(@AuthenticationPrincipal CurrentUser customUser, @PathVariable long id, Model model, @Valid Property property, BindingResult result) {
        if (result.hasErrors()) {
            model.addAttribute("property", propertyRepository.findById(id));
            return "property/edit";
        }
        User user = customUser.getUser();
        property.setUser(user);
        propertyRepository.save(property);
        return "redirect:/user/property";
    }

    @GetMapping("/confirm-delete/{id}")
    public String confirmDeleteProperty(@PathVariable long id, Model model) {
        model.addAttribute("property", propertyRepository.findById(id).orElseThrow(()-> new NotSuchPropertyExistsException("Property with such id does not exist!!")));
        model.addAttribute("id", id);
        return "property/delete";
    }

    @GetMapping("/delete/{id}")
    public String deleteProperty(@PathVariable long id, Model model) {
        Tenant tenant = tenantRepository.findByPropertyId(id);
        if(tenant!=(null)) {
            tenant.setProperty(null);
            propertyRepository.deleteById(id);
        }else{
            throw new NotSuchPropertyExistsException("Property with such id does not exist!!");
        }
        return "redirect:/user/property";
    }

}
