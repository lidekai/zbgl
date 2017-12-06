package com.kington.zbgl.model.project;

import javax.persistence.Column;

import org.apache.commons.lang.StringUtils;

import com.kington.zbgl.common.Common;
import com.kington.zbgl.model.VOSupport;

public class TreePathsVO extends VOSupport{
	
	private static final long serialVersionUID = 5881481876701928138L;

	@Override
	public String getKey() {
		return Common.checkLong(getId()) ? Common.getIdMD5(getId().toString(),
				TreePaths.class.getSimpleName()) : StringUtils.EMPTY;
	}
	
	private Long parentNode;//父节点
	private Long childNode;//子节点

	public Long getParentNode() {
		return parentNode;
	}
	public void setParentNode(Long parentNode) {
		this.parentNode = parentNode;
	}
	public Long getChildNode() {
		return childNode;
	}
	public void setChildNode(Long childNode) {
		this.childNode = childNode;
	}
}
