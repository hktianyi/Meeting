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


}
