package com.kington.zbgl.service.system;

import java.util.List;
import java.util.Map;

import com.kington.zbgl.model.system.RoleUser;
import com.kington.zbgl.model.system.User;
import com.kington.zbgl.model.system.UserVO;
import com.kington.zbgl.service.BaseService;

public interface UserService extends BaseService<User,UserVO>{

	public User getByCde(String cde) throws Exception;
	public UserVO getVOByCde(String cde) throws Exception;
	public boolean upatePWD(String userCde,String pwd) throws Exception;
	public boolean checkUserExists(String cde) throws Exception;
	public Long getUserIdByCode(String cde) throws Exception;
	
	public User getByCompanyId(Long id)throws Exception;
	
	public List<User> getList(UserVO vo) throws Exception;
	
	/**
	 * 导出处理，把表头信息和传入的对象组合成MAP
	 * @param heads
	 * @param company
	 * @param map
	 * @throws Exception
	 */
	public void exportCom(String[] heads , User po , Map<String,String> map)throws Exception;
	public void updateRoleUser(RoleUser roleUser);
	
	public List<User> getSalesman() throws Exception;
}
