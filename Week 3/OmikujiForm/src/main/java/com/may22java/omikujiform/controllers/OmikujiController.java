package com.may22java.omikujiform.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class OmikujiController {
	
	@RequestMapping("/omikuji")
	public String Index() {
		return "index.jsp";
	}
	
	@RequestMapping(value="/submit", method=RequestMethod.POST)
	public String submit(HttpSession session,
			@RequestParam(value="number")Integer number,
			@RequestParam(value="city")String city,
			@RequestParam(value="person")String person,
			@RequestParam(value="hobby")String hobby,
			@RequestParam(value="thing")String thing,
			@RequestParam(value="message")String message) {
		session.setAttribute("number", number);
		session.setAttribute("city", city);
		session.setAttribute("person", person);
		session.setAttribute("hobby", hobby);
		session.setAttribute("thing", thing);
		session.setAttribute("message", message);
		return "redirect:/omikuji/show";
	}
	
	@RequestMapping("/omikuji/show")
	public String fortune(HttpSession session, Model model) {
		Integer theNumber =(Integer) session.getAttribute("number");
		model.addAttribute("theNumber", theNumber);
		String theCity =(String) session.getAttribute("city");
		model.addAttribute("theCity", theCity);
		String thePerson =(String) session.getAttribute("person");
		model.addAttribute("thePerson", thePerson);
		String theHobby =(String) session.getAttribute("hobby");
		model.addAttribute("theHobby", theHobby);
		String theThing =(String) session.getAttribute("thing");
		model.addAttribute("theThing", theThing);
		String theMessage =(String) session.getAttribute("message");
		model.addAttribute("theMessage", theMessage);
		return "fortune.jsp";
	}

}
