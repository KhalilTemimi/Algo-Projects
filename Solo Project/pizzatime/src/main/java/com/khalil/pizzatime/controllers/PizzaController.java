package com.khalil.pizzatime.controllers;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.khalil.pizzatime.models.Pizza;
import com.khalil.pizzatime.models.User;
import com.khalil.pizzatime.services.PizzaService;
import com.khalil.pizzatime.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class PizzaController {

	@Autowired
	PizzaService pizzaServ;

	@Autowired
	UserService userServ;

	@GetMapping("/home")
	public String home(Model model, HttpSession session) {
		// Route Gard
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		}
		User user = userServ.findById(userId);
		model.addAttribute("user", user);

		List<Pizza> pizza = pizzaServ.allPizzas();
		model.addAttribute("pizza", pizza);
		return "home.jsp";
	}

	@GetMapping("/pizzas/new")
	public String newPizza(@ModelAttribute("pizza") Pizza pizza, HttpSession session) {

		// Route Gard
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		} else {

			return "new_pizza.jsp";
		}
	}

	@PostMapping("/pizzas")
	public String create(Model model,@Valid @ModelAttribute("pizza") Pizza pizza, BindingResult result,
			HttpSession session) {

		// Route Gard
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		} else {
			if (result.hasErrors()) {
				return "new_pizza.jsp";
			} else {

				Long UserId = (Long) session.getAttribute("userId");
				User loggedInUser = userServ.findById(UserId);
				pizza.setUser(loggedInUser);
				
				double price = 5;
				if (pizza.getSize()=="Small") {
					price+=1;
				}else if(pizza.getSize()=="Medium") {
					price+=3;
				}else if (pizza.getSize()=="Large"){
					price+=5;
				}
				if (pizza.getTopping().contains("Pepperoni")) {
					price+=2.7;
				}else if (pizza.getTopping().contains("Onion")) {
					price+=1.6;
				}else if (pizza.getTopping().contains("Cheese")) {
					price+=1.8;
				}else if (pizza.getTopping().contains("Bacon")) {
					price+=2.2;
				}else if (pizza.getTopping().contains("Olive")) {
					price+=0.7;
				}else if (pizza.getTopping().contains("Mushroom")) {
					price+=1.6;
				}
				price = price*pizza.getQuantity();
				pizza.setPrice(price);
				pizzaServ.createPizza(pizza);

				return "redirect:/home";
			}
		}
	}
	
	@PostMapping("/pizzaRandom")
	public String createRandomPizza(HttpSession session,Model model,@Valid @ModelAttribute("pizza") Pizza randomPizza,BindingResult result) {

		// Route Gard
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		} else {
				Long UserId = (Long) session.getAttribute("userId");
				User loggedInUser = userServ.findById(UserId);
				
				Random rand = new Random();
				List<String> method = Arrays.asList("CarryOut","OnTable");
				List<String> size = Arrays.asList("Small","Large","Medium");
				List<String> crust = Arrays.asList("ThinCrust","HandToasted","StuffedCrust");
				List<String> topping = Arrays.asList("Pepperoni","Onion","Cheese","Bacon","Olive","Mushroom");
				
				randomPizza.setUser(loggedInUser);
				int randomIndex1 = rand.nextInt(method.size());
				randomPizza.setMethod(method.get(randomIndex1));
				
				int randomIndex2 = rand.nextInt(size.size());
				randomPizza.setSize(size.get(randomIndex2));
			
				int randomIndex3 = rand.nextInt(crust.size());
				randomPizza.setCrust(crust.get(randomIndex3));
				
				int randomIndex4 = rand.nextInt(topping.size());
				randomPizza.setTopping(topping.get(randomIndex4));
				
				randomPizza.setQuantity(1);
				
				double price = 5;
				if (randomPizza.getSize()=="Small") {
					price+=1;
				}else if(randomPizza.getSize()=="Medium") {
					price+=3;
				}else if (randomPizza.getSize()=="Large"){
					price+=5;
				}
				if (randomPizza.getTopping().contains("Pepperoni")) {
					price+=2.7;
				}else if (randomPizza.getTopping().contains("Onion")) {
					price+=1.6;
				}else if (randomPizza.getTopping().contains("Cheese")) {
					price+=1.8;
				}else if (randomPizza.getTopping().contains("Bacon")) {
					price+=2.2;
				}else if (randomPizza.getTopping().contains("Olive")) {
					price+=0.7;
				}else if (randomPizza.getTopping().contains("Mushroom")) {
					price+=1.6;
				}
				price = price*randomPizza.getQuantity();
				randomPizza.setPrice(price);
				pizzaServ.createPizza(randomPizza);

				return "redirect:/home";
		
		}
	}

	@GetMapping("/order")
	public String show(Model model, HttpSession session) {

		// Route Gard
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		} else {
			User user = userServ.findById(userId);
			model.addAttribute("user", user);

			List<Pizza> orders = pizzaServ.allPizzas();
			model.addAttribute("orders", orders);

			return "show_order.jsp";
		}
	}
	
	@GetMapping("/purchase/{pizzaId}")
	public String purchase(Model model, HttpSession session, @PathVariable("pizzaId") Long pizzaId) {
		// Route Gard
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		} else {
			User user = userServ.findById(userId);
			model.addAttribute("user", user);
			Pizza purchasedPizza = pizzaServ.findPizza(pizzaId);
			purchasedPizza.setBuyer(user);
			purchasedPizza.setUser(null);
			pizzaServ.updatePizza(purchasedPizza);
			
			return "redirect:/home";
		} 
	}

	
}
