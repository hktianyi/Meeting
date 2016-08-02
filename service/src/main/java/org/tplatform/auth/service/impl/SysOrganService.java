package org.tplatform.auth.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.tplatform.auth.entity.SysOrgan;
import org.tplatform.auth.mapper.SysOrganMapper;
import org.tplatform.auth.service.ISysOrganService;
import org.tplatform.impl.BaseService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Created by Tianyi on 2015/1/9.
 */
@Service
public class SysOrganService extends BaseService<SysOrgan> implements ISysOrganService {

  @Autowired
  private SysOrganMapper mapper;

  @Override
  public SysOrgan findByUserId(Long userId) {
    return mapper.findByUserId(userId);
  }

  /**
   * 获取jstree
   * @return
   */
  public List<Map<String, Object>> jsTree(String parentCode) {
    return mapper.jsTree(parentCode);
  }

  /**
   * 获取jstree
   * @return
   */
  public List<Map<String, Object>> jsTreeAll(String[] ids) {
    List<Map<String, Object>> organList = mapper.jsTreeAll();
    Map<String, Object> organMap = new HashMap<>(organList.size());
    Map stateMap = new HashMap();
    stateMap.put("opened", "true");
    stateMap.put("selected", "true");
    organList.stream().forEach(organ -> {
      if(ids!=null)
        for(String id : ids) {
          if(id.equals(organ.get("id"))) {
            organ.put("state", stateMap);
            break;
          }
        }
      organMap.put((String)organ.get("id"), organ);
    });

    organList = organList.stream().filter(organ -> "0".equals(organ.get("pid"))).collect(Collectors.toList());
    tree(organList, organMap);
    return organList;
  }

  private void tree(List<Map<String, Object>> levelList, Map<String, Object> organMap) {
    if (levelList != null && levelList.size() > 0) {
      levelList.stream().forEach(organ -> {
        List level2 = findByPid((String) organ.get("id"), organMap);
        organ.put("children", level2);
        if (level2!=null && level2.size()>0)
          tree(level2, organMap);
      });
    }
  }

  private List findByPid(String pid, Map<String, Object> organMap) {
    List list = new ArrayList();
    for(Map.Entry<String, Object> entry : organMap.entrySet()) {
      Map<String, Object> organ = (Map) entry.getValue();
      if(pid.equals(organ.get("pid"))) list.add(organ);
    }
    return list;
  }
}
