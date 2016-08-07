package org.tplatform.meeting.entity;

import lombok.Data;
import org.tplatform.core.entity.BaseEntity;

import javax.persistence.Table;

/**
 * 会议日程信息
 * Created by wzl on 2016/8/6.
 */
@Data
@Table(name = "t_meeting_schedule")
public class MeetingSchedule extends BaseEntity {

    private Long meetingId;
    /**
     * 日程标题
     */
    private String title;
    /**
     * 日程内容
     */
    private String context;
    /**
     * 日程日期(YYYY-MM-DD)
     */
    private String scheduleDate;
    /**
     * 日程举办时间 上午 、下午
     * {@link org.tplatform.meeting.entity.TimeOfDayEnum}
     */
    private String timeOfDay;
    /**
     * 开始时间点
     */
    private String startTime;
    /**
     * 结束时间点
     */
    private String endTime;


}
