package com.kington.zbgl.common;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.ResourceBundle;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.util.AntPathMatcher;

import com.jtframework.websupport.utils.EncryptUtil;
import com.kington.zbgl.common.PublicType.AttachType;

/**
 * 统一管理一些常用的方法或对象
 * 
 */
public class Common {

	/**
	 * 系统通用访问路径，此路径的请求不需要权限验证
	 */
	public static List<String> PUBLIC_PATH;

	/**
	 * 所有企业用户有权限访问的链接
	 */
	public static List<String> COMP_PATH;
	
	/**
	 * 所有后台管理员有权限访问的链接
	 */
	public static List<String> MANAGER_PATH;
	
	/**
	 * 高级权限列表，匹配的链接需要校验ID和KEY是否一致
	 * 先校验id,再校验ids
	 */
	public static List<String> TOP_PATH;
	
	public static String DEF_PWD;
	public static String DEF_YXNS;//证书有效年限
	public static String SYSTEM_TYPE;//#系统类型
	public static String EXPORT_PARA="EXPORT_PARA";//导出时使用的查询字段SESSIONKEY
	static {
		// 从配置文件读取已配置的通用路径
		ResourceBundle rb = ResourceBundle.getBundle("application");
		DEF_PWD = rb.getString("DEF_PWD");
		DEF_YXNS = rb.getString("DEF_YXNS");
		SYSTEM_TYPE = rb.getString("SYSTEM_TYPE");
		System.out.println("system_type:"+SYSTEM_TYPE);
		String TOP_PATHS = rb.getString("TOP_PATH");
		String[] s = StringUtils.split(TOP_PATHS, Common.SYMBOL_COMMA);
		TOP_PATH = new ArrayList<String>();
		for(String ss : s){
			TOP_PATH.add(ss);
		}
	}
	
	/**
	 * IP链接提交限制配置
	 */
	public static Map<String,Integer> IP_URL_MAP = null;	
	/**
	 * 系统在线用户
	 */
	public static Integer CUR_USER_NUM = 0;

	/**
	 * 空格
	 */
	public final static String SYMBOL_SPACES = " ";

	/**
	 * 逗号 ,
	 */
	public final static String SYMBOL_COMMA = ",";

	/**
	 * 百分号 %
	 */
	public final static String SYMBOL_PERCENT = "%";
	
	/**
	 * 等号 ,
	 */
	public final static String SYMBOL_EQUATE = "=";
	
	/**
	 * 连接符 &
	 */
	public final static String SYMBOL_A = "&";

	/**
	 * 网页基本路径 /
	 */
	public final static String BASE_PATH = "/";

	/**
	 * 返回界面 list
	 */
	public final static String PATH_LIST = "list";

	/**
	 * 返回界面 edit
	 */
	public final static String PATH_EDIT = "edit";
	/**
	 * 返回界面 audit
	 */
	public final static String PATH_AUDIT = "audit";

	/**
	 * 返回界面 single
	 */
	public final static String PATH_SINGLE = "single";

	/**
	 * 返回界面 multiple
	 */
	public final static String PATH_MULTIPLE = "multiple";

	/**
	 * 提示信息：操作成功
	 */
	public final static String OPER_SUCCESS = "操作成功";

	/**
	 * 提示信息：操作失败
	 */
	public final static String OPER_FAIL = "操作失败";
	

	/**
	 * 路径匹配对象
	 */
	public static AntPathMatcher matcher = new AntPathMatcher();
	
	public static void main(String[] args)throws Exception{
	}

	/**
	 * MD5加密密钥
	 */
	private final static String MD5_KEY = "_2SP5_4JG2_3dIEk.e";

	/**
	 * 获取加上密钥并加密后的串
	 * 
	 * @param text
	 * @return
	 */
	public static final String getMD5(String text) {
		return EncryptUtil.MD5(MD5_KEY + text);
	}
	

	private final static String IDMD5_KEY = "125";
	private final static String IDMD5_KEY2 = "895";

	public static final String getIdMD5(String text, String table) {
		return EncryptUtil.MD5(MD5_KEY + text + IDMD5_KEY + table.toUpperCase() + IDMD5_KEY2);
	}
	
	private final static String ATTACH_IDMD5_KEY = "2158EkliuSQa";
	/**
	 * 附件下载所需求的KEY
	 * @param text
	 * @param type
	 * @return
	 */
	public static final String getAttachMD5(String text,AttachType type) {
		if(StringUtils.isBlank(text) || type == null) return null;
		return EncryptUtil.MD5(ATTACH_IDMD5_KEY + text + type.getKey() );
	}

