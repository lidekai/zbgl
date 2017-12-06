package com.kington.zbgl.service.system;


import com.kington.zbgl.model.system.LoginUser;
import com.kington.zbgl.model.system.LoginUserVO;
import com.kington.zbgl.service.BaseService;

public interface LoginUserService extends BaseService<LoginUser,LoginUserVO> {
	
	/**
	 * 用户登录操作
	 * 
	 * @param userVO
	 * @throws Exception
	 */
	public boolean doLogin(LoginUser po) throws Exception;
	
	/**
	 * 获取用户登录情况
	 * @param userCde
	 * @return
	 * @throws Exception
	 */
	public LoginUser getUserLogin(String userCde) throws Exception;
	public LoginUserVO getUserLoginVO(String userCde) throws Exception;
	
	/**
	 * 获取用户的登陆次数
	 * @return
	 * @throws Exception
	 */
	public Integer getLoginCount() throws Exception;
	
	/**
	 * 退出系统
	 * @param userCde
	 * @return
	 * @throws Exception
	 */
	public boolean doLoginOut(String userCde) throws Exception;
	
	//用户最后的登录信息
	public LoginUser getLastLoginInfo(String userCde)throws Exception;
}