package com.itnbiz.insa.dao;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.itnbiz.insa.vo.InsaVO;

public class InsaDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 사원번호 조회 데이터베이스 전담 처리함수
	public int selSabun() {
		return sqlSession.selectOne("iSQL.selSabun");
	}
	
	// 아이디 중복 체크 데이터베이스 전담 처리함수
	public int idCheck(String id) {
		return sqlSession.selectOne("iSQL.idCheck", id);
	}
	
	// 공통코드 조회 데이터베이스 전담 처리함수
	public List comCodeSel() {
		return sqlSession.selectList("iSQL.comCodeSel");
	}
	
	// 사원 등록 데이터베이스 전담 처리함수
	public int empregProc(InsaVO iVO) {
		return sqlSession.insert("iSQL.empregProc", iVO);
	}
	
	// 사원 이미지 파일 등록 데이터베이스 전담 처리함수
	public int addInsaFile(InsaVO iVO) {
		return sqlSession.insert("iSQL.addInsaFile", iVO);
	}
}
