package org.tplatform.auth.mapper;

import org.apache.ibatis.annotations.Select;
import org.tplatform.auth.entity.SysOrgan;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;
import java.util.Map;

/**
 * Created by Tianyi on 2016/6/1.
 */
public interface SysOrganMapper extends Mapper<SysOrgan> {

  @Select("SELECT organCode as id, organName as text, isLast as children FROM sys_auth_organ WHERE parentCode = #{0}")
  List<Map<String, Object>> jsTree(String parentCode);
  @Select("SELECT organCode as id, organName as text, parentCode as pid FROM sys_auth_organ")
  List<Map<String, Object>> jsTreeAll();

  @Select("SELECT t1.* FROM sys_auth_organ t1, sys_auth_user_organ t2 WHERE t1.id = t2.organId and t2.userId = #{0}")
  SysOrgan findByUserId(Long userId);
}
