package com.kington.zbgl.service.project;

import javax.persistence.Query;

import com.kington.zbgl.model.project.Workflow;
import com.kington.zbgl.model.project.WorkflowVO;
import com.kington.zbgl.service.BaseServiceImpl;

public class WorkflowServiceImpl extends BaseServiceImpl<Workflow,WorkflowVO> implements WorkflowService{
	private static final long serialVersionUID = -487008797248228205L;

	@Override
	protected String getQueryStr(WorkflowVO vo) throws Exception {
		return null;
	}

	@Override
	protected void setQueryParm(Query query, WorkflowVO vo) throws Exception {}

	@Override
	protected void switchVO2PO(WorkflowVO vo, Workflow po) throws Exception {}

}
