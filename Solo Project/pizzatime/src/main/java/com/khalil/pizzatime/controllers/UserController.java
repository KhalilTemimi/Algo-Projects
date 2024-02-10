package com.khalil.pizzatime.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.khalil.pizzatime.models.LoginUser;
import com.khalil.pizzatime.models.User;
import com.khalil.pizzatime.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {
	 @Autowired
     private UserService userServ;
    
    @GetMapping("/")
    public String index(Model model) {
    
        // Bind empty User and LoginUser objects to the JSP
        // to capture the form input
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "login.jsp";
    }
    
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        
       userServ.register(newUser, result);
        if(result.hasErrors()) {
            // Be sure to send in the empty LoginUser before 
            // re-rendering the page.
            model.addAttribute("newLogin", new LoginUser());
            return "login.jsp";
        }
        
        // No errors! 
        // TO-DO Later: Store their ID from the DB in session, 
        // in other words, log them in.
        session.setAttribute("userId", newUser.getId());
        return "redirect:/home";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        
        User user = userServ.login(newLogin, result);
    
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "login2.jsp";
        }
    
        // No errors! 
        // TO-DO Later: Store their ID from the DB in session, 
        // in other words, log them in.
        session.setAttribute("userId", user.getId());
        return "redirect:/home";
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }
    
    @GetMapping("/edit")
	public String updateUser(Model model, HttpSession session) {
		// Route Gard
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		} else {
				User user = userServ.findById(userId);
				model.addAttribute("user", user);
				return "edit_user.jsp";				
			}
		}
	

	@PutMapping("/users")
	public String updateUser(Model model,
			@Valid @ModelAttribute("user") User user, BindingResult result,
			HttpSession session) {
		// Route Gard
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		}else {
			if (result.hasErrors()) {
				return "edit_user.jsp";
			} else {
					User loggedInUser = userServ.findById(userId);
					loggedInUser.setFirstName(user.getFirstName());
					loggedInUser.setLastName(user.getLastName());
					loggedInUser.setAdress(user.getAdress());
					loggedInUser.setEmail(user.getEmail());
					loggedInUser.setPassword(user.getPassword());
					loggedInUser.setConfirmPassword(user.getConfirmPassword());
					
					// update the favorite Pizza from the value in check boxes
					// code here
				
					loggedInUser.setPastOrders(user.getPastOrders());
					userServ.updateUser(loggedInUser);
					
					return "redirect:/home";				
				}
			}			
		}
	}
