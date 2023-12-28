package com.mycompany.personnel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.personnel.service.BankService;
import com.mycompany.personnel.vo.BankVO;

@Controller
@RequestMapping("/bank")
public class BankController {
    
    private final BankService bankService;

    @Autowired
    public BankController(BankService bankService) {
        this.bankService = bankService;
    }

    @GetMapping("/list")
    public String showDeptList(Model model) {
        List<BankVO> banks = bankService.getAllBanks(); // DeptService를 통해 부서 목록을 가져옴
        model.addAttribute("banks", banks); // 모델에 부서 목록을 추가하여 뷰에 전달
        return "banks"; // 부서 목록을 표시할 뷰 페이지로 포워딩
    }
}
