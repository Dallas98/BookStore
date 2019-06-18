package com.dao;

import com.model.Book;

public interface BookDao {//设定事物接口信息
	public int insert(Book g);//定义insert的方法，处理完毕后返回数据类型，传入参数为Book对象，g为别名

	public int update(Book g);//定义update的方法，处理完毕后返回数据类型，传入参数为Book对象，g为别名

	public int delete(Book g);//定义delete的方法，处理完毕后返回数据类型，传入参数为Book对象，g为别名
}
