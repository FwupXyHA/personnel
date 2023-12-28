package com.mycompany.personnel.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.personnel.service.BankService;
import com.mycompany.personnel.service.BoardService;
import com.mycompany.personnel.service.DeptService;
import com.mycompany.personnel.vo.BankVO;
import com.mycompany.personnel.vo.BoardVO;
import com.mycompany.personnel.vo.DeptVO;
import com.mycompany.personnel.vo.PageMaker;
import com.mycompany.personnel.vo.SearchCriteria;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger =
			LoggerFactory.getLogger(BoardController.class);
	
	
	private final DeptService deptService;
	private final BankService bankService;
	private final BoardService boardService;
	
	@Autowired
	public BoardController(DeptService deptService, BankService bankService, BoardService boardService) {
		this.deptService = deptService;
		this.bankService = bankService;
		this.boardService = boardService;
	}
	
	@RequestMapping(value = "/depts", method = RequestMethod.GET)
	public String getAllDepts(Model model) {
		List<DeptVO> depts = deptService.getAllDepts();
		model.addAttribute("depts", depts);
		return "board/depts";
	}
	
	
	@RequestMapping(value = "/banks", method = RequestMethod.GET)
	public String getAllBanks(Model model) {
		List<BankVO> banks = bankService.getAllBanks();
		model.addAttribute("banks", banks);
		return "board/banks";
	}
	
	
	// 사원 추가 화면
	@RequestMapping(value = "/registerView", method = RequestMethod.GET)
	public String registerView(Model model) throws Exception {
		logger.info("registerView");
		
		List<DeptVO> depts = deptService.getAllDepts();
		List<BankVO> banks = bankService.getAllBanks();

	    model.addAttribute("depts", depts);
	    model.addAttribute("banks", banks);
		
	    return "board/registerView";

	}
	
	// 사원 추가
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(BoardVO boardVO) throws Exception {
		logger.info("register");
		
		boardService.register(boardVO);
		return "redirect:/board/list";
	}
	
	// 사원 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model,  @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("list");
		
		model.addAttribute("list", boardService.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(boardService.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "board/list";
	}

	
	

}
