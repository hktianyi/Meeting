package org.tplatform.meeting.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.tplatform.core.fsm.StatusEnum;
import org.tplatform.meeting.entity.MeetingCode;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;
import java.util.Map;

/**
 *
 * Created by wzl on 2016/8/6.
 */
public interface MeetingCodeMapper extends Mapper<MeetingCode> {

  @Select("SELECT * from t_meeting_code where meetCode = #{meetCode}")
  List<MeetingCode> findMeetByCode(@Param("meetCode") String meetCode);

  @Select("select t1.id, t1.meetcode, t1.bizStatus, t2.status, t2.name, t2.mobile, t2.createTime from t_meeting_code t1 left join t_meeting_attendee t2 on t1.id = t2.operator order by t1.bizStatus desc, t1.id")
  List<Map<String, Object>> selectForAttendee();

  @Update({"UPDATE t_meeting_code set status = #{status} where meetcode = #{meetCode};",
      "UPDATE t_meeting_attendee set status = #{status} where operator = (select id from t_meeting_code where meetcode = #{meetCode})"})
  int updateCodeAndAttendee(@Param("meetCode") String meetCode, @Param("status") StatusEnum status);
}
