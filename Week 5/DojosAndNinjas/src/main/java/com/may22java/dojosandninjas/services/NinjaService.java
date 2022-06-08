package com.may22java.dojosandninjas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.may22java.dojosandninjas.models.Ninja;
import com.may22java.dojosandninjas.repositories.NinjaRepository;

@Service
public class NinjaService {
	private final NinjaRepository ninjaRepository;
	
	public NinjaService(NinjaRepository ninjaRepository) {
		this.ninjaRepository = ninjaRepository;
	}
	
	public Ninja createNinja(Ninja ninja) {
		return ninjaRepository.save(ninja);
	}
	
	public List<Ninja> allNinjas(){
		return ninjaRepository.findAll();
	}
	
	public Ninja oneNinja(Long id) {
		Optional<Ninja> ninja = ninjaRepository.findById(id);
		if (ninja.isPresent()) {
			return ninja.get();
		}
		else {
			return null;
		}
	}
	
	public Ninja updateNinja(Ninja ninja) {
		return ninjaRepository.save(ninja);
	}
	
	public void deleteNinja(Long id) {
		ninjaRepository.deleteById(id);
	}

}
