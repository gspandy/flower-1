package com.jkxy.action;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.jkxy.dao.impl.FlowerDao;
import com.jkxy.model.Catalog;
import com.jkxy.model.Flower;
import com.jkxy.service.ICatalogService;
import com.jkxy.service.IFlowerService;
import com.jkxy.util.Pager;
import com.jkxy.util.uploadFile;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
public class flowerAction extends ActionSupport {
	private ICatalogService catalogService;
	private IFlowerService flowerService;
	private int catalogid;
	private int currentPage=1;
	private File upload;
	private String uploadFileName;
	private Flower flower;
	private String picture;
	private int flowerid;
	private String flowerName;  // search  模块 flower  名
	private static   Logger logger=  Logger.getLogger(FlowerDao.class);
	
	
	
	
	
	public int getFlowerid() {
		return flowerid;
	}

	public void setFlowerid(int flowerid) {
		this.flowerid = flowerid;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public Flower getFlower() {
		return flower;
	}

	public void setFlower(Flower flower) {
		this.flower = flower;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public int getCatalogid() {
		return catalogid;
	}

	public void setCatalogid(int catalogid) {
		this.catalogid = catalogid;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	

	public IFlowerService getFlowerService() {
		return flowerService;
	}

	public void setFlowerService(IFlowerService flowerService) {
		this.flowerService = flowerService;
	}

	public ICatalogService getCatalogService() {
		return catalogService;
	}

	public void setCatalogService(ICatalogService catalogService) {
		this.catalogService = catalogService;
	}
	/**
	 *1. 获取 花品 分类，在首页页面加载出来
	 * @return
	 * @throws Exception
	 */
	public String browseCatalog() throws Exception{

		List<Catalog> catalogs=catalogService.getAllCatalogs();
		Map<String, Object> request=(Map) ActionContext.getContext().get("request");
		Map<String, Object> session=ActionContext.getContext().getSession();
		request.put("catalogs",catalogs);
		//把目录信息放到session中
		session.put("catalogs", catalogs);
		 System.out.println("查询目录");
		 
		 List<Flower> flowers=flowerService.getNewFlower();
		 request.put("newflowers",flowers);
		 request.put("msg", "flowers");
		 logger.info("查询最新入库花卉、、、");
		return SUCCESS;
	}
	/**
	 * 2.获取 最新的 花卉，即 数据库中 前八条数据
	 * @return
	 * @throws Exception
	 */
	public String browseFlower() throws Exception{
		List<Flower> flowers=flowerService.getNewFlower();
		Map request=(Map) ActionContext.getContext().get("request");
		request.put("newflowers",flowers);
		request.put("msg", "flowers");
		logger.debug("查询最新入库花卉、、、");
		 
		return SUCCESS;
	}
	/**
	 * 3.分页 查询 鲜花 
	 * 按照 目录 分页查询 鲜花
	 * @return
	 * @throws Exception
	 */
	public String browseFlowerPaging() throws Exception{
		// 查询 该分类下 鲜花的总数
		int totalSize=flowerService.getTotalByCatalog(catalogid);
		// pager工具类，传入参数 当前页码 和 总记录数 ，计算得到 页码信息
		Pager pager=new Pager(currentPage,totalSize);
		Map<String, Object> request=(Map) ActionContext.getContext().get("request");
		// 分页查询方法调用
		List<Flower> flowers=flowerService.getFlowerByCatalogidPaging(catalogid, currentPage, pager.getPageSize());
		
		
		// 查询 目录

		List<Catalog> catalogs=catalogService.getAllCatalogs();
		request.put("catalogs",catalogs);
		 
		//  返回结果
		request.put("flowers", flowers);
		request.put("pager", pager);
		request.put("msg", "分页查询");
		
		return SUCCESS;
	}
	/**
	 * 4.
	 * 花品的 增加 和 信息修改
	 * @return
	 * @throws Exception
	 */
	public String addOrUpdateFlower() throws Exception {
		//获取 存储路径
		String  path=ServletActionContext.getServletContext().getRealPath("/pic");
		System.out.println("上传路径:"+path);
		//获取 最大的id
		Flower flower1=(Flower) flowerService.getNewFlower().get(0);
		//拼装 上传文件名 和 路径
		int maxId=flower1.getFlowerid()+1;
		path=path+"\\"+maxId+this.getUploadFileName();
		//文件写入
		new uploadFile().upload(this.getUpload(), path);
		//拼装 后的 文件名 
		flower.setPicture(maxId+this.getUploadFileName());
		
		//上传来的 对象 赋给 flower2
		Flower flower2=new Flower();
		flower2.setCatalog(flower.getCatalog());
		flower2.setFlowername(flower.getFlowername());
		flower2.setPrice(flower.getPrice());
 	    flower2.setFlowerid(flower.getFlowerid());
		if(flower.getPicture()==null)
 	    	 flower2.setPicture(picture);	
 	    else
 	    flower2.setPicture(flower.getPicture());
 	    
 	    if (flowerService.addOrUpdateFlower(flower2))

			return SUCCESS;
		else 
			return ERROR;			
	}
	
	/**
	 * 5.管理花品 获取所有花品
	 * @return
	 * @throws Exception
	 */
	public String browseAllFlower() throws Exception{
		System.out.println("管理花品");
		List flowers=flowerService.getAllFlower();
		Map request=(Map)ActionContext.getContext().get("request");
		request.put("flowers", flowers);
		
		return "success";
	}
	
	/**
	 * 6.按照 id查询 花卉详情
	 * @return
	 * @throws Exception
	 */
	public String displayOneFolwer() throws Exception{
		// 查询花卉 详情
		Map<String, Object> request =(Map) ActionContext.getContext().get("request");
		Flower moditiedflower=flowerService.getFlowerById(flowerid);
		

		// 查询 目录

		List<Catalog> catalogs=catalogService.getAllCatalogs();
		request.put("catalogs",catalogs);
		 
		request.put("flower", moditiedflower);
		return "success";
		
		
	}
	/**
	 * 7.删除 物品
	 * 没有 删除本地图片
	 * @return
	 * @throws Exception
	 */
	public String deleteFlower() throws Exception{
		
		Map request=(Map) ActionContext.getContext().get("request");
		request.put("delete", this.getFlowerid());
		flowerService.deleteFlower(flowerid);
		System.out.println("删除成功");
		return "success";
	}
	/**
	 * 8.0 按照花品名查找花品
	 * 模糊查找 search 模块
	 */
	public  String searchFlower(){
		logger.info("search flowerName=="+flower.getFlowername());
		Map<String, List<Flower>> request=(Map) ActionContext.getContext().get("request");
		List<Flower> listFolwer=flowerService.getFlowerByName(flower.getFlowername());
		request.put("flowers",listFolwer);
		return SUCCESS;
		
	}
}




