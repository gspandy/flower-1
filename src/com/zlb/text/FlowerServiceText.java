package com.zlb.text;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.jkxy.model.Flower;
import com.jkxy.model.User;
import com.jkxy.service.IFlowerService;
import com.jkxy.service.impl.UserService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = true) 
@Transactional
public class FlowerServiceText  extends AbstractTransactionalJUnit4SpringContextTests{

	@Test
	public void print(){
		System.out.println("spring  text   ");
	}
	@Autowired
	private IFlowerService flowerService;
	@Test
	public void findFlowerByNameText(){
		List<Flower> list=
				flowerService.getFlowerByName("红");
		if (list==null) {
			System.out.println("查询结果为空");}else{
		for (Flower flower : list) {
			System.out.println("-"+flower.getFlowername());
			
		}
			}
		 
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
	
}
