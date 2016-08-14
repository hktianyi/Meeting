package org.tplatform.meeting.entity;

import lombok.Data;
import org.tplatform.core.entity.BaseEntity;
import org.tplatform.core.fsm.CardTypeEnum;
import org.tplatform.core.fsm.SalutationEnum;

import javax.persistence.Table;

/**
 * 参加会议人员信息
 * Created by wzl on 2016/8/6.
 */
@Data
@Table(name = "t_meeting_attendee")
public class MeetingAttendee extends BaseEntity {

    private String name;
    private String salutation;
    private String company;
    private String title;
    private String email;
    private String mobile;
    private String  travelType;
    private String travelName;
    private String travelNo;
    private String contactName;
    private String contactEmail;
    private String contactMobile;
    private Long meetingId;

}
