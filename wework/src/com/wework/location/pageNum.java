package com.wework.location;

public class pageNum {
	public static final int pageSize = 12;
	public int listSize = 0;
	public int pageNum = 0;
	
	public pageNum() {
		// TODO Auto-generated constructor stub
		locationDAO dao = new locationDAO();
		this.listSize = dao.getCount();
		dao.closeDB();
		this.pageNum = ((listSize%pageSize)==0)?(listSize/pageSize):(listSize/pageSize)+1;
	}
	
	public int getPageSize() {
		return pageSize;
	}
	
	@Override
	public String toString() {
		return "pageNum [pageSize=" + pageSize + ", listSize=" + listSize + ", pageNum=" + pageNum + "]";
	}
}
