package com.itnbiz.insa.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itnbiz.insa.dao.InsaDao;
import com.itnbiz.insa.vo.InsaVO;

@Controller
public class Main {
	@Autowired
	InsaDao iDao;
	
	@RequestMapping("/main.insa")
	public ModelAndView main(ModelAndView mv) {
		return mv;
	}
	
	@RequestMapping("/empreg.mentor")
	public ModelAndView empreg(ModelAndView mv) {
		int sabun = iDao.selSabun();
		mv.addObject("sabun", sabun);
		return mv;
	}
	
	@RequestMapping("/empregProc.mentor")
	public ModelAndView empregProc(ModelAndView mv, InsaVO iVO) {
		iDao.empregProc(iVO);
		
		mv.setViewName("empreg");
		return mv;
	}
}
