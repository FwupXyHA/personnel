package com.mycompany.personnel.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.personnel.dao.BankDAO;
import com.mycompany.personnel.vo.BankVO;

@Service
public class BankServiceImpl implements BankService {

	@Inject
    private BankDAO bankDAO;

    @Autowired
    public BankServiceImpl(BankDAO bankDAO) {
        this.bankDAO = bankDAO;
    }

    @Override
    public List<BankVO> getAllBanks() {
        return bankDAO.getAllBanks();
    }

    // 다른 메서드들...
}