	/**
	 * 校验IDS的有效性，全部通过，号分隔，并能转换成Long
	 * 
	 * @param ids
	 * @return
	 */
	public static final boolean checkIds(String ids) {
		if (StringUtils.isBlank(ids))
			return false;

		String[] tmp = StringUtils.split(ids, SYMBOL_COMMA);
		Long l = null;
		try {
			for (String s : tmp) {
				l = new Long(s);
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	/**
	 * 校验LONG对象是否大于0
	 * 
	 * @param i
	 * @return:true Long是大于0的值
	 */
	public static final boolean checkLong(Long l) {
		if (l == null || l <= 0) {
			return false;
		} else {
			return true;
		}
	}

	/**
	 * 随机生成 a 到 b (包含b)的整数:
	 * 
	 * @return
	 */
	public static int makeRandom(int a, int b) {
		return (int) (Math.random() * (b - a + 1)) + a;
	}

	/**
	 * 
	 * @param request
	 * @return
	 */
	public static String getRequestPara(HttpServletRequest request){
		Map requestParams = request.getParameterMap();
		
		String valueStr = StringUtils.EMPTY;
		String name;
		String[] values;
		String rt = StringUtils.EMPTY;
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			name = (String) iter.next();
			values = (String[]) requestParams.get(name);
			valueStr = StringUtils.EMPTY;
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
			}
			rt += name + Common.SYMBOL_EQUATE + valueStr + Common.SYMBOL_A;
		}
		if(rt.length() > 1500)	rt = rt.substring(0,1500);
		if(rt.endsWith("&"))	rt = rt.substring(0,rt.length() -1);
		return rt;
	}
	
	/**
	 * 获取真实的IP地址
	 * @param request
	 * @return
	 */
	public final static String getRealIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
	
	/**
	 * 手机号验证
	 * 
	 * @param str
	 * 
	 * @return 验证通过返回true
	 */
	public static boolean isMobile(String str) {
		if(!StringUtils.isNotBlank(str)) return false;
		Pattern p = null;
		Matcher m = null;
		boolean b = false;
		p = Pattern.compile("^[1][3,4,5,8][0-9]{9}$"); // 验证手机号
		m = p.matcher(str);
		b = m.matches();
		return b;
	}
	
	/**
	 * 获取导出表头信息
	 * @param type
	 * @return
	 */
	public static String[] getExportHeader(String type){
		return null;
	}
	
	/**
	* 返回首字母
	* @param strChinese
	* @param bUpCase
	* @return
	*/
   public static String getPYIndexStr(String strChinese, boolean bUpCase){
       try{
           StringBuffer buffer = new StringBuffer();
           byte b[] = strChinese.getBytes("GBK");//把中文转化成byte数组
           for(int i = 0; i < b.length; i++){

               if((b[i] & 255) > 128){
                   int char1 = b[i++] & 255;
                   char1 <<= 8;//左移运算符用“<<”表示，是将运算符左边的对象，向左移动运算符右边指定的位数，并且在低位补零。其实，向左移n位，就相当于乘上2的n次方
                   int chart = char1 + (b[i] & 255);
                   buffer.append(getPYIndexChar((char)chart, bUpCase));
                   continue;
               }
               char c = (char)b[i];
               if(!Character.isJavaIdentifierPart(c))//确定指定字符是否可以是 Java 标识符中首字符以外的部分。
                   c = 'A';
               buffer.append(c);
           }
           return buffer.toString();

       }catch(Exception e){
           System.out.println((new StringBuilder()).append("\u53D6\u4E2D\u6587\u62FC\u97F3\u6709\u9519").append(e.getMessage()).toString());
       }

       return null;
   }

   /**
    * 得到首字母
    * @param strChinese
    * @param bUpCase
    * @return
    */
   private static char getPYIndexChar(char strChinese, boolean bUpCase){
       int charGBK = strChinese;
       char result;
       if(charGBK >= 45217 && charGBK <= 45252)
           result = 'A';
       else
       if(charGBK >= 45253 && charGBK <= 45760)
           result = 'B';
       else
       if(charGBK >= 45761 && charGBK <= 46317)
           result = 'C';
       else
       if(charGBK >= 46318 && charGBK <= 46825)
           result = 'D';
       else
       if(charGBK >= 46826 && charGBK <= 47009)
           result = 'E';
       else
       if(charGBK >= 47010 && charGBK <= 47296)
           result = 'F';
       else
       if(charGBK >= 47297 && charGBK <= 47613)
           result = 'G';
       else
       if(charGBK >= 47614 && charGBK <= 48118)
           result = 'H';
       else
       if(charGBK >= 48119 && charGBK <= 49061)
           result = 'J';
       else
       if(charGBK >= 49062 && charGBK <= 49323)
           result = 'K';
       else
       if(charGBK >= 49324 && charGBK <= 49895)
           result = 'L';
       else
       if(charGBK >= 49896 && charGBK <= 50370)
           result = 'M';
       else
       if(charGBK >= 50371 && charGBK <= 50613)
           result = 'N';
       else
       if(charGBK >= 50614 && charGBK <= 50621)
           result = 'O';
       else
       if(charGBK >= 50622 && charGBK <= 50905)
           result = 'P';
       else
       if(charGBK >= 50906 && charGBK <= 51386)
           result = 'Q';
       else
       if(charGBK >= 51387 && charGBK <= 51445)
           result = 'R';
       else
       if(charGBK >= 51446 && charGBK <= 52217)
           result = 'S';
       else
       if(charGBK >= 52218 && charGBK <= 52697)
           result = 'T';
       else
       if(charGBK >= 52698 && charGBK <= 52979)
           result = 'W';
       else
       if(charGBK >= 52980 && charGBK <= 53688)
           result = 'X';
       else
       if(charGBK >= 53689 && charGBK <= 54480)
           result = 'Y';
       else
       if(charGBK >= 54481 && charGBK <= 55289)
           result = 'Z';
       else
           result = (char)(65 + (new Random()).nextInt(25));
       if(!bUpCase)
           result = Character.toLowerCase(result);
       return result;
   }
   
   /**
	 * 校验list对象是否为空
	 * 
	 * @param i
	 * @return:true 不为空
	 */
   public static boolean checkList(List<?> list){
	   if(list == null || list.size() < 1)
		   return false;
	   else
		   return true;
				   
   }
   
   /**
  	 * 长宽高计算体积（注意单位换算）
  	 */
   public static Double multDouble(Double a , Double a1, Double a2){
	   BigDecimal b = new BigDecimal(Double.toString(a));
       BigDecimal b1 = new BigDecimal(Double.toString(a1));
       BigDecimal b2 = new BigDecimal(Double.toString(a2));
       BigDecimal b3 = new BigDecimal(1000000);
       
	   return  b.multiply(b1).multiply(b2).divide(b3).setScale(4,4).doubleValue();
   }
   
}
