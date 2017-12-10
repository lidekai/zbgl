package com.kington.zbgl.service.project;

/**
 * 工作流程Service接口
 * @author DK_Li
 *
 */
public interface WorkflowService{
	/**
	 * 获取工作流程数据列表
	 * @throws Exception
	 */
	public void getWorkflowList() throws Exception;
	/**
	 * 通过父id删除父子表数据和对应的工作流程表的数据
	 * @param id
	 * @throws Exception
	 */
	public void delectWorkflowById(Long id) throws Exception;
}
