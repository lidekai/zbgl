package com.kington.zbgl.service.project;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import org.apache.struts2.ServletActionContext;
import com.kington.zbgl.dao.project.WorkflowDao;
import com.kington.zbgl.model.project.Workflow;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class WorkflowServiceImpl implements WorkflowService{
	
	@Resource
	private WorkflowDao workflowDao;
	
	@Override
	public void getWorkflowList() throws Exception{		
		JSONObject getWorkflowData =new JSONObject();
		//获取父的数组
		List<Workflow> parentList = workflowDao.getParentList();
		
		JSONArray parentArray=new JSONArray();
		for(int i=0;i<parentList.size();i++){
			JSONObject parentJson =JSONObject.fromObject(parentList.get(i));
			
			List<Workflow> childList=workflowDao.getChildListById(parentList.get(i).getId());
			JSONArray childArray=new JSONArray();
			for(int j=0;j<childList.size();j++){
				JSONObject childJson =JSONObject.fromObject(childList.get(i));
				childArray.add(childJson);
			}
			parentJson.put("node", childArray);
			parentArray.add(parentJson);
		}
		 PrintWriter out = ServletActionContext.getResponse().getWriter();
		 out.print(parentArray.toString());
	}

	@Override
	public void delectWorkflowById(Long id) throws Exception {
		List<Long> childList=workflowDao.getChildIdsById(id);
		childList.add(id);
		String idsList=String.valueOf(childList);
		String ids=idsList.substring(1, idsList.length()-1);
		workflowDao.delectParentListById(id);
		workflowDao.delectWorkflowListByIds(ids);
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		out.print("删除成功！");
	}

}
