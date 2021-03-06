package org.tplatform.member.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.tplatform.common.BaseCtrl;
import org.tplatform.constant.GlobalConstant;
import org.tplatform.core.entity.RespBody;
import org.tplatform.meeting.service.MeetingAttendeeService;
import org.tplatform.member.entity.Member;
import org.tplatform.member.service.MemberService;

import java.util.Date;

/**
 * Created by guo_x on 2016/8/7.
 */
@Controller
@RequestMapping("/member")
public class MemberCtrl extends BaseCtrl{

	private static final String BASE_DIR = "/member";

	@Autowired
	private MemberService memberService;
	@Autowired
	private MeetingAttendeeService meetingAttendeeService;

	@RequestMapping(value = "/personal",method = RequestMethod.GET)
	public String personal(ModelMap modelMap){
		Member member = (Member)session.getAttribute(GlobalConstant.KEY_SESSION_USER);
		modelMap.put("member",member);
		return BASE_DIR.concat("/personal.jsp");
	}

	@RequestMapping(value = "/modifyPwd",method = RequestMethod.GET)
	public String upPwd(){
		return BASE_DIR.concat("/modifyPwd.jsp");
	}
	@RequestMapping(value = "/modifyPwd",method = RequestMethod.POST)
	@ResponseBody
	public RespBody upPwd(String oldPwd,String userPwd){
		Member member = (Member)session.getAttribute(GlobalConstant.KEY_SESSION_USER);
		if (member.getUserPwd() != userPwd)
			return RespBody.error("原密码错误");
		else{
			boolean result = memberService.updatePwd(member.getId(),userPwd);
			if (result)
				return RespBody.ok("修改密码成功");
		}
		return RespBody.ok("修改密码失败");
	}

	@RequestMapping(value ="/personal",method = RequestMethod.POST)
	@ResponseBody
	public RespBody personal(ModelMap modelMap,Member member){
		Member currMember = (Member) session.getAttribute(GlobalConstant.KEY_SESSION_USER);
		currMember.setCreateTime(new Date());
		currMember.setAddress(member.getAddress());
		currMember.setCity(member.getCity());
		currMember.setEmail(member.getEmail());
		currMember.setGender(member.getGender());
		currMember.setMobile(member.getMobile());
		currMember.setProvince(member.getProvince());
		currMember.setRealName(member.getRealName());
		String msgInfo = "修改用户信息成功";
		int count = memberService.updateMember(currMember);
		if (count <= 0)
			msgInfo = "修改用户信息失败";
		else
			session.setAttribute(GlobalConstant.KEY_SESSION_USER,currMember);

		return RespBody.ok(msgInfo);
	}

	@RequestMapping("/attendeeList")
	public String attendeeList(ModelMap modelMap) {
		modelMap.put("dataList", meetingAttendeeService.findByUserId(((Member)session.getAttribute(GlobalConstant.KEY_SESSION_USER)).getId()));
		return "/member/attendeeList.jsp";
	}

}
