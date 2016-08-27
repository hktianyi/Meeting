package org.tplatform.filters;

import com.foxinmy.weixin4j.exception.WeixinException;
import org.tplatform.constant.GlobalConstant;
import org.tplatform.framework.util.SpringContextUtil;
import org.tplatform.util.WXUtil;
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

  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    HttpServletRequest req = (HttpServletRequest) request;
    HttpServletResponse res = (HttpServletResponse) response;

    String ua = req.getHeader("user-agent").toLowerCase();
    if(ua.contains("micromessenger")) {

      if(req.getSession().getAttribute(GlobalConstant.KEY_SESSION_OPENID) != null) {
        if(req.getSession().getAttribute(GlobalConstant.KEY_SESSION_USER) == null) {
          String openId = (String) req.getSession().getAttribute(GlobalConstant.KEY_SESSION_OPENID);
          try {
            req.getSession().setAttribute(GlobalConstant.KEY_SESSION_USER, SpringContextUtil.getBean(WXUserService.class).getMember(WXUtil.getAppId(), openId));
          } catch (WeixinException e) {
            e.printStackTrace();
          }
        }
      } else if (!SpringContextUtil.getDomain("action").startsWith("/wx")) {
        this.forword(req, res, WXUtil.getOauthApi(WXUtil.getAppId()).getAuthorizeURL(SpringContextUtil.getDomain() + "/wx/oauth/" + WXUtil.getAppId(), "state", "snsapi_base"));
        return;
      }

    }
    super.doFilter(request, response, chain);
  }

}
