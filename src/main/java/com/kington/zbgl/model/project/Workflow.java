package com.kington.zbgl.model.project;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import org.apache.commons.lang.StringUtils;

import com.kington.zbgl.common.Common;
import com.kington.zbgl.model.POSupport;


@Entity
@Table(name = "workflow")
public class Workflow extends POSupport{

	private static final long serialVersionUID = -3585036966245673084L;

	@Override
	public String getKey() {
		return Common.checkLong(getId()) ? Common.getIdMD5(getId().toString(),
				Workflow.class.getSimpleName()) : StringUtils.EMPTY;
	}
	@Column(nullable = false, length = 100)
	private String workflowName;//流程名称
	
	@Column(nullable = true, length = 1000)
	private String nodeDescription;//描述

	public String getWorkflowName() {
		return workflowName;
	}

	public void setWorkflowName(String workflowName) {
		this.workflowName = workflowName;
	}

	public String getNodeDescription() {
		return nodeDescription;
	}

	public void setNodeDescription(String nodeDescription) {
		this.nodeDescription = nodeDescription;
	}

}
