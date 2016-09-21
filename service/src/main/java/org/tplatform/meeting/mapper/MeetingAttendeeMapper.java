package org.tplatform.meeting.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
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

  @Select("SELECT t1.id FROM t_meeting_attendee t1, t_meeting_code t2 WHERE t1.operator = t2.id AND t2.meetCode = #{meetCode}")
  Long findattendeeIdByMeetCode(@Param("meetCode") String meetCode);

  @Select("SELECT COUNT(1) FROM t_meeting_attendee t1 WHERE ${where}")
  Long count(@Param("where") String where);

  @Select("SELECT ${key} FROM t_meeting_attendee t1 WHERE id = #{id}")
  String getPostil(@Param("id") Long id, @Param("key") String key);

  @Update("UPDATE t_meeting_attendee t1 set `${key}` = #{value} WHERE id = #{id}")
  int setPostil(@Param("id") Long id, @Param("key") String key, @Param("value") String value);
}
