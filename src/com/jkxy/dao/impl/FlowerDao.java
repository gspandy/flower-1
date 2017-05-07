package com.jkxy.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.jkxy.dao.IFlowerDao;
import com.jkxy.model.Flower;

public class FlowerDao implements IFlowerDao {
	private static   Logger logger=  Logger.getLogger(FlowerDao.class);
	public SessionFactory sessionfactory;

	public SessionFactory getSessionfactory() {
		return sessionfactory;
	}

	public void setSessionfactory(SessionFactory sessionfactory) {
		this.sessionfactory = sessionfactory;
	}

	//@Override
	public List getNewFlower() {
		Session ses = sessionfactory.openSession();
		Transaction trans = ses.beginTransaction();
		Query query = ses.createQuery("from Flower order by flowerid desc");
		query.setFirstResult(0);
		query.setMaxResults(8);
		List flowers = query.list();
		trans.commit();
		ses.close();
	
		return flowers;
	}

	//@Override
	public List getFlowerByCatalogidPaging(int catalogid, int currentPage,
			int pageSize) {
		Session ses = sessionfactory.openSession();
		Transaction trans = ses.beginTransaction();
		Query query = ses.createQuery("from Flower where catalogid="
				+ catalogid);
		int startRow = (currentPage - 1) * pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		
		List flowers = query.list();
		trans.commit();
		ses.close();
		logger.info("我正在分类查询、、、、");
		return flowers;
	}

	//@Override
	public int getTotalByCatalog(int catalogid) {
		Session ses = sessionfactory.openSession();
		Transaction trans = ses.beginTransaction();
		Query query = ses.createQuery("from Flower where catalogid="
				+ catalogid);
		List flowers = query.list();
		trans.commit();
		ses.close();

		return flowers.size();
	}

	//@Override
	public Flower getFlowerById(int id) {

		Session ses = sessionfactory.openSession();
		Transaction trans = ses.beginTransaction();
		Query query = ses.createQuery("from Flower where flowerId=" + id);
		List flower = query.list();
		trans.commit();
		ses.close();
		return (Flower) flower.get(0);
	}

	//@Override
	public boolean addOrUpdateFlower(Flower flower) {
		Session ses = sessionfactory.openSession();
		Transaction trans = ses.beginTransaction();
		ses.saveOrUpdate(flower);

		ses.flush();
		ses.clear();
		trans.commit();
		ses.close();
		return true;
	}

	//@Override
	public List getAllFlower() {
		Session ses = sessionfactory.openSession();
		Transaction trans = ses.beginTransaction();
		Query query = ses.createQuery("from Flower order by catalogid desc");
		List flowers = query.list();

		trans.commit();
		ses.close();

		return flowers;
	}

	//@Override
	public boolean deleteFlower(int flowerid) {
		Session ses = sessionfactory.openSession();
		Transaction trans = ses.beginTransaction();
		Flower flower = (Flower) ses.createQuery("from Flower f where f.flowerid=" + flowerid).list()
				.get(0);
		ses.delete(flower);
		trans.commit();
		ses.close();
		return true;
	}
	/**
	 * 查询 花品 按照名字
	 */
	//@Override
	public List<Flower> getFlowerByName(String flowerName) {
		Session ses=sessionfactory.openSession();
		Transaction trans=ses.beginTransaction();
		Query query=ses.createQuery("from Flower  f where f.flowername like '%" + flowerName + "%'");
		/*Query query=ses.createSQLQuery("SELECT * FROM flower WHERE flower.flowername LIKE '%梦%'");*/
		trans.commit();
		ses.clear();
		List<Flower> listFlower=query.list();
		return listFlower;
	}

}
