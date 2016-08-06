package org.tplatform.meeting.entity;

import lombok.Data;
import org.tplatform.core.entity.BaseEntity;

import javax.persistence.Table;

/**
 * 会议反馈信息
 *    往返航班/车次、用餐、活动等相关信息
 * Created by wzl on 2016/8/6.
 */
@Data
@Table(name = "t_meeting_feedback")
public class MeetingFeedback extends BaseEntity {

    /**
     * 来时交通工具类型
     */
    private String comeType;
    /**
     * 来时航班/车次
     */
    private String comeTicket;
    /**
     * 回时交通工具类型
     */
    private String backType;
    /**
     * 回时航班/车次
     */
    private String backTicket;


}
