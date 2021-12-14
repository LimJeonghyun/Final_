package io.github.spring.board;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/admin")
public class BoardController {
	@Autowired
	BoardService boardService;

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@RequestMapping(value = "/log", method = RequestMethod.GET)
	public String admin() {
		return "admin";
	}
	
	@RequestMapping(value = "/adminlist", method = RequestMethod.GET)
	public String boardList(Locale locale, Model model) {
		model.addAttribute("list", boardService.getBoardList());
		return "adminlist";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addPost() {
		return "addpostform";
}

	@RequestMapping(value = "/addok", method = RequestMethod.POST)
	public String addPostOK(BoardVO vo) {
		if(boardService.insertBoard(vo) == 0)
			System.out.println("데이터 추가 실패");
		else
			System.out.println("데이터 추가 성공");
		return "redirect:adminlist";
	}
	
	@RequestMapping(value = "/addcommentok/{id}", method = RequestMethod.POST)
	public String editCommentOk(BoardVO vo) {
		if (boardService.insertComment(vo) == 0)
			System.out.println("데이터 수정 실패");
		else
			System.out.println("데이터 수정 성공!!!");
		return "redirect:../editform/{id}";
	}


	@RequestMapping(value = "/editform/{id}", method = RequestMethod.GET)
	public String editPost(@PathVariable int id, Model model) {
		BoardVO boardVO = boardService.getBoard(id);
		model.addAttribute("clist", boardService.getCommentList(id));
		model.addAttribute("u", boardVO);
		return "editform";
	}

	@RequestMapping(value = "/editok", method = RequestMethod.POST)
	public String editPostOk(BoardVO vo) {
		if (boardService.updateBoard(vo) == 0)
			System.out.println("데이터 수정 실패");
		else
			System.out.println("데이터 수정 성공!!!");
		return "redirect:adminlist";
	}
	
	@RequestMapping(value = "/delete_ok/{id}", method = RequestMethod.GET)
	public String deletePostOk(@PathVariable int id) {
		if (boardService.deleteBoard(id) == 0)
			System.out.println("데이터 삭제 실패");
		else
			System.out.println("데이터 삭제 성공!!");
		return "redirect:../adminlist";
	}
	
	@RequestMapping(value = "/deletec_ok/{id}/{cid}", method = RequestMethod.GET)
	public String deleteCommentOk(@PathVariable int id, @PathVariable  int cid) {
		if (boardService.deleteComment(cid) == 0)
			System.out.println("데이터 삭제 실패");
		else
			System.out.println("데이터 삭제 성공!!");
		return "redirect:../../editform/{id}";
	}
	
//	@RequestMapping(value = "/delete_okc/{id}", method = RequestMethod.GET)
//	public String deleteCommenttOk(@PathVariable int id) {
//		if (boardService.deleteComment(id) == 0)
//			System.out.println("데이터 삭제 실패");
//		else
//			System.out.println("데이터 삭제 성공!!");
//		return "redirect:../list";
//	}

}
