package com.kington.zbgl.service.project;

import java.util.List;

import com.kington.zbgl.model.project.Workflow;
import com.kington.zbgl.model.project.WorkflowVO;

public interface WorkflowService {
	//获取工作流程所有数据
	public List<Workflow> getList(WorkflowVO vo) throws Exception;
}
