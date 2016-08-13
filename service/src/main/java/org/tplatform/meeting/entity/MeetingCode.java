package org.tplatform.meeting.entity;

import lombok.Data;
import org.tplatform.core.entity.BaseEntity;

import javax.persistence.Table;

/**
 * 活动验证码
 * Created by zjk on 2016/8/13.
 */
@Data
@Table(name = "t_meeting_code")
public class MeetingCode extends BaseEntity {

    private String meetCode;

    private Long meetingId;

    private String bizStatus;//未使用：1，已使用：2，已报名：3

    private String userId;

}
