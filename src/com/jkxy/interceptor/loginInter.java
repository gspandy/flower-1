package com.jkxy.interceptor;

import java.util.Map;

import com.jkxy.model.User;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class loginInter implements Interceptor {

	//@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		Map session=arg0.getInvocationContext().getSession();
		Map request=(Map) arg0.getInvocationContext().getContext().get("request");
		User user1=(User) session.get("user");
		System.out.println("进入拦截去。。。。");
		if(user1==null){
			request.put("msg", "请您登陆、、、、");
			return Action.LOGIN;
			
		}
		
		return arg0.invoke();
	}

	//@Override
	public void destroy() {
		
	}

	//@Override
	public void init() {
		
	}

}
