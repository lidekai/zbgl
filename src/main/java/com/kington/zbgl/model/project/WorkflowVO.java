package com.kington.zbgl.model.project;

import javax.persistence.Column;

import org.apache.commons.lang.StringUtils;

import com.kington.zbgl.common.Common;
import com.kington.zbgl.model.VOSupport;

public class WorkflowVO extends VOSupport{

	private static final long serialVersionUID = 3951378372139624552L;

	@Override
	public String getKey() {
		return Common.checkLong(getId()) ? Common.getIdMD5(getId().toString(),
				Workflow.class.getSimpleName()) : StringUtils.EMPTY;
	}
	
	private String workflowName;//流程名称
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
