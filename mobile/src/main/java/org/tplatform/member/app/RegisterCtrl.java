package org.tplatform.member.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.tplatform.common.BaseCtrl;
import org.tplatform.framework.log.Logger;
import org.tplatform.member.service.MemberService;

import java.util.logging.LogManager;

/**
 * Created by guo_x on 2016/8/6.
 */
@Controller
@RequestMapping
public class RegisterCtrl extends BaseCtrl {
	@Autowired
	private MemberService memberService;

	/**
	 * 注册页
	 *
	 * @return
	 */
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup() {

		return "/signup.jsp";
	}

	/**
	 * 注册
	 *
	 * @param userName
	 * @param userPwd
	 * @return
	 */
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signup(String userName, String userPwd) {

		return "/main.jsp";
	}

	@RequestMapping(value = "validUserName", method = RequestMethod.POST)
	@ResponseBody
	public boolean validUserName(String userName) {
		Logger.i(this.getClass(),"userName:"+ userName);
		return memberService.validUserName(userName);
	}
}
