package com.sys.tool;

import java.text.SimpleDateFormat;
import java.util.Date;  
  
/** 
 * @ClassName: MakeOrderNum 
 * @CreateTime 2015��9��13�� ����4:51:02 
 * @author : mayi 
 * @Description: ���������ɹ��ߣ����ɷ��ظ������ţ���������1����1000��������չ 
 * 
 */  
/** 
 * @ClassName: MakeOrderNum 
 * @CreateTime 2015��9��13�� ����4:51:02 
 * @author : mayi 
 * @Description: ���������ɹ��ߣ����ɷ��ظ������ţ���������1����1000��������չ 
 * 
 */  
public class MakeOrderNum {  
    /** 
     * �����󣬿���Ϊ������� 
     */  
    private static Object lockObj = "lockerOrder";  
    /** 
     * ���������ɼ����� 
     */  
    private static long orderNumCount = 0L;  
    /** 
     * ÿ�������ɶ������������ֵ 
     */  
    private int maxPerMSECSize=100;  
    /** 
     * ���ɷ��ظ������ţ���������1����100��������չ 
     * @param tname ������ 
     */  
    public String makeOrderNum() { 
    	// �������ɵĶ�����  
    	String finOrderNum = "";  
        try {  
            synchronized (lockObj) {  
                // ȡϵͳ��ǰʱ����Ϊ�����ű���ǰ�벿�֣���ȷ������  
                long nowLong = Long.parseLong(new SimpleDateFormat("hhmmss").format(new Date()));  
                // �����������ֵ���㣬����չ����Ŀǰ1���봦���ֵ1000����1��100��  
                if (orderNumCount > maxPerMSECSize) {  
                    orderNumCount = 0L;  
                }  
                //��װ������  
                String countStr=maxPerMSECSize +orderNumCount+"";  
                finOrderNum=nowLong+countStr.substring(1);  
                orderNumCount++;   
//                System.out.println(finOrderNum);
                // Thread.sleep(1000);  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return finOrderNum;
    }  
 /*
    public static void main(String[] args) {
		
    	MakeOrderNum m = new MakeOrderNum();
    	int a  = m.makeOrderNum();
    	System.out.println(a);
	}*/
}
