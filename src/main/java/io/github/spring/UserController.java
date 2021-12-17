package io.github.spring;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import io.github.spring.util.*;

@Controller
public class UserController {
	@Autowired
	BoardService boardService;
	@Autowired
	CommentService commentService;

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	// / -> 루트는 사용자 홈 화면
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
		return "user/home";
	}

	// /list/{category} -> category은 keyboard, monitorarm, mouse 중
	@RequestMapping(value = "/list/{category}", method = RequestMethod.GET)
	public String list(@PathVariable String category, Model model) {
		// TODO: getBoardList() 함수가 String category를 받을 수 있도록 수정하고,
		// category를 받아 해당 category만 query하도록 함수 구현
		model.addAttribute("list", boardService.getBoardList(category));
		return "user/list";
	}

	// /detailview/{id} -> 상품 디테일 페이지
	@RequestMapping(value = "/detailview/{id}", method = RequestMethod.GET)
	public String detailview(@PathVariable int id, Model model) {
		model.addAttribute("u", boardService.getBoard(id));
		// 어차피 product 테이블에서 id 값으로 조회하는거라 category는 상관 없을듯!
		return "user/detailview";
	}

	// 댓글 추가 확인 -> 상품 디테일 페이지로 다시 돌아감
	@RequestMapping(value = "/addcommentok/{id}", method = RequestMethod.POST)
	public String editCommentOk(CommentVO vo) {
		if (commentService.insertComment(vo) == 0)
			System.out.println("댓글 추가 실패");
		else
			System.out.println("댓글 추가 성공!!!");
		return "redirect:../detailview/{id}";
	}

}
