package com.model;

public class Book {//����һ��ʵ�����
  private Integer ID=Integer.getInteger("-1");//����һ�������ͱ���
  private int typeID=-1;//����һ�������ͱ�������ͬ
  private String bookName="";//����һ���ַ��ͱ�������ͬ
  private String introduce="";
  private float price=0f;//����һ�������ͱ�������ͬ
  private float nowPrice=0f;
  private String  picture="";
  private int newBook=-1;
  private int sale=-1;

  public void book(){
  }

  public Integer getID(){
 return ID;
}
public void setID(Integer ID){
 this.ID=ID;
}

  public int getTypeID() {
    return typeID;
  }
public void setTypeID(int typeID) {
  this.typeID = typeID;
}

public String getBookName(){
  return bookName;
}
public void setBookName(String bookName){
  this.bookName=bookName;
}

public String getIntroduce(){
  return introduce;
}
public void setIntroduce(String introduce){
  this.introduce=introduce;
}
public float getPrice(){
  return price;
}
public void setPrice(float price){
  this.price=price;
}
public float getNowPrice(){
  return nowPrice;
}
public void setNowPrice(float nowPrice){
  this.nowPrice=nowPrice;
}
public String getPicture(){
  return picture;
}
public void setPicture(String picture){
  this.picture=picture;
}
public int getNewBook() {
  return newBook;
}
public void setNewBook(int newBook) {
this.newBook = newBook;
}
public int getSale() {
  return sale;
}
public void setSale(int sale) {
this.sale = sale;
}
}
