package com.kington.zbgl.service.project;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.Query;

import com.kington.zbgl.model.project.TreePathsVO;
import com.kington.zbgl.model.project.Workflow;
import com.kington.zbgl.model.project.WorkflowVO;
import com.kington.zbgl.service.BaseServiceImpl;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class WorkflowServiceImpl extends BaseServiceImpl<Workflow,WorkflowVO> implements WorkflowService{

	private static final long serialVersionUID = -2423852716101856508L;
	
	@Override
	protected String getQueryStr(WorkflowVO vo) throws Exception {
		return "";
	}

	@Override
	protected void setQueryParm(Query query, WorkflowVO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void switchVO2PO(WorkflowVO vo, Workflow po) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public JSONObject getWorkflowList() throws Exception {
		JSONObject getWorkflowData =new JSONObject();
		//获取父的数组
		String sqlParent ="SELECT w.* " 
						+"FROM workflow AS w "
						+"INNER JOIN TreePaths t on w.id = t.parentNode "
						+"GROUP BY parentNode";
		@SuppressWarnings("unchecked")
		List<Workflow> parentList = em.createNativeQuery(sqlParent,Workflow.class)
									  .getResultList();
		JSONArray parentArray=new JSONArray();
		for(int i=0;i<parentList.size();i++){
			JSONObject parentJson =new JSONObject();
			System.out.println(parentList.get(i).getId());
			parentJson.put("workflowId", parentList.get(i).getId());
			parentJson.put("workflowName", parentList.get(i).getWorkflowName());
			parentJson.put("workflowName", parentList.get(i).getNodeDescription());
			//获取每一父的子的数据
			String sqlChild ="SELECT w.* "
							+"FROM workflow AS w "
							+"INNER JOIN TreePaths t on w.id = t.childNode "
							+"WHERE t.parentNode =:cParentNode";
			@SuppressWarnings("unchecked")
			List<Workflow> childList=em.createNativeQuery(sqlChild,Workflow.class)
					 				   .setParameter("cParentNode", parentList.get(i))
					 				   .getResultList();
			JSONArray childArray=new JSONArray();
			for(int j=0;j<childList.size();j++){
				JSONObject childJson =new JSONObject();
				childJson.put("workflowId", childList.get(i).getId());
				childJson.put("workflowName", childList.get(i).getWorkflowName());
				childJson.put("workflowName", childList.get(i).getNodeDescription());
				childArray.add(childJson);
			}
			parentJson.put("node", childArray);
			parentArray.add(parentJson);
		}
		getWorkflowData.put("getWorkflowData", parentArray);
		return getWorkflowData;
	}

}
