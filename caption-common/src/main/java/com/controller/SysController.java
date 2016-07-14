package com.controller;

import com.service.ISysService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SysController {

	@Autowired
	private ISysService sysService;

	@RequestMapping("/getMenu")
	@ResponseBody public Map<String, Object> getMenu() {
		List menus = null;
		Map resultMap = new HashMap();
		resultMap.put("ids", new Object[] { Integer.valueOf(1) });
		try {
			menus = this.sysService.gellMenu();
			resultMap.put("menus", menus);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}
}