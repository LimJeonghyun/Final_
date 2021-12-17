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

/**
 * Handles requests for the application home page.
 */
// admin으로 시작
// /admin/...
@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	@Autowired
	BoardService boardService;
	@Autowired
	CommentService commentService;

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	// /admin -> 관리자 로그인 페이지
	@RequestMapping(value = "/log", method = RequestMethod.GET)
	public String admin() {
		return "admin/admin";
	}

	// 로그인 체크
	@RequestMapping(value = "/checklogin", method = RequestMethod.POST)
	public String checklogin() {
//	      이 로직이 여기에 들어가야 	할 것 같음
//		-> java file이라 js 명령어를 사용할 수 없음 
//			String id= request.getParameter("id");
//			String pw = request.getParameter("pw");
//			String admin_id = "admin";
//			String admin_pw = "password";
		//
//			if(id.equals(admin_id) && pw.equals(admin_pw)){
//				%>
//				<script>
//				alert("로그인 성공!"); 
//				location.href = 'adminlist';
//				</script><% 
//			}
//			else{
//				%>
//				<script>alert("로그인 실패 :("); history.back(); </script><%
//			}
		return "admin/checklogin";
	}

	// /admin/adminhome -> 관리자가 보는 home 페이지(user와 다르지 않음)
	@RequestMapping(value = "/adminhome", method = RequestMethod.GET)
	public String adminhome(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
		return "admin/adminhome";
	}

	// /admin/adminlist -> 관리자 목록 페이지(keyboard, monitorarm, mouse)(user와 동일하나 [추가]
	// 버튼 있음)
	// TODO: 파라미터 넘겨줘서 어떤 보드인지 구분
	@RequestMapping(value = "/adminlist/{category}", method = RequestMethod.GET)
	public String adminList(@PathVariable String category, Model model) {
		model.addAttribute("list", boardService.getBoardList(category));
		return "admin/adminlist";
	}

	// /admin/add -> 제품 추가 페이지(category를 넘겨주어 해당 list의 카테고리에 추가되도록)
	@RequestMapping(value = "/add/{category}", method = RequestMethod.GET)
	public String addPost(@PathVariable String category, Model model) {
		model.addAttribute("category", category);
		return "admin/addpostform";
	}

	// 제품 추가 확인 -> 목록 페이지로 돌아감
	@RequestMapping(value = "/addok/{category}", method = RequestMethod.POST)
	public String addPostOK(@PathVariable String category, BoardVO vo) {
		if (boardService.insertBoard(vo) == 0)
			System.out.println("데이터 추가 실패");
		else
			System.out.println("데이터 추가 성공");
		return "redirect:../adminlist/{category}";
	}

	// 제품 수정 페이지
	@RequestMapping(value = "/editform/{id}", method = RequestMethod.GET)
	public String editPost(@PathVariable int id, Model model) {
		model.addAttribute("clist", commentService.getCommentList(id));
		model.addAttribute("u", boardService.getBoard(id));
		return "admin/editform";
	}

	// 수정 확인
	@RequestMapping(value = "/editok/{category}", method = RequestMethod.POST)
	public String editPostOk(@PathVariable String category, BoardVO vo) {
		if (boardService.updateBoard(vo) == 0)
			System.out.println("데이터 수정 실패");
		else
			System.out.println("데이터 수정 성공!!!");
		return "redirect:../adminlist/{category}";
	}

	// 제품 삭제 확인
	@RequestMapping(value = "/deleteok/{id}/{category}", method = RequestMethod.GET)
	public String deletePostOk(@PathVariable int id, String category) {
		//TODO: 가능하다면 이 product_id에 해당하는 댓글도 모두 삭제하는 기능 추가
		if (boardService.deleteBoard(id) == 0)
			System.out.println("데이터 삭제 실패");
		else
			System.out.println("데이터 삭제 성공!!");
		return "redirect:../../adminlist/{category}";
	}

	// 댓글 삭제 확인
	@RequestMapping(value = "/deletecommentok/{pid}/{cid}", method = RequestMethod.GET)
	public String deleteCommentOk(@PathVariable int pid, @PathVariable int cid) {
		if (commentService.deleteComment(cid) == 0)
			System.out.println("댓글 삭제 실패");
		else
			System.out.println("댓글 삭제 성공!!");
		return "redirect:../../editform/" + pid;
	}

}
