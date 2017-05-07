package com.jkxy.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.jkxy.dao.IUserDao;
import com.jkxy.model.Guashi;
import com.jkxy.model.User;

public class UserDao implements IUserDao {
	private SessionFactory sessionfactory;

	public SessionFactory getSessionfactory() {
		return sessionfactory;
	}

	public void setSessionfactory(SessionFactory sessionfactory) {
		this.sessionfactory = sessionfactory;
	}

	//@Override
	public boolean addOrUpdateUser(User user) {
		Session ses = sessionfactory.openSession();
		Transaction trans = ses.beginTransaction();
		ses.saveOrUpdate(user);
		trans.commit();
		ses.close();

		return true;

	}

	//@Override
	public User checkUser(User user) {
		
		  Session session = sessionfactory.openSession();
		  Transaction ts = session.beginTransaction(); 
		 
		  
		  List userList=session.createCriteria(User.class).add(Restrictions.eq("username", user.getUsername()))
				  .add(Restrictions.eq("password", user.getPassword()))
				  .add(Restrictions.eq("role", user.getRole())).list();
		  User user1 = new User(); 
			  ts.commit(); 
			 
			 session.close(); 
			 if (userList.size() == 0) 
			 { return null; }
			  user1 = (User) userList.get(0);
			  return user1;
		 
		 
	}

	//@Override
	public boolean guashiUser(int id) {
		Session ses = sessionfactory.openSession();
		Transaction trans = ses.beginTransaction();
		Query query = ses.createQuery("from User where userid=" + id);
		User user1 = (User) query.list().get(0);
		Guashi guashi1 = new Guashi();
		guashi1.setUser(user1);
		user1.setGuashi(guashi1);
		ses.saveOrUpdate(guashi1);
		trans.commit();
		ses.close();

		return true;
	}

	//@Override
	public boolean jieguaUser(int id) {
		Session ses = sessionfactory.openSession();
		Transaction trans = ses.beginTransaction();
		Query query = ses.createQuery("from User where userid=" + id);
		User user1 = (User) query.list().get(0);
		ses.delete(user1.getGuashi());
		trans.commit();
		ses.close();
		return true;
	}

	//@Override
	public List getGuashi() {
		Session ses = sessionfactory.openSession();
		Transaction trans = ses.beginTransaction();
		Query query = ses.createQuery("from Guashi");
		List list = query.list();
		trans.commit();
		ses.close();
		return list;
	}

}
