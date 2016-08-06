package org.conference.feedback;

import org.conference.feedback.mapper.FeedbackMapper;
import org.junit.Test;
import org.tplatform.meeting.entity.MeetingFeedback;

public class FeedbackTest {

	
	
	@Test
	public void testInsert(){
		MeetingFeedback mfb = new MeetingFeedback();
		mfb.setComeType("轿车");
		mfb.setComeTicket("test");
		mfb.setBackType("火车");
		mfb.setBackTicket("back");
		mfb.setActivity("活动很好！！！！");
		
	}
}
