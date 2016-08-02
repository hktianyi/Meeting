package org.tplatform.auth.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.tplatform.auth.entity.SysOrgan;
import org.tplatform.auth.service.impl.SysOrganService;
import org.tplatform.common.BaseCtrl;

import java.util.List;
import java.util.Map;

/**
 * Created by Tianyi on 2015/12/5.
 */
@Controller
@RequestMapping("/sysOrgan")
public class SysOrganCtrl extends BaseCtrl<SysOrgan> {

  @Autowired
  private SysOrganService sysOrganService;

  @RequestMapping("/jsTree")
  @ResponseBody
  public List<Map<String, Object>> jsTree(String pid) {
    return sysOrganService.jsTree(pid);
  }

  @RequestMapping("/jsTreeAll")
  @ResponseBody
  public List<Map<String, Object>> jsTreeAll() {
    return sysOrganService.jsTreeAll(null);
  }
}
