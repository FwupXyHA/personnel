package com.mycompany.personnel.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.personnel.vo.BankVO;

@Repository
public class BankDAOImpl implements BankDAO {
	
	@Inject
	private SqlSession sqlSession;

	@Autowired
    public BankDAOImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public List<BankVO> getAllBanks() {
        return sqlSession.selectList("boardMapper.bank");
    }
    // 다른 메서드들...
}
