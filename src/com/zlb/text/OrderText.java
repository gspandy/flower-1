package com.zlb.text;

import java.util.UUID;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.jkxy.model.Orders;
import com.jkxy.model.User;
import com.jkxy.service.impl.FlowerService;
import com.jkxy.service.impl.SaveOrderService;
import com.jkxy.service.impl.UserService;

public class OrderText {
	/**
	 * 测试 获得最后一个订单的id （最新的订单）
	 */
	@Test 
	public void test() {
		 ClassPathXmlApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
		 SaveOrderService  service =(SaveOrderService) ctx.getBean("saveService");
		Orders order= service.findOrderLast();
		System.out.println("orderid=="+order.getOrderid());
	}
	/**
	 * UUID 获取测试
	 */
	@Test
	public void getUUID(){
		
		System.out.println("uuid=="+this.uuid());
	}
	public static String uuid() {
		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
	}
	
	/**
	 * user 用户登录验证测试
	 */
	
	
	public User checkUser(User user){
		 ClassPathXmlApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
		 UserService  service =(UserService) ctx.getBean("userService");
		User  u = service.checkUser(user);
	 
		
		return u;
	}
	@Test
	public void printUser(){
		User user=new User(2,"admin","admin","admin");
		User u=this.checkUser(user);
		System.out.println("user checked resule=="+user);
	}
	
	/**
	 * 测试 删除花品
	 */
	
	public void deleteFloser(int flowerid){
		 ClassPathXmlApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
		 FlowerService  service =(FlowerService) ctx.getBean("flowerService");
		 service.deleteFlower(flowerid);
	 
	}
	@Test
	public void delete(){
		
		deleteFloser(19);
	}
}















