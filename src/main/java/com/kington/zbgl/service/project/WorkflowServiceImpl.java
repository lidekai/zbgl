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
		System.out.println("11111111");
		
		JSONObject getWorkflowData =new JSONObject();
		//获取父的数组
		List<Workflow> parentList = workflowDao.getParentList();
		
		JSONArray parentArray=new JSONArray();
		for(int i=0;i<parentList.size();i++){
			JSONObject parentJson =JSONObject.fromObject(parentList.get(i));
			
			List<Workflow> childList=workflowDao.getChildList(parentList.get(i).getId());
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

}
