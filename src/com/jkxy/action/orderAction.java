package com.jkxy.action;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.jkxy.model.Orderitem;
import com.jkxy.model.Orders;
import com.jkxy.model.User;
import com.jkxy.service.ISaveOrderService;
import com.jkxy.tool.Cart;
import com.jkxy.tool.PaymentUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class orderAction extends ActionSupport {
	private ISaveOrderService saveOrderService;
	private static Logger logger=Logger.getLogger(orderAction.class);
	private String yh;
	

	public String getYh() {
		return yh;
	}

	public void setYh(String yh) {
		this.yh = yh;
	}

	public ISaveOrderService getSaveOrderService() {
		return saveOrderService;
	}

	public void setSaveOrderService(ISaveOrderService saveOrderService) {
		this.saveOrderService = saveOrderService;
	}
	
	
	 
	/**
	 * 1.0提交订单，从购物车中取出的所有的订单项OrderItem，并存入Order中
	 * 转发至 支付页面 进行支付
	 * @return
	 * @throws Exception
	 */
	public String checkOut() throws Exception{
		logger.info("提交订单");
		Map<String, Object> session=(Map)ActionContext.getContext().getSession();
		/*User user=(User) session.get("user");*/
		User user=new User();
		user.setUserid(6);
		Cart cart=(Cart) session.get("cart");
	 
		
		Orders order=new Orders();
		order.setOrderdate(new Timestamp(new Date().getTime()));
		order.setUser(user);
		for(Iterator itor=cart.getCartitems().values().iterator();itor.hasNext();){
			Orderitem orderitems=(Orderitem) itor.next();
			//把购物车里的订单 添加到 订单项 order
			order.getOrderitems().add(orderitems);
			orderitems.setOrders(order);
			
		}
		System.out.println("提交订单");
		
		saveOrderService.saveOrder(order);
		
		
		System.out.println("订单提交完成、、、、、");
		Map request=(Map) ActionContext.getContext().get("request");
		request.put("order",order);
		session.remove(cart);
		
		
		return SUCCESS;
	}
}






