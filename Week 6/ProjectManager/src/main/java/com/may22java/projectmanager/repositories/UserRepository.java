package com.may22java.projectmanager.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.may22java.projectmanager.models.Project;
import com.may22java.projectmanager.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long>{
	
	List<User> findAll();
	
	User findByEmail(String email);
	
	User findByIdIs(Long id);
	
	List<User> findAllByProjects(Project project);
	
	List<User> findByProjectsNotContains(Project project);

}
