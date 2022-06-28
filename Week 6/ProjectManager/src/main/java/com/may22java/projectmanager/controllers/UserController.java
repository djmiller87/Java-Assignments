package com.may22java.projectmanager.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.may22java.projectmanager.models.LoginUser;
import com.may22java.projectmanager.models.Project;
import com.may22java.projectmanager.models.User;
import com.may22java.projectmanager.services.ProjectService;
import com.may22java.projectmanager.services.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private ProjectService projectService;
	
	@GetMapping("/")
	public String index(
			@ModelAttribute("newUser")User user,
			@ModelAttribute("newLogin")LoginUser loginUser) {
		return "index.jsp";
	}
	
	@PostMapping("/register")
	public String registerUser(
			@Valid @ModelAttribute("newUser")User user,
			BindingResult result,
			@ModelAttribute("newLogin")LoginUser loginUser,
			HttpSession session) {
		userService.validateUser(user, result);
		if(result.hasErrors()) {
			return "index.jsp";
		}
		userService.createUser(user);
		session.setAttribute("loggedInUser", user);
		return "redirect:/dashboard";
	}
	
	@PostMapping("/login")
	public String login(
			@Valid @ModelAttribute("newLogin")LoginUser loginUser, 
			BindingResult result, 
			HttpSession session, 
			@ModelAttribute("newUser")User user) {
		userService.authenticateUser(loginUser, result);
		if(result.hasErrors()) {
			return "index.jsp";
		}
		User loggedInUser = userService.findByEmail(loginUser.getEmail());
		session.setAttribute("loggedInUser", loggedInUser);
		return "redirect:/dashboard";
	}
	
	@GetMapping("/dashboard")	
	public String dashboard(Model model, HttpSession session) {
		if(session.getAttribute("loggedInUser") != null) {
			User loggedIn = (User) session.getAttribute("loggedInUser");
			Long id = loggedIn.getId();
			User user = userService.findUser(id);
			model.addAttribute("user", user);
			List<Project> unassignedProjects = projectService.getUnassignedUsers(user);
			model.addAttribute("unassignedProjects", unassignedProjects);
			List<Project> assignedProjects = projectService.getAssignedUsers(userService.findById(id));
			model.addAttribute("assignedProjects", assignedProjects);		
			return "dashboard.jsp";
		}
		else {
			return "redirect:/";
		}
	}	
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

}
