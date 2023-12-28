package com.mycompany.personnel.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.personnel.vo.DeptVO;

@Repository
public class DeptDAOImpl implements DeptDAO {
	
	@Inject
	private SqlSession sqlSession;

	@Autowired
    public DeptDAOImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public List<DeptVO> getAllDepts() {
        return sqlSession.selectList("boardMapper.dept");
    }
    // 다른 메서드들...
}
