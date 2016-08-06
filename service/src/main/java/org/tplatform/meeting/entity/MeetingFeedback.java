package org.tplatform.meeting.entity;

import lombok.Data;
import org.tplatform.core.entity.BaseEntity;

import javax.persistence.Table;

/**
 * 会议反馈信息
 * Created by wzl on 2016/8/6.
 */
@Data
@Table(name = "t_meeting_feedback")
public class MeetingFeedback extends BaseEntity {



}
