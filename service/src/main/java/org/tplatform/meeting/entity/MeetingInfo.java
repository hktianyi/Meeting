package org.tplatform.meeting.entity;

import lombok.Data;
import org.tplatform.core.entity.BaseEntity;

import javax.persistence.Table;

/**
 * 会议基本信息
 * Created by wzl on 2016/8/6.
 */
@Data
@Table(name = "t_meeting_info")
public class MeetingInfo extends BaseEntity {

    /**
     * 活动名称
     */
    private String name;
    /**
     * 活动地址
     */
    private String address;
    /**
     * 活动举办开始时间
     */
    private String startTime;
    /**
     * 活动举办结束时间
     */
    private String endTime;
    /**
     * 活动类型
     * {@link org.tplatform.meeting.entity.MeetingTypeEnum}
     */
    private String meetingType;

    /**
     * 费用
     */
    private String free;

    /**
     * 活动简介
     */
    private String introduction;

}
