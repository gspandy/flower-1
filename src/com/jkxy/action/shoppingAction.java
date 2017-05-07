package com.jkxy.action;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.jkxy.model.Catalog;
import com.jkxy.model.Flower;
import com.jkxy.model.Orderitem;
import com.jkxy.service.IFlowerService;
import com.jkxy.service.impl.FlowerService;
import com.jkxy.tool.Cart;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

//import uk.ltd.getahead.dwr.util.Logger;

public class shoppingAction extends ActionSupport {
	private int flowerid;
	private int quantity=1;
	private IFlowerService flowerService;
	private static Logger logger=Logger.getLogger(shoppingAction.class);
	 

	public int getFlowerid() {
		return flowerid;
	}

	public void setFlowerid(int flowerid) {
		this.flowerid = flowerid;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public IFlowerService getFlowerService() {
		return flowerService;
	}

	public void setFlowerService(IFlowerService flowerService) {
		this.flowerService = flowerService;
	}
	/**
	 * 添加 花卉 到 购物车
	 * @return
	 * @throws Exception
	 */
	public String addToCart() throws Exception {
		logger.info("添加花品到购物车---flowerid=="+flowerid+"quantity=="+quantity);
	 	 //从数据库中查询出 相应的鲜花，加入购物车
		Flower flower = flowerService.getFlowerById(flowerid);
		//新建订单项
		Orderitem orderitem = new Orderitem();
		//把花卉信息 加入 订单项
		orderitem.setFlower(flower);
		orderitem.setQuantity(quantity);
		// 存储 购物车信息在 session中
		Map<String, Object> session =  ActionContext.getContext().getSession();
		// 没有购物车对象 则创建，有则直接加入 
		Cart cart = (Cart) session.get("cart");
		if (cart == null)
			cart = new Cart();
		cart.addFlower(flowerid, orderitem);
		
		
		session.put("cart", cart);
	 
		
		
		System.out.println("cart:"+cart.toString());
		// System.out.println(cart.getItems().size());  
		return SUCCESS;
	}
	/**
	 * 更新购物车
	 * @return
	 * @throws Exception
	 */
	public String updateCart() throws Exception {
		Map<String, Cart> session = (Map) ActionContext.getContext().getSession();
		
		Cart cart = (Cart) session.get("cart");
		cart.updateCart(flowerid, quantity);
		session.put("cart", cart);
		return SUCCESS;
	}
	/**
	 * 从购物车中删除一项
	 * @return
	 * @throws Exception
	 */
	public String deleteCart() throws Exception {
		Map<String, Cart> session = (Map) ActionContext.getContext().getSession();
		logger.info("从购物车删除商品 id ==" +flowerid);
		Cart cart = (Cart) session.get("cart");
		cart.delteCart(flowerid);
		session.put("cart", cart);
		return SUCCESS;
	}

	public String checkout() throws Exception {
		Map<String, Cart> session = (Map) ActionContext.getContext().getSession();

		Cart cart = (Cart) session.get("cart");
		cart.updateCart(flowerid, quantity);
		session.put("cart", cart);
		return SUCCESS;
	}
}
