package org.tplatform.auth.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.tplatform.auth.entity.SysRole;
import org.tplatform.auth.mapper.SysRoleMapper;
import org.tplatform.auth.service.ISysRoleService;
import org.tplatform.core.fsm.StatusEnum;
import org.tplatform.impl.BaseService;

import java.util.Set;

/**
 * 角色业务类
 * <p>
 * Created by Tianyi on 2016/5/28.
 */
@Service
public class SysRoleService extends BaseService<SysRole> implements ISysRoleService {

  @Autowired
  private SysRoleMapper sysRoleMapper;

  public Set<SysRole> findByUserId(Long userId, StatusEnum status) {
    return sysRoleMapper.findByUserId(userId, status);
  }

  /**
   * 支持拖拽
   * @param id
   * @param pid
   * @return
   */
  public boolean updatePid(Long id, Long pid) {
    return sysRoleMapper.updatePid(id, pid) > 0;
  }
}
