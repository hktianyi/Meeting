package org.tplatform.meeting.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.tplatform.meeting.entity.MeetingAttendee;
import org.tplatform.meeting.entity.MeetingCode;
import org.tplatform.meeting.entity.MeetingInfo;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 *
 * Created by wzl on 2016/8/6.
 */
public interface MeetingCodeMapper extends Mapper<MeetingCode> {

  @Select("SELECT * from t_meeting_code where meetCode = #{meetCode}")
  List<MeetingCode> findMeetByCode(@Param("meetCode") String meetCode);

}
