package com.mycompany.personnel.dao;

import com.mycompany.personnel.vo.BankVO;
import java.util.List;

public interface BankDAO {
    List<BankVO> getAllBanks();
    // 다른 메서드들...
}
