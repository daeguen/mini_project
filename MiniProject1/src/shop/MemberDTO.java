package shop;

import java.sql.Timestamp;

public class MemberDTO {
	private String memId;
	private String memPasswd;
	private String memName;
	private String memZonecode;
	private String memAddress;
	private String memBuildingName;
	private String memAddrDetail;
	private String memEmail;
	private String memPhone;
	private int memStamp;
	private Timestamp memRegDate;
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPasswd() {
		return memPasswd;
	}
	public void setMemPasswd(String memPasswd) {
		this.memPasswd = memPasswd;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemZonecode() {
		return memZonecode;
	}
	public void setMemZonecode(String memZonecode) {
		this.memZonecode = memZonecode;
	}
	public String getMemAddress() {
		return memAddress;
	}
	public void setMemAddress(String memAddress) {
		this.memAddress = memAddress;
	}
	public String getMemBuildingName() {
		return memBuildingName;
	}
	public void setMemBuildingName(String memBuildingName) {
		this.memBuildingName = memBuildingName;
	}
	public String getMemAddrDetail() {
		return memAddrDetail;
	}
	public void setMemAddrDetail(String memAddrDetail) {
		this.memAddrDetail = memAddrDetail;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	public int getMemStamp() {
		return memStamp;
	}
	public void setMemStamp(int memStamp) {
		this.memStamp = memStamp;
	}
	public Timestamp getMemRegDate() {
		return memRegDate;
	}
	public void setMemRegDate(Timestamp memRegDate) {
		this.memRegDate = memRegDate;
	}
	
}
