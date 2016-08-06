package org.tplatform.member.app;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.tplatform.common.BaseCtrl;
import org.tplatform.constant.GlobalConstant;

/**
 * Created by guo_x on 2016/8/6.
 */
@Controller
@RequestMapping
public class RegisterCtrl extends BaseCtrl{
	/**
	 * 登录页
	 *
	 * @return
	 */
	@RequestMapping(value = "/signup")
	public String signup() {

		return "/signup.jsp";
	}
}
