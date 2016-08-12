package org.tplatform.meeting.mapper;

import org.tplatform.meeting.entity.MeetingFeedback;

import tk.mybatis.mapper.common.Mapper;
/**
 * 活动反馈dao
 * @author lihui
 * 2016年8月6日
 */
public interface FeedbackMapper extends Mapper<MeetingFeedback>{

	/*@Insert("")
	boolean insert(@Param("comeType") String comeType, @Param("comeTicket") String comeTicket,
			@Param("backType") String backType, @Param("backTicket") String backTicket, @Param("dinner") String dinner,
			@Param("activity") String activity);*/

}
