package org.tplatform.member.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.tplatform.constant.GlobalConstant;
import org.tplatform.framework.util.StringUtil;
import org.tplatform.member.entity.Member;
import org.tplatform.member.service.MemberService;
import org.weixin.user.service.WXUserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by tianyi on 16/8/6.
 */
@Controller
@RequestMapping
public class LoginCtrl {
	@Autowired
	protected HttpServletRequest request;
	@Autowired
	protected HttpSession session;

	@Autowired
	private MemberService memberService;
	@Autowired
	private WXUserService wxUserService;

	/**
	 * 登录页
	 *
	 * @return
	 */
	@RequestMapping(value = {"/login", "/"}, method = RequestMethod.GET)
	public String login(ModelMap modelMap) {
		if(session.getAttribute(GlobalConstant.KEY_SESSION_USER) != null) return GlobalConstant.REDIRECT + "/meeting/detail/2";
		return "/meeting/welcome.jsp";
	}

	/**
	 * 用户登录
	 *
	 * @param username
	 * @param password
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String username, String password, ModelMap modelMap) {
		Member member = memberService.findByUserName(username);
		if (member != null && member.getUserPwd().equals(password)) {
			// 登录跳转
			String loginTo = String.valueOf(session.getAttribute(GlobalConstant.KEY_SESSION_LOGIN_TO_PAGE));
			session.setAttribute(GlobalConstant.KEY_SESSION_USER,member);
			if (StringUtil.isNotEmpty(loginTo)) {
				session.removeAttribute(GlobalConstant.KEY_SESSION_LOGIN_TO_PAGE);
				return InternalResourceViewResolver.REDIRECT_URL_PREFIX + loginTo;
			} else {
				return "/meeting/welcome.jsp";
				//return InternalResourceViewResolver.REDIRECT_URL_PREFIX + "/member/attendeeList";
			}
		} else {
			modelMap.put("errorMsg", "用户名或密码错误！");
			return login(modelMap);
		}
	}

	/**
	 * 退出登录
	 *
	 * @return
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout() {
		String ua = request.getHeader("user-agent").toLowerCase();
		if(ua.contains("micromessenger"))
			wxUserService.unBindMember(String.valueOf(session.getAttribute(GlobalConstant.KEY_SESSION_APPID)), String.valueOf(session.getAttribute(GlobalConstant.KEY_SESSION_OPENID)));

		session.removeAttribute(GlobalConstant.KEY_SESSION_USER);
		return InternalResourceViewResolver.REDIRECT_URL_PREFIX + "/login";
	}

}
