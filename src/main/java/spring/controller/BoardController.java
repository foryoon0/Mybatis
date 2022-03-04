package spring.controller;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import spring.dao.BoardDao;

import spring.vo.Board;

@Controller
@RequestMapping("/board")
public class BoardController {

		private BoardDao dao;
	

	public void setDao(BoardDao dao) {
			this.dao = dao;
		}
	

		@RequestMapping("/ReadBoard/{boardNum}")
		public String ReadBoard(@PathVariable("boardNum") int boardNum, Model model) {
			
			dao.updateCount(boardNum);
			Board board = dao.selectByBoardNum(boardNum);
		

			model.addAttribute("board", board);

			
			return "board/ReadBoard";
		}
		
		
		
		@RequestMapping(value="/WriteBoard")
		public String WriteBoard() {
			return "board/WriteBoard"; 	
		}
		
		
		@RequestMapping(value="/writing", method=RequestMethod.POST)
		public String writing(
				@RequestParam(value="boardTitle")String boardTitle,
				@RequestParam(value="boardWriter")String boardWriter,
				@RequestParam(value="boardPwd")String boardPwd,
				@RequestParam(value="boardContent")String boardContent) {

			
			Board newBoard = new Board(boardTitle,boardWriter,boardPwd,boardContent);
			
			dao.insert(newBoard);
			
			
			return "redirect:/";
		}
		
		@RequestMapping("/editBoard/{boardNum}")
		public String editBoard(@PathVariable("boardNum") int boardNum, Model model) {
			
			dao.updateCount(boardNum);
			Board board = dao.selectByBoardNum(boardNum);
		

			model.addAttribute("board", board);

			
			return "board/EditBoard";
		}
		
		@RequestMapping(value="/editBoard/edit", method=RequestMethod.POST)
		public String edit(
				@RequestParam(value="boardTitle")String boardTitle,
				@RequestParam(value="boardWriter")String boardWriter,
				@RequestParam(value="boardNum")int boardNum,
				@RequestParam(value="boardContent")String boardContent) {

			
			Board newBoard = new Board(boardTitle,boardWriter,boardNum,boardContent);
			
			dao.edit(newBoard);
			
			
			return "redirect:/";
		}
		
		@RequestMapping(value="/deleteBoard/{boardNum}")
		public String deleteBoard(@PathVariable("boardNum") int boardNum, Model model) throws IOException {
			
				dao.deleteBoardByCode(boardNum);
		
		return "redirect:/";
		}
	
		
		
	}
