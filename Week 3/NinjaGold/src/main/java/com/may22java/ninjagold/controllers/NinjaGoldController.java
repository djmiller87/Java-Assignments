package com.may22java.ninjagold.controllers;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Random;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class NinjaGoldController {
	
	ArrayList<String> actions = new ArrayList<>();
	LocalDateTime date = LocalDateTime.now();
	DateTimeFormatter dateTime = DateTimeFormatter.ofPattern("E, MMM dd yyyy HH:mm:ss");  
	String timeStamp = date.format(dateTime);
	
	@RequestMapping("/")
	public String ninjaGold(HttpSession session, Model model) {
		model.addAttribute("actions", actions);
		Random rand = new Random(); 
		int farm = rand.nextInt(21-10)+10;
		model.addAttribute("farm", farm);
		
		int cave = rand.nextInt(11-5)+5;
		model.addAttribute("cave", cave);
		
		int house = rand.nextInt(6-2)+2;
		model.addAttribute("house", house);
		
		int quest = rand.nextInt(51-(-50))+(-50);
		model.addAttribute("quest", quest);
		
		int spa = rand.nextInt((-4)-(-25))+(-25);
		model.addAttribute("spa", spa);
		if(session.getAttribute("gold")==null) {
			session.setAttribute("gold", 0);
		}
		Integer theGold =(Integer) session.getAttribute("gold");
		model.addAttribute("gold", theGold);
		return "index.jsp";
	}
	
	@RequestMapping(value="/calculate/gold", method=RequestMethod.POST)
	public String calculate(HttpSession session, @RequestParam(value="farm", required=false) Integer farm, @RequestParam(value="cave", required=false) Integer cave, @RequestParam(value="house", required=false) Integer house, @RequestParam(value="quest", required=false) Integer quest, @RequestParam(value="spa", required=false) Integer spa) {
	    Integer total = (Integer) session.getAttribute("gold");  

	    
		if (farm != null) {
			session.setAttribute("gold", total += farm);
			actions.add("You entered a farm. You earned " + Integer.toString(farm) + " gold! (" + timeStamp + ")");
			return "redirect:/";
		}
		if (cave != null) {
			session.setAttribute("gold", total += cave);
			actions.add("You entered a cave. You earned " + Integer.toString(cave) + " gold! (" + timeStamp + ")");
			return "redirect:/";
		}
		if (house != null) {
			session.setAttribute("gold", total += house);
			actions.add("You entered a house. You earned " + Integer.toString(house) + " gold! (" + timeStamp + ")");
			return "redirect:/";
		}
		if(quest != null) {
			session.setAttribute("gold", total += quest);
			actions.add("You started a quest. You earned " + Integer.toString(quest) + " gold! (" + timeStamp + ")");
			return "redirect:/";
		}
			
		if(spa != null) {
			session.setAttribute("gold", total += spa);
			actions.add("You entered a spa. You spent " + Integer.toString(spa) + " gold! (" + timeStamp + ")");
			return "redirect:/";
		}
		
		return "redirect:/";
	}
	
}
