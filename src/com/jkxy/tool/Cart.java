package com.jkxy.tool;

 
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.jkxy.model.Flower;
import com.jkxy.model.Orderitem;

public class Cart {
	private Map<Integer, Orderitem> cartitems;
	
	

	public Map getCartitems() {
		return cartitems;
	}

	public void setCartitems(Map cartitems) {
		this.cartitems = cartitems;
	}

	public Cart() {
		// TODO Auto-generated constructor stub
		if (cartitems == null)
			cartitems = new HashMap<Integer, Orderitem>();
	}
	/**
	 * 添加 花品到购物车
	 * @param flowerId
	 * @param orderitem
	 */
	public void addFlower(int flowerId, Orderitem orderitem) {
		if (cartitems.containsKey(flowerId)) {
			Orderitem _orderitem = (Orderitem) cartitems.get(flowerId);
			orderitem.setQuantity(_orderitem.getQuantity()
					+ orderitem.getQuantity());
			cartitems.put(flowerId, orderitem);
		}  else
			cartitems.put(flowerId, orderitem);
	}
	/**
	 * 更改 物品的数量
	 * @param flowerId
	 * @param quantity
	 */
	public void updateCart(int flowerId, int quantity) {
		Orderitem orderitem = (Orderitem) cartitems.get(flowerId);
		orderitem.setQuantity(quantity);
		cartitems.put(flowerId, orderitem);
	}
	/**
	 * 从购物车中 删除
	 * @param flowerid
	 * @param quantity
	 */
	public void delteCart(int flowerid) {
		 cartitems.remove(flowerid);
		
	}
	
	/**
	 * 计算所有商品的总价格
	 * @return
	 */
	public int getTotalPrice() {
		int totalPrice = 0;
		for (Iterator it = cartitems.values().iterator(); it.hasNext();) {
			Orderitem orderitem = (Orderitem) it.next();
			Flower flower = orderitem.getFlower();
			int quantity = orderitem.getQuantity();
			totalPrice += flower.getPrice() * quantity;
		}
		return totalPrice;
	}

	 
}
