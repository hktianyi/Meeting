package org.tplatform.meeting.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.tplatform.impl.BaseService;
import org.tplatform.meeting.entity.MeetingAttendee;
import org.tplatform.meeting.entity.MeetingInfo;
import org.tplatform.meeting.mapper.MeetingAttendeeMapper;

import java.util.List;

/**
 * Created by wzl on 2016/8/6.
 */
@Service
public class MeetingAttendeeService extends BaseService<MeetingAttendee> {

  @Autowired
  private MeetingAttendeeMapper meetingAttendeeMapper;

  public List<MeetingInfo> findByUserId(Long userId) {
    return meetingAttendeeMapper.findByUserId(userId);
  }

  public int signUp(Long meetingId, Long userId) {
    return meetingAttendeeMapper.signUp(meetingId, userId);
  }

}
