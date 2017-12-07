package com.kington.zbgl.webapp.actions.project;

import javax.annotation.Resource;
import com.kington.zbgl.service.project.WorkflowService;
import com.kington.zbgl.webapp.actions.BaseAction;

public class WorkflowAction extends BaseAction{

	private static final long serialVersionUID = 6903810813855574430L;
	
	@Resource
	private WorkflowService workflowService;
	
	/**
	 * 获取工作流程数据列表
	 * @return
	 * @throws Exception
	 */
	public String defi() throws Exception {
		System.out.println(workflowService.getWorkflowList());
		return "defi";
	}

}
