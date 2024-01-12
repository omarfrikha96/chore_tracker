package com.chore_tracker.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.chore_tracker.models.LoginUser;
import com.chore_tracker.models.User;
import com.chore_tracker.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class LoginController {
	// Add once service is implemented:
	 @Autowired
	 private UserService userService;
	 

		@GetMapping("/")
		public String index(Model model) {
		    model.addAttribute("newUser", new User());
		    model.addAttribute("newLogin", new LoginUser());
		    return "index.jsp";
		}
		
		@PostMapping("/register")
		public String register(@Valid @ModelAttribute("newUser") User newUser, 
				BindingResult result, Model model, HttpSession session) {

		    User user = userService.register(newUser, result);
		     
		    if(result.hasErrors()) {
		        model.addAttribute("newLogin", new LoginUser());
		        return "index.jsp";
		    }
		    session.setAttribute("userId", user.getId());
		 
		    return "redirect:/dashboard";
		}
		
		@PostMapping("/login")
		public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
				BindingResult result, Model model, HttpSession session) {
		     
			User user = userService.login(newLogin, result);
		 
		    if(result.hasErrors() || user==null) {
		        model.addAttribute("newUser", new User());
		        return "index.jsp";
		    }
		     
		    session.setAttribute("userId", user.getId());
		 
		    return "redirect:/dashboard";
		}
		
		@GetMapping("/dashboard")
		public String dashboard(HttpSession session, Model model) {
		 
			if(session.getAttribute("userId") == null) {
				return "redirect:/logout";
			}
			Long userId = (Long) session.getAttribute("userId");
			User user = userService.findById(userId);
			
			model.addAttribute("user", user);			 
			return "dashboard.jsp";
		}
		

		@GetMapping("/logout")
		public String logout(HttpSession session) {
			session.setAttribute("userId", null); 
		    return "redirect:/";
		}

}
