package pl.coderslab.rentmanager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.rentmanager.model.Role;
import pl.coderslab.rentmanager.model.User;
import pl.coderslab.rentmanager.repository.UserRepository;
import pl.coderslab.rentmanager.service.UserServiceImpl;

import javax.validation.Valid;
import java.util.HashSet;
import java.util.Set;

@Controller
public class HomeController {

    private final UserRepository userRepository;
    private final UserServiceImpl  userServiceImpl;

    public HomeController(UserRepository userRepository, UserServiceImpl userServiceImpl) {
        this.userRepository = userRepository;
        this.userServiceImpl = userServiceImpl;
    }

    @GetMapping("/")
    public String start(Model model) {
        model.addAttribute("user", new User());
        return "home/sign-up";
    }

    @PostMapping("/")
    public String createUser(Model model, @Valid User user, BindingResult result) {
        if(result.hasErrors()) {
            return "home/sign-up";
        }
        userServiceImpl.saveUser(user);
        return "redirect:/login";
    }

}
