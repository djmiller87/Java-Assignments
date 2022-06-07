package com.may22java.languages.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.may22java.languages.models.Language;
import com.may22java.languages.repositories.LanguageRepository;

@Service
public class LanguageService {
	private final LanguageRepository languageRepository;
	
	public LanguageService(LanguageRepository languageRepository) {
		this.languageRepository = languageRepository;
	}
	
	public List<Language> allLanguages(){
		return languageRepository.findAll();
	}
	
	public Language createLanguage(Language language) {
		return languageRepository.save(language);
	}
	
	public Language updateLanguage(Language language) {
		return languageRepository.save(language);
	}
	
	public void deleteLanguage(Long id) {
		languageRepository.deleteById(id);
	}
	
	public Language findLanguage(Long id) {
		Optional<Language> optionalLanguage = languageRepository.findById(id);
		if (optionalLanguage.isPresent()) {
			return optionalLanguage.get();
		} 
		else {
			return null;
		}
	}

}
