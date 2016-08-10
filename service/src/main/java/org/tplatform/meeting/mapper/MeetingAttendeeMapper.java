package org.tplatform.meeting.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.tplatform.meeting.entity.MeetingAttendee;
import org.tplatform.meeting.entity.MeetingInfo;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 *
 * Created by wzl on 2016/8/6.
 */
public interface MeetingAttendeeMapper extends Mapper<MeetingAttendee> {

  @Select("SELECT t1.* from t_meeting_info t1, t_meeting_attendee t2 WHERE t1.id = t2.meetingId AND t2.operator = #{userId}")
  List<MeetingInfo> findByUserId(@Param("userId") Long userId);

  @Select("SELECT count(1) from t_meeting_attendee WHERE meetingId = #{meetingId} AND operator = #{userId}")
  int signUp(@Param("meetingId") Long meetingId, @Param("userId") Long userId);

}
