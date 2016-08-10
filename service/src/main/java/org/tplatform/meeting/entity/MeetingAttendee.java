package org.tplatform.meeting.entity;

import lombok.Data;
import org.tplatform.core.entity.BaseEntity;

import javax.persistence.Table;

/**
 * 参加会议人员信息
 * Created by wzl on 2016/8/6.
 */
@Data
@Table(name = "t_meeting_attendee")
public class MeetingAttendee extends BaseEntity {

    /**
     * 邮箱
     */
    private String email;

    /**
     * 手机郝
     */
    private String telephone;

    /**
     * 省
     */
    private String province;
    /**
     * 城市
     */
    private String city;
    /**
     * 详细地址
     */
    private String address;

    private Long meetingId;

}
