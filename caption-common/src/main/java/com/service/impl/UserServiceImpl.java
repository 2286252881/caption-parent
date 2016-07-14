
package com.service.impl;

import com.dao.mapper.TUserMapper;
import com.pojo.po.TUser;
import com.pojo.po.TUserExample;
import com.service.IUserService;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class UserServiceImpl implements IUserService {
	@Autowired private TUserMapper tuMapper;
	
	
	
	
	public boolean saveUser(TUser user) throws Exception {
		TUserExample tuExample = new TUserExample();
		com.pojo.po.TUserExample.Criteria criteria = tuExample.createCriteria();
		criteria.andUsernameEqualTo(user.getUsername());
		if (tuMapper.selectByExample(tuExample).size() > 0) {
			return false;
		} else {
			user.setCreatedate(new Date());
			user.setFlag(Integer.valueOf(1));
			tuMapper.insert(user);
			return true;
		}
	}

	public TUser getUser(TUser user) throws Exception {
		TUserExample tuExample = new TUserExample();
		com.pojo.po.TUserExample.Criteria criteria = tuExample.createCriteria();
		criteria.andUsernameEqualTo(user.getUsername());
		criteria.andPasswordEqualTo(user.getPassword());
		criteria.andFlagEqualTo(Integer.valueOf(1));
		if (tuMapper.selectByExample(tuExample).size() > 0)
			return (TUser) tuMapper.selectByExample(tuExample).get(0);
		else
			return null;
	}

	public List getAllUsers() throws Exception {
		TUserExample tuExample = new TUserExample();
		com.pojo.po.TUserExample.Criteria criteria = tuExample.createCriteria();
		return tuMapper.selectByExample(tuExample);
	}
}
