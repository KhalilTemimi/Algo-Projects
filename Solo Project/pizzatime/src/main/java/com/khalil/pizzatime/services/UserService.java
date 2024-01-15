package com.khalil.pizzatime.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.khalil.pizzatime.models.LoginUser;
import com.khalil.pizzatime.models.User;
import com.khalil.pizzatime.repositories.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepo;

	public User register(User newUser, BindingResult result) {
        
    Optional<User> potentialUser = userRepo.findByEmail(newUser.getEmail());
    // Test if email is already taken
    if(potentialUser.isPresent()) {
    	result.rejectValue("email", "registerError", "Email is taken");
    }
    // Test password and confirmPassword
    if(!newUser.getPassword().equals(newUser.getConfirmPassword())){
    	result.rejectValue("password", "registerError", "passwords must much!");
    }
    if (result.hasErrors()) {
    	return null;    	
    // if no Error hash the password
    }else {
    	String hashedPassword = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
    	newUser.setPassword(hashedPassword);
    	// and save the user to the data base
    	return userRepo.save(newUser);
    	}
    }
	
	 public User findById(Long id) {
	    	Optional<User> potentialUser = userRepo.findById(id);
	    	if(potentialUser.isPresent()) {
	    		return potentialUser.get();
	    	}
	    	return null;
	    }

	public User login(LoginUser newLoginObject, BindingResult result) {
		
		// Test is user exist in database
		Optional<User> potentialUser = userRepo.findByEmail(newLoginObject.getEmail());
		if(!potentialUser.isPresent()) {
			result.rejectValue("email", "loginErrors","Email not found");
		}else {
			User user = potentialUser.get();
			if(!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
				result.rejectValue("password","loginErrors","Invalid password");
			}
			if (result.hasErrors()) {
				return null;
			}else {
				return user;
			}
		}
		return null;
	}
//	READ ONE
	public User findUser(Long id) {
		Optional<User> maybeUser = userRepo.findById(id);
		if (maybeUser.isPresent()) {
			return maybeUser.get();
		} else {
			return null;
		}
	}
	
//	UPDATE
	public User updateUser(User u) {
		return userRepo.save(u);
	}
}
