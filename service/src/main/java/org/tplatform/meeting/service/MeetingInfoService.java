package org.tplatform.meeting.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.tplatform.impl.BaseService;
import org.tplatform.meeting.entity.MeetingInfo;
import org.tplatform.meeting.entity.MeetingSchedule;

import java.io.Serializable;

/**
 * Created by wzl on 2016/8/6.
 */
@Service
public class MeetingInfoService extends BaseService<MeetingInfo> {

  @Autowired
  private MeetingScheduleService meetingScheduleService;

  @Override
  public MeetingInfo find(Serializable id) {
    MeetingInfo meetingInfo = super.find(id);
    MeetingSchedule schedule = new MeetingSchedule();
    schedule.setMeetingId(meetingInfo.getId());
    meetingInfo.setDetail(meetingScheduleService.find(schedule));
    return meetingInfo;
  }
}
