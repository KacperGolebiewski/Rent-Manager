package pl.coderslab.rentmanager.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.rentmanager.exception.NotSuchBillingExistsException;
import pl.coderslab.rentmanager.model.Billing;
import pl.coderslab.rentmanager.model.CurrentUser;
import pl.coderslab.rentmanager.model.User;
import pl.coderslab.rentmanager.repository.BillingRepository;
import pl.coderslab.rentmanager.repository.TenantRepository;
import pl.coderslab.rentmanager.service.EmailSenderService;

import javax.validation.Valid;
import java.time.LocalDate;

@Controller
@RequestMapping("/billing")
public class BillingController {

    private final EmailSenderService  emailSenderService;
    private final BillingRepository  billingRepository;
    private final TenantRepository  tenantRepository;

    public BillingController(EmailSenderService emailSenderService, BillingRepository billingRepository, TenantRepository tenantRepository) {
        this.emailSenderService = emailSenderService;
        this.billingRepository = billingRepository;
        this.tenantRepository = tenantRepository;
    }


    @GetMapping("/add")
    public String addBilling(@AuthenticationPrincipal CurrentUser customUser,Model model) {
        User user = customUser.getUser();
        model.addAttribute("billing", new Billing());
        model.addAttribute("tenants", tenantRepository.findAllByUserId(user.getId()));
        return "billing/add";
    }

    @PostMapping("/add")
    public String saveBilling(@AuthenticationPrincipal CurrentUser customUser, Model model, @Valid Billing billing, BindingResult result) {
        User user = customUser.getUser();
        if(result.hasErrors()) {
            model.addAttribute("tenants", tenantRepository.findAllByUserId(user.getId()));
            return "/billing/add";
        }
        billing.setUser(user);
        billingRepository.save(billing);
        return "redirect:/user/billing";
    }

    @GetMapping("/edit/{id}")
    public String editBilling(@AuthenticationPrincipal CurrentUser customUser, @PathVariable long id, Model model) {
        User user = customUser.getUser();
        if(billingRepository.findById(id).isEmpty()) {
            throw new NotSuchBillingExistsException("Billing with such an id doe not exist!!");
        }
        model.addAttribute("billing", billingRepository.findById(id));
        model.addAttribute("tenants", tenantRepository.findAllByUserId(user.getId()));
        return "billing/edit";
    }

    @PostMapping("/edit/{id}")
    public String saveEditedBilling(@AuthenticationPrincipal CurrentUser customUser, Model model, @Valid Billing billing, BindingResult result) {
        User user = customUser.getUser();
        if(result.hasErrors()) {
            model.addAttribute("tenants", tenantRepository.findAllByUserId(user.getId()));
            return "/billing/edit";
        }
        billing.setUser(user);
        billingRepository.save(billing);
        return "redirect:/user/billing";
    }
    @GetMapping("/sendEmail/{id}")
    public String sendEmail (@AuthenticationPrincipal CurrentUser customUser,@PathVariable long id, Model model) {
        User user = customUser.getUser();
        Billing billing = billingRepository.findById(id).orElseThrow(()-> new NotSuchBillingExistsException("Billing with such an id doe not exist!!"));
        emailSenderService.sendSimpleEmail(
                user.getEmail(),
                billing.getTenant().getEmail(),
                "This is a gentle reminder about your outstanding payments : \n"+
                        "Billing Start Date : " +
                        billing.getBillingStart() + "\n" +
                        "Billing End Date : " +
                        billing.getBillingEnd() +"\n" +
                        "Rent value : " + billing.getRent() +"\n" +
                        "Payment due : " + LocalDate.now().plusWeeks(1).toString(),
                "Billing for : " + billing.getTenant().getFirstName() +
                        " for property : " + billing.getTenant().getProperty().getAddress()
                );
        return "redirect:/user/billing";
    }

}
