package org.tplatform.meeting.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.tplatform.meeting.entity.MeetingSchedule;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 *
 * Created by wzl on 2016/8/6.
 */
public interface MeetingScheduleMapper extends Mapper<MeetingSchedule> {

  @Select("SELECT id,createTime,operator,status,meetingId,title,context,scheduleDate,timeOfDay,startTime,endTime FROM t_meeting_schedule WHERE meetingId = #{meetingSchedule.meetingId} order by sort")
  List<MeetingSchedule> select(@Param("meetingSchedule") MeetingSchedule meetingSchedule);

}
