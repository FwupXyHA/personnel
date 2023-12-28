package com.mycompany.personnel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.personnel.service.DeptService;
import com.mycompany.personnel.vo.DeptVO;

@Controller
@RequestMapping("/dept")
public class DeptController {
    
    private final DeptService deptService;

    @Autowired
    public DeptController(DeptService deptService) {
        this.deptService = deptService;
    }

    @GetMapping("/list")
    public String showDeptList(Model model) {
        List<DeptVO> depts = deptService.getAllDepts(); // DeptService를 통해 부서 목록을 가져옴
        model.addAttribute("depts", depts); // 모델에 부서 목록을 추가하여 뷰에 전달
        return "depts"; // 부서 목록을 표시할 뷰 페이지로 포워딩
    }
}
