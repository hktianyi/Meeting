package org.tplatform.filters;

import com.foxinmy.weixin4j.exception.WeixinException;
import com.foxinmy.weixin4j.mp.api.OauthApi;
import org.springframework.beans.factory.annotation.Autowired;
import org.tplatform.constant.GlobalConstant;
import org.weixin.user.service.WXUserService;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 微信身份过滤器
 * Created by Tianyi on 2015/12/31.
 */
public class WXFilter extends AuthenticationFilter {

  @Autowired
  private WXUserService wxUserService;

  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    HttpServletRequest req = (HttpServletRequest) request;
    HttpServletResponse res = (HttpServletResponse) response;

    // 替换 项目部署路径 ，只留项目相对根路径
    String uri = req.getRequestURI().replaceAll("^" + req.getContextPath(), "");

    String ua = req.getHeader("user-agent").toLowerCase();
    if(ua.indexOf("micromessenger") > -1) {
      if(req.getSession().getAttribute("openId") == null && !uri.startsWith("/wx")) {
        OauthApi oauthApi = new OauthApi();
        this.forword(req, res, oauthApi.getAuthorizeURL());
        return;
      } else {
        if(req.getSession().getAttribute(GlobalConstant.SESSION_USER_KEY) == null) {
          String appId = (String) req.getSession().getAttribute("appId");
          String openId = (String) req.getSession().getAttribute("openId");
          try {
            req.getSession().setAttribute(GlobalConstant.SESSION_USER_KEY, wxUserService.getMember(appId, openId));
          } catch (WeixinException e) {
            e.printStackTrace();
          }
        }
      }
    }
    super.doFilter(request, response, chain);
  }

}
