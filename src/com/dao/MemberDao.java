package com.dao;

import java.util.List;	//����List��

import com.model.Member;//�����Աģ����

public interface MemberDao {
	public int insert(Member m);// �����Ա��Ϣ

	public List select(); // ��ѯ��Ա��Ϣ

	public int update(Member m);

	public int delete(Member m);

	public Member select1();
}
