
package com.service.impl;

import com.dao.mapper.TMenuMapper;
import com.pojo.po.TMenu;
import com.pojo.po.TMenuExample;
import com.service.ISysService;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class SysServiceImpl implements ISysService {
	@Autowired private TMenuMapper tMenuMapper;
	
	
	
	public List gellMenu() throws Exception {
		return tMenuMapper.gellMenu();
	}

	public TMenu getTmenuById(Integer id) throws Exception {
		TMenuExample tMenuExample = new TMenuExample();
		com.pojo.po.TMenuExample.Criteria criteria = tMenuExample.createCriteria();
		criteria.andIdEqualTo(id);
		TMenu menu = tMenuMapper.selectByPrimaryKey(id);
		return menu;
	}
}