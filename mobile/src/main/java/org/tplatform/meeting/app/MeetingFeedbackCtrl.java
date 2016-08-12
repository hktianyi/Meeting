package org.tplatform.meeting.app;

import org.tplatform.meeting.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.tplatform.common.BaseCtrl;
import org.tplatform.meeting.entity.MeetingFeedback;

/**
 * 活动反馈
 * @author lihui
 * 2016年8月6日
 */
@Controller
@RequestMapping
public class MeetingFeedbackCtrl extends BaseCtrl {

	@Autowired
	private FeedbackService feedbackService;
	
	@RequestMapping(value = "/feedback")
	public String init() {

		return "/feedback.jsp";
	}
	
	@RequestMapping(value = "/saveFeedback",method = RequestMethod.POST)
	public String saveFeedback(MeetingFeedback mf) {

		feedbackService.save(mf);
		
		return "/feedback.jsp";
	}
}
