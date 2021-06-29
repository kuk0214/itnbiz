package com.itnbiz.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Main {
	
	@RequestMapping("/main.insa")
	public ModelAndView main(ModelAndView mv) {
		return mv;
	}
}
