package com.may22java.counter.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CounterController {
	
	@RequestMapping("/your_server/counter")
	public String Index(HttpSession session, Model model) {
		if(session.getAttribute("count")==null) {
			session.setAttribute("count", 0);
		}
		Integer currentCount =(Integer) session.getAttribute("count");
		model.addAttribute("theCount", currentCount);
		return "index.jsp";
		
	}
	
	@RequestMapping("/your_server")
	public String Welcome(HttpSession session) {
		if(session.getAttribute("count")==null) {
			session.setAttribute("count", 0);
		}
		else {
			Integer total = (Integer) session.getAttribute("count");
			session.setAttribute("count", total +=1) ;
		}
		return "welcome.jsp";
	}
	
	@RequestMapping("/your_server/add_two")
	public String AddTwo(HttpSession session) {
		if(session.getAttribute("count")==null) {
			session.setAttribute("count", 0);
		}
		else {
			Integer total = (Integer) session.getAttribute("count");
			session.setAttribute("count", total +=2) ;
		}
		return "welcome_two.jsp";
	}
	
	@RequestMapping("/clear_session")
	public String Clear(HttpSession session) {
		session.removeAttribute("count");
		return "redirect:" + "/your_server/counter";
	}

}
