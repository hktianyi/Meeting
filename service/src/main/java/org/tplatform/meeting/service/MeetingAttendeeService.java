package org.tplatform.meeting.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.tplatform.core.fsm.StatusEnum;
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

  public Long findattendeeIdByMeetCode(String meetCode) {
    return meetingAttendeeMapper.findattendeeIdByMeetCode(meetCode);
  }

  /**
   * 统计数量
   * @param status
   * @return
   */
  public Long count(StatusEnum status) {
    return meetingAttendeeMapper.count("status = '"+status.name()+"'");
  }

  public boolean update(String actionType, Long id) {
    return meetingAttendeeMapper.update(actionType, id) > 0;
  }

  /**
   * 统计数量
   * @param where
   * @return
   */
  public Long count(String where) {
    return meetingAttendeeMapper.count(where);
  }

  public int signUp(Long meetingId, Long userId) {
    return meetingAttendeeMapper.signUp(meetingId, userId);
  }

  public String getPostil(Long id, String key) {
    return meetingAttendeeMapper.getPostil(id, key);
  }

  public int setPostil(Long id, String key, String value) {
    return meetingAttendeeMapper.setPostil(id, key, value);
  }

  public int saveRemark(MeetingAttendee attendee) {
    return meetingAttendeeMapper.saveRemark(attendee);
  }
}
