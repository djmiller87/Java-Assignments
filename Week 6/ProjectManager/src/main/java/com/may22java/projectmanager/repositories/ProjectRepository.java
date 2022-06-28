package com.may22java.projectmanager.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.may22java.projectmanager.models.Project;
import com.may22java.projectmanager.models.User;

@Repository
public interface ProjectRepository extends CrudRepository<Project, Long>{
	List<Project> findAll();
	
	Project findByIdIs(Long id);
	
	List<Project> findAllByUsers(User user);
	
	List<Project> findByUsersNotContains(User user);

}
