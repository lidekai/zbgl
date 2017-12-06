package com.kington.zbgl.model.system;

import org.apache.commons.lang.StringUtils;

import com.kington.zbgl.common.Common;
import com.kington.zbgl.common.PublicType.StateType;
import com.kington.zbgl.model.VOSupport;

/**
 * 角色表
 * 
 * @author lijialin
 * 
 */
public class RoleVO extends VOSupport {
	private static final long serialVersionUID = -8579300837291673603L;

	private String roleName; // 名称
	private String remark; // 备注
	private StateType state; // 状态

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public StateType getState() {
		return state;
	}

	public void setState(StateType state) {
		this.state = state;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleName() {
		return roleName;
	}

	@Override
	public String getKey() {
		return Common.checkLong(getId()) ? Common.getIdMD5(getId().toString(),
				Role.class.getSimpleName()) : StringUtils.EMPTY;
	}
}
