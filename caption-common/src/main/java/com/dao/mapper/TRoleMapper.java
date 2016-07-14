package com.dao.mapper;

import com.pojo.po.TRole;
import com.pojo.po.TRoleExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TRoleMapper
{
  public int countByExample(TRoleExample paramTRoleExample);

  public int deleteByExample(TRoleExample paramTRoleExample);

  public int deleteByPrimaryKey(Integer paramInteger);

  public int insert(TRole paramTRole);

  public int insertSelective(TRole paramTRole);

  public List<TRole> selectByExample(TRoleExample paramTRoleExample);

  public TRole selectByPrimaryKey(Integer paramInteger);

  public int updateByExampleSelective(@Param("record") TRole paramTRole, @Param("example") TRoleExample paramTRoleExample);

  public int updateByExample(@Param("record") TRole paramTRole, @Param("example") TRoleExample paramTRoleExample);

  public int updateByPrimaryKeySelective(TRole paramTRole);

  public int updateByPrimaryKey(TRole paramTRole);
}