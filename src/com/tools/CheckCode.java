package com.tools;

import java.awt.*;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.*;

/**
 *
 * @author administrator
 */
public class CheckCode extends HttpServlet {
	public CheckCode() {
		super();
	}

	// ��ȡ�����ɫ
	public Color getRandColor(int s, int e) {
		Random random = new Random();
		if (s > 255) s = 255;
		if (e > 255) e = 255;
		int r = s + random.nextInt(e - s);		//�������RGB��ɫ�е�rֵ
		int g = s + random.nextInt(e - s);		//�������RGB��ɫ�е�gֵ
		int b = s + random.nextInt(e - s);		//�������RGB��ɫ�е�bֵ
		return new Color(r, g, b);
	}

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/** ��ֹ����**/
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "No-cache");
		response.setDateHeader("Expires", 0);
		/**********/
		response.setContentType("image/jpeg");	// ָ�����ɵ���Ӧ��ͼƬ
		int width = 116;			//ָ����֤��Ŀ��
		int height = 33;			//ָ����֤��ĸ߶�
		
		BufferedImage image = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics();       //��ȡGraphics��Ķ���
		Random random = new Random();               //ʵ����һ��Random����
		Font mFont = new Font("����", Font.BOLD, 22);   //ͨ��Font��������
		g.fillRect(0, 0, width, height);                //������֤�뱳��
		g.setFont(mFont);           //��������
		g.setColor(getRandColor(180, 200));     //������ɫ
		// �����������
		for (int i = 0; i < 100; i++) {
			int x = random.nextInt(width - 1);
			int y = random.nextInt(height - 1);
			int x1 = random.nextInt(3) + 1;
			int y1 = random.nextInt(6) + 1;
            g.drawLine(x, y, x + x1, y + y1);       //����ֱ��
		}
        /**************************��һ������********************************/		
		BasicStroke bs=new BasicStroke(2f,BasicStroke.CAP_BUTT,BasicStroke.JOIN_BEVEL);	//����һ��������ѡ��������ϸ�Ķ���
		Graphics2D g2d = (Graphics2D) g;    //ͨ��Graphics��Ķ��󴴽�һ��Graphics2D��Ķ���
		g2d.setStroke(bs);					//�ı������Ĵ�ϸ
		g.setColor(Color.GRAY);		//���õ�ǰ��ɫΪԤ������ɫ�еĻ�ɫ
        int lineNumber=4;		//ָ���˵�ĸ���
		int[] xPoints=new int[lineNumber];      //���屣��x�����������
		int[] yPoints=new int[lineNumber];      //���屣��x�����������
        //ͨ��ѭ��Ϊx�������y����������鸳ֵ
		for(int j=0;j<lineNumber;j++){
			xPoints[j]=random.nextInt(width - 1);
			yPoints[j]=random.nextInt(height - 1);
		}
		g.drawPolyline(xPoints, yPoints,lineNumber);    //��������
        /*******************************************************************/
		String sRand = "";
		// ����������֤����
         for (int i = 0; i < 4; i++) {
            char ctmp = (char)(random.nextInt(26) + 65);	//����A~Z����ĸ
			sRand += ctmp;
			Color color = new Color(20 + random.nextInt(110), 20 + random
					.nextInt(110), 20 + random.nextInt(110));
			g.setColor(color);              //������ɫ
			/** **����������ֲ���������תָ���Ƕ�* */
			// ��������תָ���Ƕ�
			Graphics2D g2d_word = (Graphics2D) g;
			AffineTransform trans = new AffineTransform();
			trans.rotate(random.nextInt(45) * 3.14 / 180, 22 * i + 8, 7);
			// ��������
			float scaleSize = random.nextFloat() +0.8f;
			if (scaleSize > 1f)	scaleSize = 1f;
			trans.scale(scaleSize, scaleSize);          //��������
			g2d_word.setTransform(trans);
			/** ********************* */
			g.drawString(String.valueOf(ctmp), width/6 * i+23, height/2);

		}
		/** �����ɵ���֤�뱣�浽Session��***/
		HttpSession session = request.getSession(true);
		session.setAttribute("randCheckCode", sRand);
		/****************************/
		g.dispose();//���ٻ�ͼ��Ķ���
		ImageIO.write(image, "JPEG", response.getOutputStream());//ָ��ͼƬ�ĸ�ʽΪJPEG
	}
    	public void destroy() {
		super.destroy();
	}

	public void init() throws ServletException {
		super.init();
	}
}
