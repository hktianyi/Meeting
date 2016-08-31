package org.tplatform.message.app;

import com.github.pagehelper.PageInfo;
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
import org.tplatform.core.entity.RespBody;
import org.tplatform.meeting.entity.Message;
import org.tplatform.meeting.service.MeetingAttendeeService;
import org.tplatform.meeting.service.MessageService;
import org.tplatform.member.entity.Member;

/**
 * Created by guo_x on 2016/8/7.
 */
@Controller
@RequestMapping("/message")
public class MessageCtrl extends BaseCtrl {

	private static final String BASE_DIR = "/message";

	@Autowired
	private MessageService messageService;
	@Autowired
	private MeetingAttendeeService meetingAttendeeService;

	@RequestMapping
	public String list(@RequestParam(required = false, defaultValue = "1") Integer pageNo, @RequestParam(required = false, defaultValue = "100") Integer pageSize, ModelMap modelMap) {
		Member member = (Member) session.getAttribute(GlobalConstant.KEY_SESSION_USER);
		Message message = new Message();
		PageInfo<Message> pageInfo = new PageInfo<>();

		pageInfo.setPageNum(pageNo);
		pageInfo.setPageSize(pageSize);

		message.setUserId(meetingAttendeeService.findattendeeIdByMeetCode(member.getUserName()));
		PageInfo<Message> page = messageService.find(message, pageInfo);
		modelMap.put("list", page.getList());
		return BASE_DIR.concat("/list.jsp");
	}

	@RequestMapping("/markRead/{id}")
	@ResponseBody
	public RespBody markRead(@PathVariable Long id) {
		messageService.markRead(id);
		return RespBody.ok();
	}

	@RequestMapping(method = RequestMethod.POST)
	public RespBody list(@RequestParam("pageNo")int pageNo,@RequestParam("pageSize") int pageSize){
		Member member = (Member) session.getAttribute(GlobalConstant.KEY_SESSION_USER);
		Message message = new Message();
		PageInfo<Message> pageInfo = new PageInfo<>();
		pageInfo.setPageNum(pageNo);
		pageInfo.setPageSize(pageSize);
		message.setUserId(member.getId());
		PageInfo<Message> page = messageService.find(message,pageInfo);
		return RespBody.ok(page);
	}
}
