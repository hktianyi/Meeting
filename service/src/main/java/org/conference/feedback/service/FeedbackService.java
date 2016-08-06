package org.conference.feedback.service;

import org.conference.feedback.mapper.FeedbackMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.tplatform.impl.BaseService;
import org.tplatform.meeting.entity.MeetingFeedback;

/**
 * 活动反馈服务类
 * 	活动信息反馈（基本）	填写往返航班/车次、用餐、活动等相关信息
 * 	其他活动反馈（扩展）	填写问卷调查、其他活动相关调查表
 * @author lihui
 * 2016年8月6日
 */
@Service
public class FeedbackService extends BaseService<MeetingFeedback> {

	@Autowired
	private FeedbackMapper feedbackMapper;
}
