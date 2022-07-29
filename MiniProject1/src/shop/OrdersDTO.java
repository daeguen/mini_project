package shop;

import java.sql.Timestamp;

public class OrdersDTO {
	private String orderId;
	private Timestamp orderDate;
	private String memName;
	private String orderPhone;
	private String memId;
	private String orderAddress;
	private int totalPay;
	private String orderPayMethod;			// 결제방법
	private String deliverPay;				// 배송비 
	private String InvoiceNum;				// 송장
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public Timestamp getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getOrderPhone() {
		return orderPhone;
	}
	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getOrderAddress() {
		return orderAddress;
	}
	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}
	public int getTotalPay() {
		return totalPay;
	}
	public void setTotalPay(int totalPay) {
		this.totalPay = totalPay;
	}
	public String getOrderPayMethod() {
		return orderPayMethod;
	}
	public void setOrderPayMethod(String orderPayMethod) {
		this.orderPayMethod = orderPayMethod;
	}
	public String getDeliverPay() {
		return deliverPay;
	}
	public void setDeliverPay(String deliverPay) {
		this.deliverPay = deliverPay;
	}
	public String getInvoiceNum() {
		return InvoiceNum;
	}
	public void setInvoiceNum(String invoiceNum) {
		InvoiceNum = invoiceNum;
	}
}
