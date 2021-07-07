package com.itnbiz.insa.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.itnbiz.insa.dao.InsaDao;
import com.itnbiz.insa.util.FileUtil;
import com.itnbiz.insa.util.PageUtil;
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
		List list1 = iDao.joinGbnCodeSel();
		List list2 = iDao.sexCodeSel();
		List list3 = iDao.posGbnCodeSel();
		List list4 = iDao.deptCodeSel();
		List list5 = iDao.joinTypeCodeSel();
		List list6 = iDao.gartLvCodeSel();
		List list7 = iDao.putCodeSel();
		List list8 = iDao.milCodeSel();
		List list9 = iDao.milTypeCodeSel();
		List list10 = iDao.milLvCodeSel();
		List list11 = iDao.kosaCodeSel();
		List list12 = iDao.kosaClsCodeSel();
		mv.addObject("sabun", sabun);
		mv.addObject("LIST1", list1);
		mv.addObject("LIST2", list2);
		mv.addObject("LIST3", list3);
		mv.addObject("LIST4", list4);
		mv.addObject("LIST5", list5);
		mv.addObject("LIST6", list6);
		mv.addObject("LIST7", list7);
		mv.addObject("LIST8", list8);
		mv.addObject("LIST9", list9);
		mv.addObject("LIST10", list10);
		mv.addObject("LIST11", list11);
		mv.addObject("LIST12", list12);
		return mv;
	}
	
	@RequestMapping("/idCheck.insa")
	@ResponseBody
	public HashMap<String, String> idCheck(String id, int sabun) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", "NO");

		int cnt = iDao.idCheck(id);
		if(cnt == 0) {
			map.put("result", "OK");
		} else {
			InsaVO iVO = iDao.idUpCheck(id);
			if(iVO.getSabun() == sabun) {
				map.put("result", "UP");
			}
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
		MultipartFile pr = multi.getFile("profile_image");
		MultipartFile cmp = multi.getFile("cmp_reg_image");
		MultipartFile cr = multi.getFile("carrier_image");
		MultipartFile[] files = null;
		if(pr != null) {
			if(cmp != null) {
				files = new MultipartFile[] {pr, cmp, cr};
			} else {
				files = new MultipartFile[] {pr, cr};
			}
		} else {
			if(cmp != null) {
				files = new MultipartFile[] {cmp, cr};
			} else {
				files = new MultipartFile[] {cr};
			}
		}
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
		if(multi.getParameter("carrier_image_name") != null) {
			iVO.setCarrier_image_name(multi.getParameter("carrier_image_name"));
		}
		if(multi.getParameter("cmp_reg_image_name") != null) {
			iVO.setCmp_reg_image_name(multi.getParameter("cmp_reg_image_name"));
		}
		if(pr != null) {
			iVO.setProfile_image_name(pr.getOriginalFilename());
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
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "NO");
		int no = iDao.sabunCheck(iVO.getSabun());
		if(no == 0) {
			int cnt = iDao.empregProc(iVO);
			
			ArrayList<InsaVO> list = null;
			if(cnt == 1) {
				map.put("result", "IN");
				list = fUtil.saveProc(files, iVO.getSabun(), "/img/upload/");
				for(InsaVO vo : list) {
					iDao.addInsaFile(vo);
				}
			}
		} else {
			int cnt = iDao.empregProc2(iVO);

			if(cnt == 1) {
				map.put("result", "UP");
			}
		}
		return map;
	}
	
	@RequestMapping("/insaListForm")
	public ModelAndView insaListForm(PageUtil page, InsaVO iVO, ModelAndView mv) {
		int nowPage = page.getNowPage();
		if(nowPage == 0) {
			nowPage = 1;
		}
		int selCnt = iDao.insaSelCnt(iVO);
		page.setPage(nowPage, selCnt, 10, 5);
		iVO.setPage(page);
		List<InsaVO> list = iDao.insaListSel(iVO);
		List list1 = iDao.joinGbnCodeSel();
		List list2 = iDao.posGbnCodeSel();
		List list3 = iDao.joinTypeCodeSel();
		List list4 = iDao.putCodeSel();
		mv.addObject("LIST", list);
		mv.addObject("LIST1", list1);
		mv.addObject("LIST2", list2);
		mv.addObject("LIST3", list3);
		mv.addObject("LIST4", list4);
		mv.addObject("PAGE", page);
		mv.addObject("DATA", iVO);
		return mv;
	}
	
	@RequestMapping("/insaDetail.insa")
	public ModelAndView insaDetail(int sabun, int nowPage, ModelAndView mv) {
		InsaVO iVO = iDao.insaDetail(sabun);
		List list1 = iDao.joinGbnCodeSel();
		List list2 = iDao.sexCodeSel();
		List list3 = iDao.posGbnCodeSel();
		List list4 = iDao.deptCodeSel();
		List list5 = iDao.joinTypeCodeSel();
		List list6 = iDao.gartLvCodeSel();
		List list7 = iDao.putCodeSel();
		List list8 = iDao.milCodeSel();
		List list9 = iDao.milTypeCodeSel();
		List list10 = iDao.milLvCodeSel();
		List list11 = iDao.kosaCodeSel();
		List list12 = iDao.kosaClsCodeSel();
		mv.addObject("DATA", iVO);
		mv.addObject("nowPage", nowPage);
		mv.addObject("LIST1", list1);
		mv.addObject("LIST2", list2);
		mv.addObject("LIST3", list3);
		mv.addObject("LIST4", list4);
		mv.addObject("LIST5", list5);
		mv.addObject("LIST6", list6);
		mv.addObject("LIST7", list7);
		mv.addObject("LIST8", list8);
		mv.addObject("LIST9", list9);
		mv.addObject("LIST10", list10);
		mv.addObject("LIST11", list11);
		mv.addObject("LIST12", list12);
		return mv;
	}
}
