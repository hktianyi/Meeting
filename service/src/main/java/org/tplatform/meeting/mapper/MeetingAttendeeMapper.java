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

  @Update("UPDATE t_meeting_attendee SET remark0 = #{attendee.remark0}, remark1 = #{attendee.remark1}," +
      " remark2 = #{attendee.remark2}, remark3 = #{attendee.remark3}, remark4 = #{attendee.remark4}," +
      " remark5 = #{attendee.remark5}, remark6 = #{attendee.remark6}, remark7 = #{attendee.remark7}," +
      " remark8 = #{attendee.remark8}, remark9 = #{attendee.remark9}, remark10 = #{attendee.remark10} WHERE id = #{attendee.id}")
  int saveRemark(@Param("attendee") MeetingAttendee attendee);

  @Update({"UPDATE t_meeting_attendee set ${actionType}_c = ${actionType}_c+1 where id = #{id}"})
  int update(@Param("actionType") String actionType, @Param("id") Long id);

  @Override
  @Select("SELECT * FROM t_meeting_attendee WHERE name LIKE '%${record.name}%' AND mobile LIKE '%${record.mobile}%' AND email LIKE '%${record.email}%'")
  List<MeetingAttendee> select(@Param("record") MeetingAttendee record);

  @Select("SELECT * FROM t_meeting_attendee WHERE id LIKE \"%\"#{keyword}\"%\" OR name LIKE \"%\"#{keyword}\"%\" OR mobile LIKE \"%\"#{keyword}\"%\"")
  List<MeetingAttendee> search(@Param("keyword") String keyword);
}
