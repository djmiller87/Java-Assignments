package com.may22java.projectmanager.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.may22java.projectmanager.models.Task;
import com.may22java.projectmanager.repositories.TaskRepository;

@Service
public class TaskService {
	private final TaskRepository taskRepository;
	
	public TaskService(TaskRepository taskRepository) {
		this.taskRepository = taskRepository;
	}
	
	public Task createTask(Task task) {
		return taskRepository.save(task);
	}
	
	public List<Task> findAll(){
		return taskRepository.findAll();
	}
	
	public List<Task> projectTasks(Long id){
		return taskRepository.findByProjectIdIs(id);
	}
	
	public Task updateTask(Task task) {
		return taskRepository.save(task);
	}
	
	public void deleteTask(Long id) {
		taskRepository.deleteById(id);
	}
}
