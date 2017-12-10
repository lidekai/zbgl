package com.kington.zbgl.webapp.actions.project;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import com.kington.zbgl.service.project.WorkflowService;
import com.kington.zbgl.webapp.actions.BaseAction;

public class WorkflowAction extends BaseAction{

	private static final long serialVersionUID = 6903810813855574430L;
	
	@Resource
	private WorkflowService workflowService;
	
	/**
	 * 跳转到工作流程页面
	 * @return
	 * @throws Exception
	 */
	public String toWorkflow() throws Exception {
		return "defi";
	}
	
	/**
	 * 获取工作流程json数据
	 */
	public void getWorkflow() throws Exception {
		workflowService.getWorkflowList();
	}
	
	/**
	 * 删除工作流程数据
	 */
	public void delectWorkflow() throws Exception {
		String id = ServletActionContext.getRequest().getParameter("id");
		System.out.println(id);
		workflowService.delectWorkflowById(Long.parseLong(id));
	}
}
