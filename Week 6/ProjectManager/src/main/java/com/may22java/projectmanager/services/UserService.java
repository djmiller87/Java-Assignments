package com.may22java.projectmanager.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;

import com.may22java.projectmanager.models.LoginUser;
import com.may22java.projectmanager.models.Project;
import com.may22java.projectmanager.models.User;
import com.may22java.projectmanager.repositories.UserRepository;

@Service
public class UserService {
	private final UserRepository userRepository;
	
	public UserService(UserRepository userRepository) {
		this.userRepository = userRepository;
	}
	
	public void validateUser(User newUser, Errors errors) {
		if(!newUser.getPassword().equals(newUser.getConfirmPassword())){
			errors.rejectValue("password", "Mismatch", "Passwords do not match!");
		}
		if(userRepository.findByEmail(newUser.getEmail())!=null) {
			errors.rejectValue("email", "notUnique", "Email is already taken!");
		}
		
	}

	public User createUser(User newUser) {
		String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashed);
		userRepository.save(newUser);
		return null;
	}
	
	public boolean authenticateUser(LoginUser newLogin, Errors errors) {
		User user = userRepository.findByEmail(newLogin.getEmail());
		if(user == null) {
			errors.rejectValue("email", "missingEmail", "Email not found!");
			return false;
		}
		else {
			if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
			    errors.rejectValue("password", "Matches", "Invalid Password!");
			    return false;
			}
		return true;
		}
	}
	
	public List<User> findAll(){
		return userRepository.findAll();
	}
	
	public User findUser(Long id) {
		Optional<User> user = userRepository.findById(id);
		if(user.isPresent()) {
			return user.get();
		}
		else {
			return null;
		}
	}
	
	public User findByEmail(User user) {
		return userRepository.findByEmail(user.getEmail());
	}
	
	public User findByEmail(String email) {
		return userRepository.findByEmail(email);
	}
	
	public User findById(Long id) {
		return userRepository.findById(id).orElse(null);
	}
	
	public User updateUser(User user) {
		return userRepository.save(user);
	}
	
	public void deleteUser(Long id) {
		userRepository.deleteById(id);
	}
	
	public List<User> getAssignedProjects(Project project){
		return userRepository.findAllByProjects(project);
	}
	
	public List<User> getUnassignedProjects(Project project){
		return userRepository.findByProjectsNotContains(project);
	}

}
