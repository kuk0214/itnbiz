package com.itnbiz.insa.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.itnbiz.insa.util.PageUtil;

public class InsaVO {
	private int seq, sabun, years, zip, salary, sugst_money, current_salary, gart_year, gart_month, cnt, rno;
	private String put_yn, name, reg_no, eng_name, phone, hp, carrier, pos_gbn_code, cmp_reg_no,
			sex, email, addr1, addr2, dept_code, join_gbn_code, id, pwd, kosa_reg_yn, kosa_class_code, mil_yn,
			mil_type, mil_level, mil_startdate, mil_enddate, join_type, gart_level, self_intro, crm_name,
			gubun, code, note, codename, pjt_gbn_code, eqm_yn, work_area, major_stud_gbn, school_name, cmp_name, 
			respon_dept, work_contents, oriname, savename, dir, carrier_image_name, cmp_reg_image_name, profile_image_name;
	private Date join_day, retire_day, wrk_posb_day, work_start_day, work_end_day;
	private MultipartFile profile_image, carrier_image, cmp_reg_image;
	private PageUtil page;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getSabun() {
		return sabun;
	}
	public void setSabun(int sabun) {
		this.sabun = sabun;
	}
	public int getYears() {
		return years;
	}
	public void setYears(int years) {
		this.years = years;
	}
	public int getZip() {
		return zip;
	}
	public void setZip(int zip) {
		this.zip = zip;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public int getSugst_money() {
		return sugst_money;
	}
	public void setSugst_money(int sugst_money) {
		this.sugst_money = sugst_money;
	}
	public int getCurrent_salary() {
		return current_salary;
	}
	public void setCurrent_salary(int current_salary) {
		this.current_salary = current_salary;
	}
	public int getGart_year() {
		return gart_year;
	}
	public void setGart_year(int gart_year) {
		this.gart_year = gart_year;
	}
	public int getGart_month() {
		return gart_month;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public void setGart_month(int gart_month) {
		this.gart_month = gart_month;
	}
	public String getPut_yn() {
		return put_yn;
	}
	public void setPut_yn(String put_yn) {
		this.put_yn = put_yn;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getReg_no() {
		return reg_no;
	}
	public void setReg_no(String reg_no) {
		this.reg_no = reg_no;
	}
	public String getEng_name() {
		return eng_name;
	}
	public void setEng_name(String eng_name) {
		this.eng_name = eng_name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getCarrier() {
		return carrier;
	}
	public void setCarrier(String carrier) {
		this.carrier = carrier;
	}
	public String getPos_gbn_code() {
		return pos_gbn_code;
	}
	public void setPos_gbn_code(String pos_gbn_code) {
		this.pos_gbn_code = pos_gbn_code;
	}
	public String getCmp_reg_no() {
		return cmp_reg_no;
	}
	public void setCmp_reg_no(String cmp_reg_no) {
		this.cmp_reg_no = cmp_reg_no;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getDept_code() {
		return dept_code;
	}
	public void setDept_code(String dept_code) {
		this.dept_code = dept_code;
	}
	public String getJoin_gbn_code() {
		return join_gbn_code;
	}
	public void setJoin_gbn_code(String join_gbn_code) {
		this.join_gbn_code = join_gbn_code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getKosa_reg_yn() {
		return kosa_reg_yn;
	}
	public void setKosa_reg_yn(String kosa_reg_yn) {
		this.kosa_reg_yn = kosa_reg_yn;
	}
	public String getKosa_class_code() {
		return kosa_class_code;
	}
	public void setKosa_class_code(String kosa_class_code) {
		this.kosa_class_code = kosa_class_code;
	}
	public String getMil_yn() {
		return mil_yn;
	}
	public void setMil_yn(String mil_yn) {
		this.mil_yn = mil_yn;
	}
	public String getMil_type() {
		return mil_type;
	}
	public void setMil_type(String mil_type) {
		this.mil_type = mil_type;
	}
	public String getMil_level() {
		return mil_level;
	}
	public void setMil_level(String mil_level) {
		this.mil_level = mil_level;
	}
	public String getMil_startdate() {
		return mil_startdate;
	}
	public void setMil_startdate(String mil_startdate) {
		this.mil_startdate = mil_startdate;
	}
	public String getMil_enddate() {
		return mil_enddate;
	}
	public void setMil_enddate(String mil_enddate) {
		this.mil_enddate = mil_enddate;
	}
	public String getJoin_type() {
		return join_type;
	}
	public void setJoin_type(String join_type) {
		this.join_type = join_type;
	}
	public String getGart_level() {
		return gart_level;
	}
	public void setGart_level(String gart_level) {
		this.gart_level = gart_level;
	}
	public String getSelf_intro() {
		return self_intro;
	}
	public void setSelf_intro(String self_intro) {
		this.self_intro = self_intro;
	}
	public String getCrm_name() {
		return crm_name;
	}
	public void setCrm_name(String crm_name) {
		this.crm_name = crm_name;
	}
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getCodename() {
		return codename;
	}
	public void setCodename(String codename) {
		this.codename = codename;
	}
	public String getPjt_gbn_code() {
		return pjt_gbn_code;
	}
	public void setPjt_gbn_code(String pjt_gbn_code) {
		this.pjt_gbn_code = pjt_gbn_code;
	}
	public String getEqm_yn() {
		return eqm_yn;
	}
	public void setEqm_yn(String eqm_yn) {
		this.eqm_yn = eqm_yn;
	}
	public String getWork_area() {
		return work_area;
	}
	public void setWork_area(String work_area) {
		this.work_area = work_area;
	}
	public String getMajor_stud_gbn() {
		return major_stud_gbn;
	}
	public void setMajor_stud_gbn(String major_stud_gbn) {
		this.major_stud_gbn = major_stud_gbn;
	}
	public String getSchool_name() {
		return school_name;
	}
	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}
	public String getCmp_name() {
		return cmp_name;
	}
	public void setCmp_name(String cmp_name) {
		this.cmp_name = cmp_name;
	}
	public String getRespon_dept() {
		return respon_dept;
	}
	public void setRespon_dept(String respon_dept) {
		this.respon_dept = respon_dept;
	}
	public String getWork_contents() {
		return work_contents;
	}
	public void setWork_contents(String work_contents) {
		this.work_contents = work_contents;
	}
	public String getOriname() {
		return oriname;
	}
	public void setOriname(String oriname) {
		this.oriname = oriname;
	}
	public String getSavename() {
		return savename;
	}
	public void setSavename(String savename) {
		this.savename = savename;
	}
	public String getDir() {
		return dir;
	}
	public void setDir(String dir) {
		this.dir = dir;
	}
	public String getCarrier_image_name() {
		return carrier_image_name;
	}
	public void setCarrier_image_name(String carrier_image_name) {
		this.carrier_image_name = carrier_image_name;
	}
	public String getCmp_reg_image_name() {
		return cmp_reg_image_name;
	}
	public void setCmp_reg_image_name(String cmp_reg_image_name) {
		this.cmp_reg_image_name = cmp_reg_image_name;
	}
	public String getProfile_image_name() {
		return profile_image_name;
	}
	public void setProfile_image_name(String profile_image_name) {
		this.profile_image_name = profile_image_name;
	}
	public Date getJoin_day() {
		return join_day;
	}
	public void setJoin_day(Date join_day) {
		this.join_day = join_day;
	}
	public Date getRetire_day() {
		return retire_day;
	}
	public void setRetire_day(Date retire_day) {
		this.retire_day = retire_day;
	}
	public Date getWrk_posb_day() {
		return wrk_posb_day;
	}
	public void setWrk_posb_day(Date wrk_posb_day) {
		this.wrk_posb_day = wrk_posb_day;
	}
	public Date getWork_start_day() {
		return work_start_day;
	}
	public void setWork_start_day(Date work_start_day) {
		this.work_start_day = work_start_day;
	}
	public Date getWork_end_day() {
		return work_end_day;
	}
	public void setWork_end_day(Date work_end_day) {
		this.work_end_day = work_end_day;
	}
	public MultipartFile getProfile_image() {
		return profile_image;
	}
	public void setProfile_image(MultipartFile profile_image) {
		this.profile_image = profile_image;
	}
	public MultipartFile getCarrier_image() {
		return carrier_image;
	}
	public void setCarrier_image(MultipartFile carrier_image) {
		this.carrier_image = carrier_image;
	}
	public MultipartFile getCmp_reg_image() {
		return cmp_reg_image;
	}
	public void setCmp_reg_image(MultipartFile cmp_reg_image) {
		this.cmp_reg_image = cmp_reg_image;
	}
	public PageUtil getPage() {
		return page;
	}
	public void setPage(PageUtil page) {
		this.page = page;
	}
}
