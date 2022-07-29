package shop;

import java.sql.Timestamp;

public class QnABoardDTO {
	private int qnaNum;
	private String qnaPasswd;
	private String qnaTitle;
	private String qnaContent;
	private String qnaPhotoDir;
	private String qnaPhotoOriName;
	private String qnaPhotoSysName;
	private Timestamp qnaDate;
	private int qnaHit;
	private String memId;
	
	public int getQnaNum() {
		return qnaNum;
	}
	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}
	public String getQnaPasswd() {
		return qnaPasswd;
	}
	public void setQnaPasswd(String qnaPasswd) {
		this.qnaPasswd = qnaPasswd;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public String getQnaPhotoDir() {
		return qnaPhotoDir;
	}
	public void setQnaPhotoDir(String qnaPhotoDir) {
		this.qnaPhotoDir = qnaPhotoDir;
	}
	public String getQnaPhotoOriName() {
		return qnaPhotoOriName;
	}
	public void setQnaPhotoOriName(String qnaPhotoOriName) {
		this.qnaPhotoOriName = qnaPhotoOriName;
	}
	public String getQnaPhotoSysName() {
		return qnaPhotoSysName;
	}
	public void setQnaPhotoSysName(String qnaPhotoSysName) {
		this.qnaPhotoSysName = qnaPhotoSysName;
	}
	public Timestamp getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(Timestamp qnaDate) {
		this.qnaDate = qnaDate;
	}
	public int getQnaHit() {
		return qnaHit;
	}
	public void setQnaHit(int qnaHit) {
		this.qnaHit = qnaHit;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	
}
