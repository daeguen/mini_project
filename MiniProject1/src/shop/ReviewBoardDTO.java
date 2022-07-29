package shop;

import java.sql.Timestamp;

public class ReviewBoardDTO {
	private int revNum;
	private String memId;
	private int prodNum;
	private String revPasswd;
	private String revTitle;
	private String revPhotoOriName;
	private String revPhotoSysName;
	private String revContent;
	private Timestamp revDate;
	private int revHit;
	
	public int getRevNum() {
		return revNum;
	}
	public void setRevNum(int revNum) {
		this.revNum = revNum;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public int getProdNum() {
		return prodNum;
	}
	public void setProdNum(int prodNum) {
		this.prodNum = prodNum;
	}
	public String getRevPasswd() {
		return revPasswd;
	}
	public void setRevPasswd(String revPasswd) {
		this.revPasswd = revPasswd;
	}
	public String getRevTitle() {
		return revTitle;
	}
	public void setRevTitle(String revTitle) {
		this.revTitle = revTitle;
	}
	public String getRevPhotoOriName() {
		return revPhotoOriName;
	}
	public void setRevPhotoOriName(String revPhotoOriName) {
		this.revPhotoOriName = revPhotoOriName;
	}
	public String getRevPhotoSysName() {
		return revPhotoSysName;
	}
	public void setRevPhotoSysName(String revPhotoSysName) {
		this.revPhotoSysName = revPhotoSysName;
	}
	public String getRevContent() {
		return revContent;
	}
	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}
	public Timestamp getRevDate() {
		return revDate;
	}
	public void setRevDate(Timestamp revDate) {
		this.revDate = revDate;
	}
	public int getRevHit() {
		return revHit;
	}
	public void setRevHit(int revHit) {
		this.revHit = revHit;
	}
	
}
