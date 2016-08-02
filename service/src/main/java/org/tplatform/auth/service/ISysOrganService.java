package org.tplatform.auth.service;

import org.tplatform.auth.entity.SysOrgan;
import org.tplatform.core.service.IBaseService;

import java.util.List;
import java.util.Map;

/**
 * Created by Tianyi on 2016/1/10.
 */
public interface ISysOrganService extends IBaseService<SysOrgan> {

  /**
   * 根据用户ID查询机构
   * @param userId
   * @return
   */
  SysOrgan findByUserId(Long userId);

  List<Map<String, Object>> jsTreeAll(String[] ids);
}
