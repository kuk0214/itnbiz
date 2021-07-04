package com.itnbiz.insa.controller;

import java.util.*;

import org.apache.ibatis.javassist.tools.reflect.Sample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
	
	@RequestMapping("/empReg.insa")
	public ModelAndView empReg(ModelAndView mv) {
		int sabun = iDao.selSabun();
		List list = iDao.comCodeSel();
		mv.addObject("sabun", sabun);
		mv.addObject("LIST", list);
		return mv;
	}
	
	@RequestMapping("/idCheck.insa")
	@ResponseBody
	public HashMap<String, String> idCheck(String id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", "NO");
		int cnt = iDao.idCheck(id);
		if(cnt == 0) {
			map.put("result", "OK");
		}
		
		return map;
	}
	
	@RequestMapping("/jusoPopup.insa")
	public ModelAndView jusopopup(ModelAndView mv) {
		return mv;
	}
	
	@RequestMapping("/empRegProc.insa")
	@ResponseBody
	public HashMap<String, Object> empRegProc(MultipartHttpServletRequest multi) {

	
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "NO");
		
		return map;
	}
}
