package com.mycompany.personnel.dao;

import com.mycompany.personnel.vo.DeptVO;
import java.util.List;

public interface DeptDAO {
    List<DeptVO> getAllDepts();
    // 다른 메서드들...
}