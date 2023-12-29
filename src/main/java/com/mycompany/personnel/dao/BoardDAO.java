package com.mycompany.personnel.dao;

import java.util.List;

import com.mycompany.personnel.vo.BankVO;
import com.mycompany.personnel.vo.BoardVO;
import com.mycompany.personnel.vo.DeptVO;
import com.mycompany.personnel.vo.SearchCriteria;

public interface BoardDAO {

	// 사원 추가
	public void register(BoardVO boardVO) throws Exception;
	
	// 사원 목록 조회
	public List<BoardVO> list(SearchCriteria scri) throws Exception;

	// 총 사원 수
	public int listCount(SearchCriteria scri) throws Exception;
	


	List<BankVO> getAllBanks();
	List<DeptVO> getAllDepts();
	
}
