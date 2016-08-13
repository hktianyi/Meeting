package org.tplatform.weixin.app;

import com.foxinmy.weixin4j.exception.WeixinException;
import com.foxinmy.weixin4j.mp.api.OauthApi;
import com.foxinmy.weixin4j.mp.model.OauthToken;
import org.weixin.message.service.TemplateMsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.tplatform.common.BaseCtrl;
import org.tplatform.constant.GlobalConstant;

/**
 * Created by tianyi on 16/8/7.
 */
@Controller
@RequestMapping("/wx")
public class WeixinCtrl extends BaseCtrl {

  /**
   * 登录页
   *
   * @return
   */
//  @RequestMapping(value = "/oauth/{appId}", method = RequestMethod.GET)
//  public String login2WX(@PathVariable String appId, String code, String state, ModelMap modelMap) {
//    OauthApi oauthApi = new OauthApi();
//    try {
//      OauthToken oauthToken = oauthApi.getOauthToken(code);
//      System.out.println(oauthToken);
//      session.setAttribute("openId", oauthToken.getOpenId());
////      User user = oauthApi.getUser(oauthToken);
////      System.out.println(user);
//    } catch (WeixinException e) {
//      e.printStackTrace();
//    }
//    return GlobalConstant.REDIRECT + "/login";
//  }




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
