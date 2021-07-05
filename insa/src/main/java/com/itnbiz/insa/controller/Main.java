package com.itnbiz.insa.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.itnbiz.insa.dao.InsaDao;
import com.itnbiz.insa.util.FileUtil;
import com.itnbiz.insa.vo.InsaVO;

@Controller
public class Main {
	@Autowired
	InsaDao iDao;
	@Autowired
	FileUtil fUtil;
	
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
		MultipartFile cmp = multi.getFile("cmp_reg_image");
		MultipartFile cr = multi.getFile("carrier_image");
		MultipartFile[] files = {cmp, cr};
		System.out.println("파일 이름 : " + cr.getOriginalFilename());
		InsaVO iVO = new InsaVO();
		if(multi.getParameter("salary") != null) {
			iVO.setSalary(Integer.parseInt(multi.getParameter("salary")));
		}
		if(multi.getParameter("years") != null) {
			iVO.setYears(Integer.parseInt(multi.getParameter("years")));
		}
		if(multi.getParameter("zip") != null) {
			iVO.setZip(Integer.parseInt(multi.getParameter("zip")));
		}
		iVO.setName(multi.getParameter("name"));
		iVO.setSabun(Integer.parseInt(multi.getParameter("sabun")));
		iVO.setId(multi.getParameter("id"));
		iVO.setPwd(multi.getParameter("pwd"));
		iVO.setHp(multi.getParameter("hp"));
		iVO.setEmail(multi.getParameter("email"));
		iVO.setPut_yn(multi.getParameter("put_yn"));
		iVO.setReg_no(multi.getParameter("reg_no"));
		iVO.setEng_name(multi.getParameter("eng_name"));
		iVO.setPhone(multi.getParameter("phone"));
		iVO.setCarrier(multi.getParameter("carrier"));
		iVO.setPos_gbn_code(multi.getParameter("pos_gbn_code"));
		iVO.setCmp_reg_no(multi.getParameter("cmp_reg_no"));
		iVO.setSex(multi.getParameter("sex"));
		iVO.setAddr1(multi.getParameter("addr1"));
		iVO.setAddr2(multi.getParameter("addr2"));
		iVO.setDept_code(multi.getParameter("dept_code"));
		iVO.setJoin_gbn_code(multi.getParameter("join_gbn_code"));
		iVO.setKosa_class_code(multi.getParameter("kosa_class_code"));
		iVO.setKosa_reg_yn(multi.getParameter("kosa_reg_yn"));
		iVO.setMil_yn(multi.getParameter("mil_yn"));
		iVO.setMil_type(multi.getParameter("mil_type"));
		iVO.setMil_level(multi.getParameter("mil_level"));
		iVO.setMil_startdate(multi.getParameter("mil_startdate"));
		iVO.setMil_enddate(multi.getParameter("mil_enddate"));
		iVO.setJoin_type(multi.getParameter("join_type"));
		iVO.setGart_level(multi.getParameter("gart_level"));
		iVO.setSelf_intro(multi.getParameter("self_intro"));
		iVO.setCrm_name(multi.getParameter("crm_name"));
		iVO.setJoin_day(java.sql.Date.valueOf(multi.getParameter("join_day")));
		if(multi.getParameter("retire_day") != null) {
			iVO.setRetire_day(java.sql.Date.valueOf(multi.getParameter("retire_day")));
		}
		int cnt = iDao.empregProc(iVO);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "NO");
		ArrayList<InsaVO> list = null;
		if(cnt == 1) {
			map.put("result", "OK");
			list = fUtil.saveProc(files, iVO.getSabun(), "/img/upload/");
			for(InsaVO vo : list) {
				iDao.addInsaFile(vo);
			}
		}
		return map;
	}
}
