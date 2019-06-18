package com.dao;

import java.util.List;	//导入List类

import com.model.Member;//导入会员模型类

public interface MemberDao {
	public int insert(Member m);// 保存会员信息

	public List select(); // 查询会员信息

	public int update(Member m);

	public int delete(Member m);

	public Member select1();
}
