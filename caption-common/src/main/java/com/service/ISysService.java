
package com.service;

import com.pojo.po.TMenu;
import java.util.List;

public interface ISysService {
	 List gellMenu() throws Exception;
	 TMenu getTmenuById(Integer integer) throws Exception;
}
