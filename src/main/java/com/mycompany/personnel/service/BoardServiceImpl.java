package com.mycompany.personnel.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mycompany.personnel.dao.BoardDAO;
import com.mycompany.personnel.vo.BankVO;
import com.mycompany.personnel.vo.BoardVO;
import com.mycompany.personnel.vo.DeptVO;
import com.mycompany.personnel.vo.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;
	
	@Inject
	public BoardServiceImpl(BoardDAO dao) {
		this.dao = dao;
    }
	
	// 사원 추가
	@Override
	public void register(BoardVO boardVO) throws Exception {
		dao.register(boardVO);
	}
	
	// 사원 목록 조회
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		return dao.list(scri);
	}
	
	
	// 총 사원 수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}
	
	

	@Override
	public List<DeptVO> getAllDepts() {
		return dao.getAllDepts();
	}

	@Override
	public List<BankVO> getAllBanks() {
		return dao.getAllBanks();
	}
	
	
}
