package com.tools;

public class ChStr {
	/**
	 * ���ܣ����������������
	 * 
	 * @param str
	 * @return
	 */
	public String chStr(String str) {
		if (str == null) { // ������strΪnullʱ
			str = ""; // ������str��ֵΪ��
		} else {
			try {// ��׽�쳣
				str = (new String(str.getBytes("iso-8859-1"), "GBK")).trim();// ���ַ���ת��ΪGBK����
			} catch (Exception e) {// �����쳣
				e.printStackTrace(System.err); // ����쳣��Ϣ
			}
		}
		return str; // ����ת����ı���str
	}
	/**
	 * ���ܣ���ʾ�ı��еĻس����С��ո񼰱�֤HTML��ǵ��������
	 * 
	 * @param str1
	 * @return
	 */
	public String convertStr(String str1) {
		if (str1 == null) {
			str1 = "";
		} else {
			try {
				str1 = str1.replaceAll("<", "&lt;");// �滻�ַ����е�"<"��">"�ַ�����֤HTML��ǵ��������
				str1 = str1.replaceAll(">", "&gt;");
				str1 = str1.replaceAll(" ", "&nbsp;");
				str1 = str1.replaceAll("\r\n", "<br>");
			} catch (Exception e) {
				e.printStackTrace(System.err);
			}
		}
		return str1;
	}
}
