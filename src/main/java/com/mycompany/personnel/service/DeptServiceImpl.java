package com.mycompany.personnel.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.personnel.dao.DeptDAO;
import com.mycompany.personnel.vo.DeptVO;

@Service
public class DeptServiceImpl implements DeptService {

	@Inject
	private DeptDAO deptDAO;

	@Autowired
	public DeptServiceImpl(DeptDAO deptDAO) {
		this.deptDAO = deptDAO;
	}

	@Override
	public List<DeptVO> getAllDepts() {
		return deptDAO.getAllDepts();
	}

	// 다른 메서드들...
}
