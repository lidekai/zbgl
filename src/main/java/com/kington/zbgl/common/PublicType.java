package com.kington.zbgl.common;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

import org.apache.commons.lang3.StringUtils;


/**
 * 统一管理系统枚举型对象或通用参数
 * 
 */
public class PublicType {

	/**
	 * 系统代号
	 */
	public final static String SYSTEM_CODE = "zbgl";

	/**
	 * 系统名称
	 */
	public final static String SYSTEM_NAME = "招标项目管理系统" ;

	/**
	 * 系统登录用户控制总数(预留)
	 */
	public final static Integer SYSTEM_USER_COUNT = 99;


	/**
	 * 通用配置类型(数据字典类型)
	 * 
	 */
	public static enum DictType {
		CLBMKT("材料编码开头")
		;
		private String text;
		public String getText() {
			return this.text;
		}
		private DictType(String str) {
			this.text = str;
		}
		public String getName() {
			return this.name();
		}
	}
	
	
	/**
	 * 状态类型
	 * 
	 */
	public static enum StateType {
		USE("启用"), 
		STOP("禁用"),
		
		;
		private String text;
		public String getText() {
			return this.text;
		}
		public String getName() {
			return this.name();
		}
		private StateType(String str) {
			this.text = str;
		}
	}
	
	
	/**
	 * 审核类型
	 */
	public static enum AuditType {
		Y("合格"), 
		N("不合格"),
		;
		private String text;
		public String getText() {
			return this.text;
		}
		public String getName() {
			return this.name();
		}
		private AuditType(String str) {
			this.text = str;
		}
	}
	

	/**
	 * 菜单权限类型
	 * 
	 */
	public static enum FuncType {
		MENU("菜单"), 
		BUTTON("按钮");
		private String text;

		public String getText() {
			return this.text;
		}

		public String getName() {
			return this.name();
		}

		private FuncType(String str) {
			this.text = str;
		}
	}

	/**
	 * 通过类型
	 * 
	 */
	public static enum IsType {
		Y("是"), 
		N("否");
		private String text;

		public String getText() {
			return this.text;
		}

		public String getName() {
			return this.name();
		}

		private IsType(String str) {
			this.text = str;
		}
		
	}

	/**
	 * 操作类型
	 */
	public static enum ActType {
		ADD("添加"), 
		EDIT("编辑"), 
		VIEW("查看"), 
		SHOW("查看"), 
		AUDIT("审核"), 
		SINGLE("单选"), 
		MULTIPLE("多选"),
		APPLY("申请"),
		REG("注册"),
		CUSPRO("客户存货"),
		REAUDIT("反审核");
		private String text;

		public String getText() {
			return this.text;
		}

		public String getName() {
			return this.name();
		}

		private ActType(String str) {
			this.text = str;
		}
	}
	public static enum NoticeType {
		NOTICE("通知公告"), 
		HELP("支持与帮助");

		private String text;

		public String getText() {
			return this.text;
		}

		public String getName() {
			return this.name();
		}

		private NoticeType(String str) {
			this.text = str;
		}
	}
	
	/**
	 * 附件类型
	 */
	public static enum AttachType{
		NDZC("年度自查","2356987412"),
		;
		private String text;
		private String key;//加密用KEY
		public String getText(){
			return this.text;
		}
		public String getKey(){
			return this.key;
		}
		public String getName(){
			return this.name();
		}
		private AttachType(String str,String str1){
			this.text = str;
			this.key = str1;
		}
	}

	/**
	 *	审批状态 
	 *
	 */
	public static enum ApproveState{
		DSP("待审批"),
		SPJS("审批结束");
		private String text;
		public String getText(){
			return this.text;
		}
		public String getName(){
			return this.name();
		}
		private ApproveState(String str){
			this.text = str;
		}
	}
	
	
	public static Connection getConn() throws Exception{
        Connection conn = null;
        try {
        	ResourceBundle rb = ResourceBundle.getBundle("jdbc1");
            String url = rb.containsKey("jdbc.url") ? rb.getString("jdbc.url") : null;
    		String username = rb.containsKey("jdbc.username") ? rb.getString("jdbc.username") : null;
    		String password  = rb.containsKey("jdbc.password") ? rb.getString("jdbc.password") : null;
    		String driver = rb.containsKey("jdbc.driver") ? rb.getString("jdbc.driver") : null;
    		
    		Class.forName(driver);
            conn = DriverManager.getConnection(url,username,password);
            return conn;
         } catch (SQLException e) {
             System.out.println("操作错误");
             System.out.println("SQL STATE: " + e.getSQLState());
             System.out.println("ERROR CODE: " + e.getErrorCode());
             System.out.println("MESSAGE: " + e.getMessage());
             System.out.println();
             e = e.getNextException();
             e.printStackTrace();
         } catch (Exception e) {
             e.printStackTrace();
         }
        return null;
		
	}
	
	public static String getDataBaseName() throws Exception{
		ResourceBundle rb = ResourceBundle.getBundle("jdbc1");
        String url = rb.containsKey("jdbc.url") ? rb.getString("jdbc.url") : null;
        String a = url.split(";")[1];
        String b = a.split("=")[1];
        if(StringUtils.isNotBlank(url))
        	return b.substring(7,10);
        else 
        	return null;
	}
	
	
	public static Float setFloatScale(Float a){
		if(a != null && !a.equals(0F)){
			BigDecimal b = new BigDecimal(Float.toString(a));
			return b.setScale(2, 4).floatValue();
		}else
			return 0F;
	}
	
	public static Double setDoubleScale(Double a){
		if(a != null && !a.equals(0d)){
			BigDecimal b = new BigDecimal(Double.toString(a));
			return b.setScale(2, 4).doubleValue();
		}else
			return 0d;
	}
	
	public static Double setDoubleDecimal(Double d , int pit){
		if(d != null && !d.equals(0d)){
			BigDecimal b = new BigDecimal(Double.toString(d));
			return b.setScale(pit, 4).doubleValue();
		}
		return d;
	} 
	
}
