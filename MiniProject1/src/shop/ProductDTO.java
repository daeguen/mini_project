package shop;

public class ProductDTO {
	private int prodNum;
	private String prodName;
	private String prodPhotoDir;
	private String prodPhotoOriName;
	private String prodPhotoSysName;
	private int prodPrice;
	
	public int getProdNum() {
		return prodNum;
	}
	public void setProdNum(int prodNum) {
		this.prodNum = prodNum;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public String getProdPhotoDir() {
		return prodPhotoDir;
	}
	public void setProdPhotoDir(String prodPhotoDir) {
		this.prodPhotoDir = prodPhotoDir;
	}
	public String getProdPhotoOriName() {
		return prodPhotoOriName;
	}
	public void setProdPhotoOriName(String prodPhotoOriName) {
		this.prodPhotoOriName = prodPhotoOriName;
	}
	public String getProdPhotoSysName() {
		return prodPhotoSysName;
	}
	public void setProdPhotoSysName(String prodPhotoSysName) {
		this.prodPhotoSysName = prodPhotoSysName;
	}
	public int getProdPrice() {
		return prodPrice;
	}
	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}
	
}
