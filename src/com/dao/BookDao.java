package com.dao;

import com.model.Book;

public interface BookDao {//�趨����ӿ���Ϣ
	public int insert(Book g);//����insert�ķ�����������Ϻ󷵻��������ͣ��������ΪBook����gΪ����

	public int update(Book g);//����update�ķ�����������Ϻ󷵻��������ͣ��������ΪBook����gΪ����

	public int delete(Book g);//����delete�ķ�����������Ϻ󷵻��������ͣ��������ΪBook����gΪ����
}
