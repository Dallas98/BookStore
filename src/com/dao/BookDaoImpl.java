package com.dao;

import com.model.Book;
import com.tools.ChStr;
import com.tools.ConnDB;

public class BookDaoImpl implements BookDao {
	ConnDB conn = new ConnDB();//����tools���µķ�����
	ChStr chStr = new ChStr();//����tools���µķ�����
	
	/**
	 * ��������
	 * 
	 */
	public int insert(Book g) {
		int ret = -1;//�趨����ֵ����
		try {
			//�趨ִ�����
			String sql = "Insert into tb_book (TypeID,BookName,Introduce,Price,nowPrice,picture,newbook,sale) values("
					+ g.getTypeID()
					+ ",'"
					+ chStr.chStr(g.getBookName())
					+ "','"
					+ chStr.chStr(g.getIntroduce())
					+ "',"
					+ g.getPrice()
					+ ","
					+ g.getPrice()
					+ ",'"
					+ chStr.chStr(g.getPicture())
					+ "',"
					+ g.getNewBook()
					+ "," + g.getSale() + ")";

			ret = conn.executeUpdate(sql);//ִ����䣬�����ݿ�������
		} catch (Exception e) {
			ret = 0;
		}
		conn.close();//�ر����ݿ�����
		return ret;
	}

	/**
	 * ���²���
	 * 
	 */
	public int update(Book g) {
		int ret = -1;//�趨����ֵ����
		try {
			//�趨ִ�����
			String sql = "update tb_Book set TypeID=" + g.getTypeID()
					+ ",BookName='" + chStr.chStr(g.getBookName())
					+ "',introduce='" + chStr.chStr(g.getIntroduce())
					+ "',price=" + g.getPrice() + ",nowprice="
					+ g.getNowPrice() + ",picture='"
					+ chStr.chStr(g.getPicture()) + "',newbook="
					+ g.getNewBook() + ",sale=" + g.getSale() + " where ID="
					+ g.getID();
			ret = conn.executeUpdate(sql);//ִ����䣬�����ݿ�������
		} catch (Exception e) {
			ret = 0;
		}
		conn.close();//�ر����ݿ�����
		return ret;
	}
	
	/**
	 * ɾ������
	 * 
	 */
	public int delete(Book g) {
		int ret = -1;//�趨����ֵ����
		try {
			//�趨ִ�����
			String sql = "Delete from tb_book where ID=" + g.getID();
			ret = conn.executeUpdate(sql);//ִ����䣬�����ݿ�������
		} catch (Exception e) {
			ret = 0;
		}
		conn.close();//�ر����ݿ�����
		return ret;

	}

}