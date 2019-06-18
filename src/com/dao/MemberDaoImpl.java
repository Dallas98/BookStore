package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Member;
import com.tools.ChStr;
import com.tools.ConnDB;

public class MemberDaoImpl implements MemberDao {
    ConnDB conn = new ConnDB();//����tools���µķ�����
    ChStr chStr = new ChStr();//����tools���µķ�����

    @Override

    public int insert(Member m) {
        int ret = -1;// ���ڼ�¼���¼�¼������
        try {// ��׽�쳣
            String sql = "Insert into tb_Member (UserName,TrueName,PassWord,City,address,postcode,"
                    + "CardNO,CardType,Tel,Email) values('"
                    + chStr.chStr(m.getUsername()) + "','" + chStr.chStr(m.getTruename()) + "','"
                    + chStr.chStr(m.getPwd()) + "','" + chStr.chStr(m.getCity()) + "','" + chStr.chStr(m.getAddress())
                    + "','" + chStr.chStr(m.getPostcode()) + "','" + chStr.chStr(m.getCardno()) + "','"
                    + chStr.chStr(m.getCardtype()) + "','" + chStr.chStr(m.getTel()) + "','" + chStr.chStr(m.getEmail())
                    + "')";// ����ʵ�ֱ����Ա��Ϣ��SQL���
            ret = conn.executeUpdate(sql);// ִ��SQL���ʵ�ֱ����Ա��Ϣ�����ݿ�
        } catch (Exception e) {// �����쳣
            e.printStackTrace();// ����쳣��Ϣ
            ret = 0;// ���ñ�����ֵΪ0����ʾ�����Ա��Ϣʧ��
        }
        conn.close();// �ر����ݿ������
        return ret;// ���ظ��¼�¼������
    }

    @Override

    public List select() {
        Member form = null;// ������Ա����
        List list = new ArrayList();// ����һ��List���϶������ڱ����Ա��Ϣ
        String sql = "select * from tb_member";// ��ѯȫ����Ա��Ϣ��SQL���
        ResultSet rs = conn.executeQuery(sql);// ִ�в�ѯ����
        try {// ��׽�쳣
            while (rs.next()) {
                form = new Member();// ʵ����һ����Ա����
                form.setID(Integer.valueOf(rs.getString(1)));// ��ȡ��ԱID
                list.add(form);// �ѻ�Ա��Ϣ��ӵ�List���϶�����
            }
        } catch (SQLException ex) {// �����쳣
        }
        conn.close();// �ر����ݿ������
        return list;
    }

    // ִ��ɾ������
    public int delete(Member m) {
        String sql = "delect from tb_member where ID=" + m.getID();
        int ret = conn.executeUpdate(sql);
        conn.close();
        return 0;
    }


    // ִ���޸Ĳ���
    public int update(Member m) {
        int ret = -1;
        try {
            String sql = "update tb_member set TrueName='" + chStr.chStr(m.getTruename()) + "',UserName='"
                    + chStr.chStr(m.getUsername()) + "',PassWord='" + chStr.chStr(m.getPwd()) + "',City='"
                    + chStr.chStr(m.getCity()) + "',address='" + chStr.chStr(m.getAddress()) + "',postcode='"
                    + chStr.chStr(m.getPostcode()) + "',CardNO='" + chStr.chStr(m.getCardno()) + "',CardType='"
                    + chStr.chStr(m.getCardtype()) + "',Tel='" + chStr.chStr(m.getTel()) + "',Email='"
                    + chStr.chStr(m.getEmail()) + "' where ID=" + m.getID();
            ret = conn.executeUpdate(sql);
            System.out.println(sql);
        } catch (Exception e) {
            e.printStackTrace();
            ret = 0;
        }
        conn.close();//�ر����ݿ�����
        return ret;
    }

    public Member select1() {
        return null;
    }
}
