package org.tplatform.message.app;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.tplatform.common.BaseCtrl;
import org.tplatform.constant.GlobalConstant;
import org.tplatform.core.entity.RespBody;
import org.tplatform.core.fsm.StatusEnum;
import org.tplatform.meeting.entity.Message;
import org.tplatform.meeting.service.MessageService;
import org.tplatform.member.entity.Member;

import java.util.List;

/**
 * Created by guo_x on 2016/8/7.
 */
@Controller
@RequestMapping("/message")
public class MessageCtrl extends BaseCtrl {

	private static final String BASE_DIR = "/message";

	@Autowired
	private MessageService messageService;

	@RequestMapping
	public String list(ModelMap modelMap) {
		Member member = (Member) session.getAttribute(GlobalConstant.SESSION_USER_KEY);
		int pageNo = 1;
		int pageSize = 50;
		Message message = new Message();
		PageInfo<Message> pageInfo = new PageInfo<>();
		pageInfo.setPageNum(pageNo);
		pageInfo.setPageSize(pageSize);

		message.setUserId(member.getId());
		message.setStatus(StatusEnum.VALID);
		PageInfo<Message> page = messageService.find(message,pageInfo);
		modelMap.put("list",page.getList());
		return BASE_DIR.concat("/list.jsp");
	}

	@RequestMapping(method = RequestMethod.POST)
	public RespBody list(@RequestParam("pageNo")int pageNo,@RequestParam("pageSize") int pageSize){
		Member member = (Member) session.getAttribute(GlobalConstant.SESSION_USER_KEY);
		Message message = new Message();
		PageInfo<Message> pageInfo = new PageInfo<>();
		pageInfo.setPageNum(pageNo);
		pageInfo.setPageSize(pageSize);
		message.setUserId(member.getId());
		PageInfo<Message> page = messageService.find(message,pageInfo);
		return RespBody.ok(page);
	}
}
