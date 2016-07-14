
package com.service;

import com.pojo.po.TUser;
import java.util.List;

public interface IUserService {
	boolean saveUser(TUser tuser) throws Exception;
	TUser getUser(TUser tuser) throws Exception;
	List getAllUsers() throws Exception;
}
