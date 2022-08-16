package pl.coderslab.rentmanager.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.rentmanager.model.CurrentUser;
import pl.coderslab.rentmanager.model.User;
import pl.coderslab.rentmanager.repository.BillingRepository;
import pl.coderslab.rentmanager.repository.PropertyRepository;
import pl.coderslab.rentmanager.repository.TenantRepository;
import pl.coderslab.rentmanager.repository.UserRepository;

import javax.validation.Valid;

@Slf4j
@Controller
@RequestMapping("/user")
public class UserController {


    private final PropertyRepository propertyRepository;
    private final TenantRepository  tenantRepository;
    private final BillingRepository  billingRepository;
    private final UserRepository  userRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    public UserController(PropertyRepository propertyRepository, TenantRepository tenantRepository, BillingRepository billingRepository, UserRepository userRepository, BCryptPasswordEncoder passwordEncoder) {
        this.propertyRepository = propertyRepository;
        this.tenantRepository = tenantRepository;
        this.billingRepository = billingRepository;
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }


    @GetMapping("/property")
    public String showProperties(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        User user = customUser.getUser();
        model.addAttribute("tenants", tenantRepository.findAllByUserId(user.getId()));
        model.addAttribute("properties", propertyRepository.findAllByUserId(user.getId()));
        return "property/table";
    }

    @GetMapping("/tenant")
    public String showTenants(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        User user = customUser.getUser();
        model.addAttribute("properties", propertyRepository.findAllByUserId(user.getId()));
        model.addAttribute("tenants", tenantRepository.findAllByUserId(user.getId()));
        return "tenant/table";
    }


    @GetMapping("/billing")
    public String showBillings(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        User user = customUser.getUser();
        model.addAttribute("tenants", tenantRepository.findAllByUserId(user.getId()));
        if(billingRepository.findAllByUserId(user.getId()).stream().allMatch(billing -> billing.getUpdated()==null)){
            model.addAttribute("billings", billingRepository.findByCreatedDesc(user.getId()));
        }else {
            model.addAttribute("billings", billingRepository.findByUpdatedDesc(user.getId()));
        }
        return "billing/table";
    }


    @GetMapping("/details")
    public String showProfile(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        User user = customUser.getUser();;
        model.addAttribute("user",userRepository.findByUsername(user.getUsername()));
        return "user/profile";
    }

    @GetMapping("/edit/{id}")
    public String editProfile(@AuthenticationPrincipal CurrentUser customUser, @PathVariable long id, Model model) {
        User user = customUser.getUser();
        model.addAttribute("user",userRepository.findByUsername(user.getUsername()));
        return "user/edit";
    }
    @PostMapping("/edit/{id}")
    public String saveEditedProfile(@AuthenticationPrincipal CurrentUser customUser, Model model, @Valid User user, BindingResult result) {
        User user2 = customUser.getUser();
        user2.setFullName(user.getFullName());
        user2.setUsername(user.getUsername());
        user2.setEmail(user.getEmail());
        user2.setPassword(passwordEncoder.encode(user.getPassword()));
        if (result.hasErrors()) {
            return "user/edit";
        }
        userRepository.save(user2);
        return "redirect:/user/details";
    }
}
