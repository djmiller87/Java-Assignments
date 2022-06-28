package com.may22java.projectmanager.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.may22java.projectmanager.models.Project;
import com.may22java.projectmanager.models.User;
import com.may22java.projectmanager.repositories.ProjectRepository;

@Service
public class ProjectService {
	private final ProjectRepository projectRepository;
	
	public ProjectService(ProjectRepository projectRepository) {
		this.projectRepository = projectRepository;
	}
	
	public Project createProject(Project project) {
		return projectRepository.save(project);
	}
	
	public List<Project> findAll(){
		return projectRepository.findAll();
	}
	
	public Project findById(Long id) {
		Optional<Project> project = projectRepository.findById(id);
		if(project.isPresent()) {
			return project.get();
		}
		else {
			return null;
		}
	}

		
	public Project updateProject(Project project) {
		return projectRepository.save(project);
	}
		
	public void removeProject(Project project) {
		projectRepository.save(project);
	}
	
	public void deleteProject(Long id) {
		projectRepository.deleteById(id);
	}
	
	public List<Project> getAssignedUsers(User user){
		return projectRepository.findAllByUsers(user);		
	}
	
	public List<Project> getUnassignedUsers(User user){
		return projectRepository.findByUsersNotContains(user);
	}
}
