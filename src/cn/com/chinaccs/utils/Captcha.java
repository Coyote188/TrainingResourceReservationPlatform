package cn.com.chinaccs.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;

/**
 * 验证码
 * @date 2011-6-17 下午01:26:01
 * 
 * @author lmq
 *
 */
public class Captcha {
	
	    private ByteArrayInputStream image;//图像  
	    private String str;//验证码  
	    private int imageW;
	    private int imageH;
	    private int fontSize;
	    private Random random = new Random(); 
	    private BufferedImage buffImage;
	    //验证码序列。
	    /*private static final char[] randomSequence = new char[] { 'A', 'B', 'C', 'D', 'E', 'F', 'G',
	        'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
	        'U', 'V', 'W', 'X', 'Y', 'Z', '0','1', '2', '3', '4', '5', '6',
	        '7','8', '9' };*/
	    private static final char[] randomSequence = new char[] { 'A', 'B', 'C', 'D', 'E', 'F', 'G',
	        'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T',
	        'U', 'V', 'W', 'X', 'Y', '3', '4', '5', '6',
	        '7','8', '9' };
	    /*private static final char[] randomSequence = new char[] {'0','1', '2', '3', '4', '5', '6',
	        '7','8', '9' };*/
	      
	   private Captcha(int imageW,int imageH,int fontSize){ 
		   this.imageW = imageW;
		   this.imageH = imageH;
		   this.fontSize = fontSize;
	       init();//初始化属性  
	    }  
	     
	    public static Captcha Instance(int imageW,int imageH,int fontSize){  
	        return new Captcha(imageW,imageH,fontSize);  
	   }  
	     
	    public ByteArrayInputStream getImage(){  
	       return this.image;  
	   }  
	     
	    public String getString(){  
	        return this.str;  
	    }  
	      
	    private void init() {  
	        //       在内存中创建图象  
	    	buffImage = new BufferedImage(imageW, imageH, BufferedImage.TYPE_INT_RGB);  
	        //       获取图形上下文  
	        Graphics2D g = buffImage.createGraphics();  
	        //      生成随机类  
	        
	        //       设定背景色  
	       g.setColor(Color.WHITE);  
	       g.fillRect(0, 0, imageW, imageH);
	      //创建字体，字体的大小应该根据图片的高度来定。
	        Font font = new Font("Courier", Font.BOLD, fontSize);
	        //设置字体。
	        g.setFont(font);
	        //随机产生155条干扰线，使图象中的认证码不易被其它程序探测到  
	        
	       // g.setColor(getRandColor(160,200));
	     /*   g.setColor(Color.BLUE);
	        g.setStroke(new BasicStroke(2, BasicStroke.CAP_SQUARE, BasicStroke.JOIN_ROUND));
	        int[] xPoints = new int[2];
	        int[] yPoints = new int[2];
	        
	        for (int i=0;i<2;i++ ){  
	         int x = random.nextInt(imageW);  
	         int y = random.nextInt(imageH); 
	         xPoints[i] = x;
	         yPoints[i] = y; 
	        } 
	        g.drawPolygon(xPoints, yPoints, xPoints.length);*/
	        
	        FontMetrics fm = g.getFontMetrics();
	        int starX = (imageW-fm.stringWidth("A B C D"))/2;
	        int strW = fm.stringWidth("A ");
	        //       取随机产生的认证码(4位数字)  
	        String sRand="";  
	        g.setColor(Color.BLUE);
	        for (int i=0;i<4;i++ ){  
	          int index = random.nextInt(randomSequence.length-1);
	             String rand = String.valueOf(randomSequence[index]);
	             sRand +=rand;
	            // 将认证码显示到图象中  
	           // g.setColor(new Color(random.nextInt(150),random.nextInt(110),random.nextInt(110)));  
	            //      调用函数出来的颜色相同，可能是因为种子太接近，所以只能直接生成  
	             //TextLayout textLayout = new TextLayout(rand, font,new FontRenderContext(null, true, false));
	            int strH = fm.stringWidth(rand);
	            int x = starX+(strW*i);
	            g.drawString(rand,x,randY(strH));
	        }  
	        this.str=sRand;
	        //       图象生效  
	        g.dispose();  
	        buffImage = twistImage();
	        ByteArrayInputStream input=null;  
	        ByteArrayOutputStream output = new ByteArrayOutputStream();  
	        try{  
	            ImageOutputStream imageOut = ImageIO.createImageOutputStream(output);  
	            ImageIO.write(buffImage, "JPEG", imageOut);  
	            imageOut.close();  
	            input = new ByteArrayInputStream(output.toByteArray());  
	        }catch(Exception e){  
	            System.out.println("验证码图片产生出现错误："+e.toString());  
	        }  
	          
	        this.image=input; 
	    }  
	     
