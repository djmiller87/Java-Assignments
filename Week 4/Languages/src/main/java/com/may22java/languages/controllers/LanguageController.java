package com.may22java.languages.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.may22java.languages.models.Language;
import com.may22java.languages.services.LanguageService;

@Controller
public class LanguageController {
	private final LanguageService languageService;
	
	public LanguageController(LanguageService languageService) {
		this.languageService = languageService;
	}

	@GetMapping("/languages")
	public String index(@ModelAttribute("language")Language language, Model model) {
		List<Language> languages = languageService.allLanguages();
		model.addAttribute("languages", languages);
		return "index.jsp";
	}
	
	@GetMapping("/language/{id}/show")
	public String showLanguage(@PathVariable("id")Long id, Model model) {
		Language language = languageService.findLanguage(id);
		model.addAttribute("language", language);
		return "show.jsp";		
	}
	
	@PostMapping("/language/create")
	public String createLanguage(@Valid @ModelAttribute("language")Language language, BindingResult result, Model model) {
		List<Language> languages = languageService.allLanguages();
		model.addAttribute("languages", languages);
		if(result.hasErrors()) {
			return "index.jsp";
		}
		else {
			languageService.createLanguage(language);
			return "redirect:/languages";
		}
		
	}
	
	@GetMapping("/language/{id}/edit")
	public String editLanguage(@PathVariable("id")Long id, Model model) {
		Language language = languageService.findLanguage(id);
		model.addAttribute("language", language);
			return "edit.jsp";				
	}
	
	@PutMapping("/language/{id}/edit")
	public String updateLanguage(@Valid @ModelAttribute("language")Language language, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute(language);
			return "edit.jsp";
		}
		else {
			languageService.updateLanguage(language);
			return "redirect:/languages";
		}
	}
	
	@RequestMapping("/language/{id}/delete")
	public String deleteLanguage(@PathVariable("id")Long id) {
		languageService.deleteLanguage(id);
		return "redirect:/languages";
	}
	
}
