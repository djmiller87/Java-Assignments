package com.may22java.dojosandninjas.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.may22java.dojosandninjas.models.Dojo;
import com.may22java.dojosandninjas.models.Ninja;
import com.may22java.dojosandninjas.services.DojoService;
import com.may22java.dojosandninjas.services.NinjaService;

@Controller
public class NinjaController {
	@Autowired
	private NinjaService ninjaService;
	@Autowired
	private DojoService dojoService;
	
	
	@GetMapping("/ninja/new")
	public String newNinja(@ModelAttribute("ninja")Ninja ninja, Model model) {
		List<Dojo> dojos = dojoService.allDojos();
		model.addAttribute("dojos", dojos);
		return "ninja.jsp";
	}
	
	@PostMapping("/ninja/create")
	public String createNinja(@Valid @ModelAttribute("ninja")Ninja ninja, BindingResult result, Model model) {
		List<Dojo> dojos = dojoService.allDojos();
		model.addAttribute("dojos", dojos);
		if(result.hasErrors()) {
			return "ninja.jsp";
		}
		else {
			ninjaService.createNinja(ninja);
			return "redirect:/";
		}
	}
	
	
}
