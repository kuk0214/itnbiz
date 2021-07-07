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
	
	// 수정 아이디 체크 데이터베이스 전담 처리함수
	public InsaVO idUpCheck(String id) {
		return sqlSession.selectOne("iSQL.idUpCheck", id);
	}
	
	// 직종 공통코드 조회 데이터베이스 전담 처리함수
	public List joinGbnCodeSel() {
		return sqlSession.selectList("iSQL.joinGbnCodeSel");
	}
	
	// 성별 공통코드 조회 데이터베이스 전담 처리함수
		public List sexCodeSel() {
			return sqlSession.selectList("iSQL.sexCodeSel");
		}
		
	// 직위 공통코드 조회 데이터베이스 전담 처리함수
	public List posGbnCodeSel() {
		return sqlSession.selectList("iSQL.posGbnCodeSel");
	}
	
	// 부서 공통코드 조회 데이터베이스 전담 처리함수
	public List deptCodeSel() {
		return sqlSession.selectList("iSQL.deptCodeSel");
	}
	
	//  입사구분 공통코드 조회 데이터베이스 전담 처리함수
	public List joinTypeCodeSel() {
		return sqlSession.selectList("iSQL.joinTypeCodeSel");
	}
		
	// 등급 공통코드 조회 데이터베이스 전담 처리함수
	public List gartLvCodeSel() {
		return sqlSession.selectList("iSQL.gartLvCodeSel");
	}

	// 투입여부 공통코드 조회 데이터베이스 전담 처리함수
	public List putCodeSel() {
		return sqlSession.selectList("iSQL.putCodeSel");
	}

	// 군필여부 공통코드 조회 데이터베이스 전담 처리함수
	public List milCodeSel() {
		return sqlSession.selectList("iSQL.milCodeSel");
	}
	
	// 군별 공통코드 조회 데이터베이스 전담 처리함수
	public List milTypeCodeSel() {
		return sqlSession.selectList("iSQL.milTypeCodeSel");
	}
	
	// 계급 공통코드 조회 데이터베이스 전담 처리함수
		public List milLvCodeSel() {
			return sqlSession.selectList("iSQL.milLvCodeSel");
		}
		
	// KOSA등록 공통코드 조회 데이터베이스 전담 처리함수
	public List kosaCodeSel() {
		return sqlSession.selectList("iSQL.kosaCodeSel");
	}
		
	// KOSA등급 공통코드 조회 데이터베이스 전담 처리함수
	public List kosaClsCodeSel() {
		return sqlSession.selectList("iSQL.kosaClsCodeSel");
	}
	
	// 사원 등록 데이터베이스 전담 처리함수
	public int empregProc(InsaVO iVO) {
		return sqlSession.insert("iSQL.empregProc", iVO);
	}
	
	// 사원 이미지 파일 등록 데이터베이스 전담 처리함수
	public int addInsaFile(InsaVO iVO) {
		return sqlSession.insert("iSQL.addInsaFile", iVO);
	}
	
	// 사원번호 체크 데이터베이스 전담 처리함수
	public int sabunCheck(int sabun) {
		return sqlSession.selectOne("iSQL.sabunCheck", sabun);
	}
	
	// 사원 업데이트 데이터베이스 전담 처리함수
	public int empregProc2(InsaVO iVO) {
		return sqlSession.update("iSQL.empregProc2", iVO);
	}
	
	// 사원 이미지 파일 업데이트 데이터베이스 전담 처리함수
	public int addInsaFlie2(InsaVO iVO) {
		return sqlSession.update("iSQL.addInsaFile2", iVO);
	}
	
	// 사원 리스트 조회 데이터베이스 전담 처리함수
	public List insaListSel(InsaVO iVO) {
		return sqlSession.selectList("iSQL.insaListSel", iVO);
	}
	
	// 사원 리스트 수 조회 데이터베이스 전담 처리함수
	public int insaSelCnt(InsaVO iVO) {
		return sqlSession.selectOne("iSQL.insaSelCnt", iVO);
	}
	
	// 사원 상세정보 조회 데이터베이스 전담 처리함수
	public InsaVO insaDetail(int sabun) {
		return sqlSession.selectOne("iSQL.insaDetail", sabun);
	}
} 
