package com.itnbiz.insa.dao;

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
	
	// 사원 등록 데이터베이스 전담 처리함수
	public int empregProc(InsaVO iVO) {
		return sqlSession.insert("iSQL.empregProc", iVO);
	}
}
