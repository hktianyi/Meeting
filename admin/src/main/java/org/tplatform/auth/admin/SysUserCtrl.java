package org.tplatform.auth.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.tplatform.auth.entity.SysUser;
import org.tplatform.auth.service.ISysUserService;
import org.tplatform.common.BaseCtrl;
import org.tplatform.constant.GlobalConstant;
import org.tplatform.core.entity.RespBody;
import org.tplatform.framework.util.StringUtil;

/**
 * Created by Tianyi on 2015/12/5.
 */
@Controller
@RequestMapping("/sysUser")
public class SysUserCtrl extends BaseCtrl<SysUser> {

  @Autowired
  private ISysUserService sysUserService;

  /**
   * 账户信息配置
   *
   * @return
   */
  @RequestMapping("/profile")
  public String profile(String type, ModelMap modelMap) {
    modelMap.put("type", type);
    return super.dir + "/profile.jsp";
  }

  /**
   * 账户信息配置
   *
   * @return
   */
  @RequestMapping("/checkOldPwd")
  @ResponseBody
  public boolean checkOldPwd(@RequestParam String oldPwd) {
    SysUser sysUser = (SysUser) session.getAttribute(GlobalConstant.KEY_SESSION_USER);
    return oldPwd.equals(sysUser.getPassword());
  }

  /**
   * 账户信息配置
   *
   * @return
   */
  @RequestMapping("/updateAccount")
  @ResponseBody
  public RespBody updateAccount(@RequestParam(required = false) String nickname, @RequestParam(required = false) String mobile, @RequestParam(required = false) String email) {
    SysUser sysUser = (SysUser) session.getAttribute(GlobalConstant.KEY_SESSION_USER);
    if (StringUtil.isNotEmpty(nickname)) sysUser.setNickname(nickname);
    if (StringUtil.isNotEmpty(mobile)) sysUser.setMobile(mobile);
    if (StringUtil.isNotEmpty(email)) sysUser.setEmail(email);
    if (sysUserService.updateAccount(sysUser)) {
      session.setAttribute(GlobalConstant.KEY_SESSION_USER, sysUser);
      return RespBody.ok();
    } else {
      return RespBody.error("修改失败");
    }
  }

  /**
   * 账户信息配置
   *
   * @return
   */
  @RequestMapping("/updatePwd")
  @ResponseBody
  public RespBody updatePwd(@RequestParam String oldPwd, @RequestParam String newPwd) {
    if (checkOldPwd(oldPwd)) {
      SysUser sysUser = (SysUser) session.getAttribute(GlobalConstant.KEY_SESSION_USER);
      sysUser.setPassword(newPwd);
      if (sysUserService.updateAccount(sysUser)) {
        session.removeAttribute(GlobalConstant.KEY_SESSION_USER);
        return RespBody.ok();
      } else {
        return RespBody.error("修改失败");
      }
    } else {
      return RespBody.error("当前密码错误");
    }
  }
}
