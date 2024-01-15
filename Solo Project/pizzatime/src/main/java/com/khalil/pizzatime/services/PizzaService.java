package com.khalil.pizzatime.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khalil.pizzatime.models.Pizza;
import com.khalil.pizzatime.repositories.PizzaRepository;

@Service
public class PizzaService {
	
	// C R U D
	
			@Autowired
			private PizzaRepository pizzaRepo;

//			READ ALL
			public List<Pizza> allPizzas() {
				return pizzaRepo.findAll();
			}
			
//			CREATE
			public Pizza createPizza(Pizza b) {
				return pizzaRepo.save(b);
			}

//			READ ONE
			public Pizza findPizza(Long id) {
				Optional<Pizza> maybePizza = pizzaRepo.findById(id);
				if (maybePizza.isPresent()) {
					return maybePizza.get();
				} else {
					return null;
				}
			}

//			UPDATE
			public Pizza updatePizza(Pizza c) {
				return pizzaRepo.save(c);
			}

//			DELETE
			public void deletePizza(Long id) {
				pizzaRepo.deleteById(id);
			}
}
