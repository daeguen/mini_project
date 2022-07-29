package shop;

public class CartDTO {
	private String memId;
	private int prodNum;

	private int totalpay;
	
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

	public int getTotalpay() {
		return totalpay;
	}

	public void setTotalpay(int totalpay) {
		this.totalpay = totalpay;
	}
}
