package com.kington.zbgl.model;

import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;

import com.jtframework.websupport.mvc.model.EntitySupport;

/**
 * 重写EntitySupport
 *
 */
@MappedSuperclass
public abstract class POSupport extends EntitySupport {
	private static final long serialVersionUID = -5232697961730268869L;

	@Transient
	private String key;
	
	/**
	 * 由继承类去定义获取KEY的方法
	 * @return
	 */
	public abstract String getKey();

	public void setKey(String key) {
		this.key = key;
	}
}
