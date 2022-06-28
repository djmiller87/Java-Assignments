package com.may22java.projectmanager.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

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

import com.may22java.projectmanager.models.Project;
import com.may22java.projectmanager.models.User;
import com.may22java.projectmanager.services.ProjectService;
import com.may22java.projectmanager.services.UserService;

@Controller
public class ProjectController {
	@Autowired
	private ProjectService projectService;
	@Autowired
	private UserService userService;
	
	
	@GetMapping("/projects/new")
	public String newProject(@ModelAttribute("project")Project project, HttpSession session) {
		return "newProject.jsp";
	}
	
	@PostMapping("/projects/new")
	public String createProject(@Valid @ModelAttribute("project")Project project, BindingResult result, HttpSession session) {
		if(result.hasErrors()) {
			return "newProject.jsp";
		}
		else {
			User user = (User) session.getAttribute("loggedInUser");
			Long id = user.getId();
			User thisUser = userService.findById(id);
			projectService.createProject(project);
			thisUser.getProjects().add(project);
			userService.updateUser(thisUser);
			return "redirect:/dashboard";	
		}
	}
	
	@GetMapping("/project/{id}/show")
	public String showProject(@PathVariable("id")Long id, Model model) {
		Project project = projectService.findById(id);
		model.addAttribute("project", project);
		return "showProject.jsp";
	}
	
	@GetMapping("/project/{id}/edit")
	public String editProject(@PathVariable("id")Long id, Model model) {
		Project project = projectService.findById(id);
		model.addAttribute("project", project);
		return "editProject.jsp";
	}
	
	@PutMapping("/project/{id}/update")
	public String updateProject(@PathVariable("id")Long id, @Valid @ModelAttribute("project")Project project, BindingResult result, HttpSession session) {
		if(result.hasErrors()) {
			return "editProject.jsp";
		}
		User user = (User) session.getAttribute("loggedInUser");
		Long userId = user.getId();
		User thisUser = userService.findById(userId);
		Project thisProject = projectService.findById(id);
		project.setUsers(thisProject.getUsers());
		project.setLead(thisUser);
		projectService.updateProject(project);
		return "redirect:/dashboard";
	}
	
	@GetMapping("/join/{id}/team")
	public String joinProject(@PathVariable("id")Long id, Model model, HttpSession session) {
		User thisUser = (User) session.getAttribute("loggedInUser");
		Long userId = thisUser.getId();
		User user = userService.findById(userId);		
		Project project = projectService.findById(id);
		user.getProjects().add(project);
		userService.updateUser(user);
		model.addAttribute("user", user);		
		model.addAttribute("unassignedProjects", projectService.getUnassignedUsers(user));		
		model.addAttribute("assignedProjects", projectService.getAssignedUsers(user));		
		return "redirect:/dashboard";
	}
	
	@GetMapping("/leave/{id}/team")
	public String leaveProject(@PathVariable("id")Long id, Model model, HttpSession session) {
		User thisUser = (User) session.getAttribute("loggedInUser");
		Long userId = thisUser.getId();
		User user = userService.findById(userId);		
		Project project = projectService.findById(id);
		user.getProjects().remove(project);
		userService.updateUser(user);
		model.addAttribute("user", user);
		List<Project> unassignedProjects = projectService.getUnassignedUsers(user);
		model.addAttribute("unassignedProjects", unassignedProjects);
		List<Project> assignedProjects = projectService.getAssignedUsers(user);
		model.addAttribute("assignedProjects", assignedProjects);
		return "redirect:/dashboard";
	}
	
	
	
	@DeleteMapping("/project/{id}/delete")
	public String deleteProject(@PathVariable("id")Long id) {
		projectService.deleteProject(id);
		return "redirect:/dashboard";
	}
	
	
}
