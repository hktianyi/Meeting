package org.tplatform.filters;

import com.foxinmy.weixin4j.exception.WeixinException;
import org.tplatform.constant.GlobalConstant;
import org.tplatform.framework.log.Logger;
import org.tplatform.framework.util.SpringContextUtil;
import org.tplatform.framework.util.StringUtil;
import org.tplatform.member.entity.Member;
import org.tplatform.util.WXUtil;
import org.weixin.user.service.WXUserService;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 微信身份过滤器
 * Created by Tianyi on 2015/12/31.
 */
public class WXFilter extends AuthenticationFilter {

  @Override
  public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
    HttpServletRequest request = (HttpServletRequest) servletRequest;
    HttpServletResponse response = (HttpServletResponse) servletResponse;

    String ua = request.getHeader("user-agent").toLowerCase();
    if(ua.contains("micromessenger")) {
      HttpSession session = request.getSession();
      Logger.i("微信浏览器访问系统");
      if(session.getAttribute(GlobalConstant.KEY_SESSION_OPENID) != null) {
        if(session.getAttribute(GlobalConstant.KEY_SESSION_USER) == null) {
          String openId = (String) session.getAttribute(GlobalConstant.KEY_SESSION_OPENID);
          try {
            Member member = SpringContextUtil.getBean(WXUserService.class).getMember(WXUtil.getAppId(), openId);
            if(member != null) {
              Logger.i("微信自动登录,获取系统用户信息: " + member.getUserName());
              session.setAttribute(GlobalConstant.KEY_SESSION_USER, member);
              String loginTo = String.valueOf(session.getAttribute(GlobalConstant.KEY_SESSION_LOGIN_TO_PAGE));
              if (StringUtil.isNotEmpty(loginTo)) {
                session.removeAttribute(GlobalConstant.KEY_SESSION_LOGIN_TO_PAGE);
//                response.sendRedirect(loginTo);
                request.getRequestDispatcher(loginTo).forward(request, response);
              }
            } else {
              Logger.i("微信自动登录,未绑定系统用户。 ");
            }
          } catch (WeixinException e) {
            e.printStackTrace();
          }
        } else {
          Logger.i("微信用户["+WXUtil.getAppId()+"|"+session.getAttribute(GlobalConstant.KEY_SESSION_OPENID)+
              "]已登录,系统用户["+((Member)session.getAttribute(GlobalConstant.KEY_SESSION_USER)).getUserName()+"],自动跳转");
        }
      } else if (!SpringContextUtil.getDomain("action").startsWith("/wx")) {
        String url = WXUtil.getOauthApi(WXUtil.getAppId()).getAuthorizeURL("http://effie.china-caa.org/m/wx/oauth/" + WXUtil.getAppId(), "state", "snsapi_base");
        Logger.i("微信公众号【" + WXUtil.getAppId() + "】获取openId跳转: " + url);
        this.forword(request, response, url);
        return;
      }

    }
    super.doFilter(request, response, chain);
  }

}
