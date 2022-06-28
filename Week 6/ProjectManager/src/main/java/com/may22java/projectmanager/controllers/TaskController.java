package com.may22java.projectmanager.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.may22java.projectmanager.models.Project;
import com.may22java.projectmanager.models.Task;
import com.may22java.projectmanager.models.User;
import com.may22java.projectmanager.services.ProjectService;
import com.may22java.projectmanager.services.TaskService;
import com.may22java.projectmanager.services.UserService;

@Controller
public class TaskController {
	@Autowired
	private TaskService taskService;
	@Autowired
	private ProjectService projectService;
	@Autowired
	private UserService userService;
	
	@GetMapping("/project/{id}/tasks")
	public String projectTasks(@PathVariable("id")Long id, @ModelAttribute("projectTask")Task task, Model model) {
		Project project = projectService.findById(id);
		model.addAttribute("project", project);
		model.addAttribute("tasks", taskService.projectTasks(id));
		return "tasks.jsp";
	}
	
	@PostMapping("/task/{id}/new")
	public String addTask(@PathVariable("id")Long id, 
			@Valid @ModelAttribute("projectTask")Task task, 
			BindingResult result, Model model, 
			HttpSession session) {
		if(session.getAttribute("loggedInUser") == null) {
			return "redirect:/logout";
		}
		User user = (User) session.getAttribute("loggedInUser");
		Long userId = user.getId();
		
		Project project = projectService.findById(id);
		
		if(result.hasErrors()) {
			model.addAttribute("project", project);
			model.addAttribute("tasks", taskService.projectTasks(id));
			return "tasks.jsp";
		}else {
			Task newTask = new Task(task.getTask());
			newTask.setProject(project);
			newTask.setUser(userService.findById(userId));
			taskService.createTask(newTask);
			return "redirect:/project/" + id + "/tasks";
		}
		
	}
	

}
