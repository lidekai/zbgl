package com.kington.zbgl.service.project;

import com.kington.zbgl.model.project.Workflow;
import com.kington.zbgl.model.project.WorkflowVO;
import com.kington.zbgl.service.BaseService;
import net.sf.json.JSONObject;

public interface WorkflowService extends BaseService<Workflow,WorkflowVO>{
	//获取工作流程数据列表
	public JSONObject getWorkflowList() throws Exception;
}
