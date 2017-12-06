package com.kington.zbgl.webapp.actions.system;

import java.util.Date;

import javax.annotation.Resource;

import com.kington.zbgl.common.Common;
import com.kington.zbgl.common.DateFormat;
import com.kington.zbgl.model.system.LogVO;
import com.kington.zbgl.service.system.LogService;
import com.kington.zbgl.webapp.actions.BaseAction;

/**
 * <h5>操作日志管理</h5>
 * @author Administrator
 *
 */

public class LogAction extends BaseAction {
	private static final long serialVersionUID = 4588721791338813709L;

	@Resource 
	private LogService logService;
	
	private LogVO vo;
	
	public String list(){
		try {
			if(vo == null){
				vo = new LogVO();
				vo.setStartTime(DateFormat.getDayStart());
				vo.setEndTime(new Date());
			}
			
			vo.setPageNumber(page);
			pageList = logService.getPageList(vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Common.PATH_LIST;
	}

	public LogVO getVo() {
		return vo;
	}

	public void setVo(LogVO vo) {
		this.vo = vo;
	}
	
	
}
