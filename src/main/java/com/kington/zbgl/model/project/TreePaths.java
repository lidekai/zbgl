package com.kington.zbgl.model.project;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.apache.commons.lang.StringUtils;

import com.kington.zbgl.common.Common;
import com.kington.zbgl.model.POSupport;

@Entity
@Table(name="treePaths")
public class TreePaths extends POSupport{

	private static final long serialVersionUID = 2693430550068670894L;

	@Override
	public String getKey() {
		return Common.checkLong(getId()) ? Common.getIdMD5(getId().toString(),
				TreePaths.class.getSimpleName()) : StringUtils.EMPTY;
	}
	@Column(nullable = false, length = 20)
	private Long parentNode;//父节点
	
	@Column(nullable = false, length = 20)
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
