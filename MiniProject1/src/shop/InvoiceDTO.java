package shop;

public class InvoiceDTO {
	private String orderInvoiceNum;
	private String orderAddress;
	private int orderNum;
	
	public String getOrderInvoiceNum() {
		return orderInvoiceNum;
	}
	public void setOrderInvoiceNum(String orderInvoiceNum) {
		this.orderInvoiceNum = orderInvoiceNum;
	}
	public String getOrderAddress() {
		return orderAddress;
	}
	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	
}
