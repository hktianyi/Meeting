package org.tplatform.weixin.app;

import com.foxinmy.weixin4j.exception.WeixinException;
import com.foxinmy.weixin4j.mp.api.OauthApi;
import com.foxinmy.weixin4j.mp.model.OauthToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.tplatform.common.BaseCtrl;
import org.tplatform.constant.GlobalConstant;
import org.tplatform.member.entity.Member;
import org.tplatform.util.WXUtil;
import org.weixin.user.service.WXUserService;

/**
 * Created by tianyi on 16/8/7.
 */
@Controller
@RequestMapping("/wx")
public class WeixinCtrl extends BaseCtrl {

  @Autowired
  private WXUserService wxUserService;

  /**
   * 微信跳转
   * @return
   */
  @RequestMapping(value = "/redirect/{appId}", method = RequestMethod.GET)
  public String redirect(@PathVariable String appId, @RequestParam String to) {
    session.setAttribute(GlobalConstant.KEY_SESSION_APPID, appId);
    return GlobalConstant.REDIRECT + to;
  }

  /**
   * 登录页
   *
   * @return
   */
  @RequestMapping(value = "/oauth/{appId}", method = RequestMethod.GET)
  public String login2WX(@PathVariable String appId, String code, String state, ModelMap modelMap) {
    OauthApi oauthApi = new OauthApi(WXUtil.getProxy(appId).getWeixinAccount());
    try {
      OauthToken oauthToken = oauthApi.getOauthToken(code);
      session.setAttribute(GlobalConstant.KEY_SESSION_OPENID, oauthToken.getOpenId());
      Member member = wxUserService.getMember(appId, oauthToken.getOpenId());
      if(member != null) {
        session.setAttribute("user", oauthToken.getOpenId());
      }
//      User user = oauthApi.getUser(oauthToken);
//      System.out.println(user);
    } catch (WeixinException e) {
      e.printStackTrace();
    }
    return GlobalConstant.REDIRECT + "/login";
  }




//  @Autowired
//  private TemplateMsgService templateMsgService;
//
//  @RequestMapping("/sendTmpl")
//  @ResponseBody
//  public String testWx(@RequestParam(required = false, defaultValue = "wxdadf1852174f5054") String appId, String content) {
//    try {
//      templateMsgService.sendAgendaWarn(appId, (String) session.getAttribute("openId"), content);
//    } catch (WeixinException e) {
//      e.printStackTrace();
//    }
//    return "OK";
//  }
}
