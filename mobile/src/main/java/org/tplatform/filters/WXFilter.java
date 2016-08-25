package org.tplatform.filters;

import com.foxinmy.weixin4j.exception.WeixinException;
import org.springframework.beans.factory.annotation.Autowired;
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

  @Autowired
  private WXUserService wxUserService;

  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    HttpServletRequest req = (HttpServletRequest) request;
    HttpServletResponse res = (HttpServletResponse) response;

    String ua = req.getHeader("user-agent").toLowerCase();
    if(ua.contains("micromessenger")) {
      // 替换 项目部署路径 ，只留项目相对根路径
      if(req.getSession().getAttribute("openId") == null && !SpringContextUtil.getDomain("action").startsWith("/wx")) {
        this.forword(req, res, SpringContextUtil.getDomain() + "/wx/oauth/" + WXUtil.getAppId());
        return;
      } else {
        if(req.getSession().getAttribute(GlobalConstant.KEY_SESSION_USER) == null) {
          String openId = (String) req.getSession().getAttribute("openId");
          try {
            req.getSession().setAttribute(GlobalConstant.KEY_SESSION_USER, wxUserService.getMember(WXUtil.getAppId(), openId));
          } catch (WeixinException e) {
            e.printStackTrace();
          }
        }
      }
    }
    super.doFilter(request, response, chain);
  }

}
