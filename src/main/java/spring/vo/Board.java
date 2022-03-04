package spring.vo;

import java.sql.Date;

public class Board {

	private int boardNum;
	private String boardWriter;
	private String boardTitle;
	private String boardContent;
	private Date boardRegdate;
	private String boardPwd;
	private int boardCount;

	

	public Board() {

	}
	

	public Board(String boardTitle, String boardWriter, int boardNum, String boardContent) {
		this.boardNum = boardNum;
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
	}



	public Board(int boardNum, String boardWriter, String boardTitle,  Date boardRegdate,
			String boardPwd, int boardCount) {
		this.boardNum = boardNum;
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.boardRegdate = boardRegdate;
		this.boardPwd = boardPwd;
		this.boardCount = boardCount;
	}
	

	public Board(int boardNum, String boardWriter, String boardTitle, String boardContent, Date boardRegdate,
			String boardPwd, int boardCount) {

		this.boardNum = boardNum;
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardRegdate = boardRegdate;
		this.boardPwd = boardPwd;
		this.boardCount = boardCount;
	}

	

	public Board(String boardTitle, String boardWriter, String boardPwd, String boardContent) {

		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardPwd = boardPwd;
	}

	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getBoardWriter() {
		return boardWriter;
	}
	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public Date getBoardRegdate() {
		return boardRegdate;
	}
	public void setBoardRegdate(Date boardRegdate) {
		this.boardRegdate = boardRegdate;
	}
	public String getBoardPwd() {
		return boardPwd;
	}
	public void setBoardPwd(String boardPwd) {
		this.boardPwd = boardPwd;
	}
	public int getBoardCount() {
		return boardCount;
	}
	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}
	
	
	
}