	    /**
	     * 
	     * @param strH
	     * @return
	     */
	    private int randY(int strH) {
	    	int y = 0;
	    	int count=0;
	    	while(true) {
	    		y = random.nextInt(imageH-5);
	    		if((y-strH)>5) {
	    			break;
	    		} else {
	    			if(count==5) {
	    				y = strH+6;
	    				break;
	    			}
	    		}
	    		count++;
	    	}
	    	return y;
	    }
	    
	    
	    /** 
	     *  
	     * @Description:获取扭曲后的x轴位置 
	     * @since 1.0.0 
	     * @Date:2012-3-1 下午3:17:53 
	     * @param dPhase 
	     * @param dMultValue 
	     * @param height 
	     * @param xPosition 
	     * @param yPosition 
	     * @return int 
	     */  
	    private int getXPosition4Twist(double dPhase, double dMultValue,int height, int xPosition, int yPosition) {  
	        double PI = 3.1415926535897932384626433832799; // 此值越大，扭曲程度越大  
	        double dx = (double) (PI * yPosition) / height + dPhase;  
	        double dy = Math.sin(dx);  
	        return xPosition + (int) (dy * dMultValue);  
	    }  
	    
	    
	    /** 
	     *  
	     * @Description:正弦曲线Wave扭曲图片 
	     * @since 1.0.0 
	     * @Date:2012-3-1 下午12:49:47 
	     * @return BufferedImage 
	     */  
	    private BufferedImage twistImage() {  
	        double dMultValue = random.nextInt(7) + 8;// 波形的幅度倍数，越大扭曲的程序越高，一般为3  
	        double dPhase = random.nextInt(6);// 波形的起始相位，取值区间（0-2＊PI）  
	        BufferedImage destBi = new BufferedImage(buffImage.getWidth(),buffImage.getHeight(), BufferedImage.TYPE_INT_RGB);  
	 
	        Graphics2D g = destBi.createGraphics();  
	        //      生成随机类  
	        
	        //       设定背景色  
	       g.setColor(Color.WHITE);  
	       g.fillRect(0, 0, imageW, imageH);
	        
	        for (int i = 0; i < destBi.getWidth(); i++) {  
	            for (int j = 0; j < destBi.getHeight(); j++) {  
	                int nOldX = getXPosition4Twist(dPhase, dMultValue,destBi.getHeight(), i, j);  
	                int nOldY = j;  
	                if (nOldX >= 0 && nOldX < destBi.getWidth() && nOldY >= 0 && nOldY < destBi.getHeight()) {  
	                    destBi.setRGB(nOldX, nOldY, buffImage.getRGB(i, j));  
	                }  
	            }  
	        }  
	        return destBi;  
	    }  
	    

		public int getImageW() {
			return imageW;
		}

		public void setImageW(int imageW) {
			this.imageW = imageW;
		}

		public int getImageH() {
			return imageH;
		}

		public void setImageH(int imageH) {
			this.imageH = imageH;
		}  
}
