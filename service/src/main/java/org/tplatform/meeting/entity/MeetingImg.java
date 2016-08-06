package org.tplatform.meeting.entity;

import lombok.Data;
import org.tplatform.core.entity.BaseEntity;

import javax.persistence.Table;

/**
 * 会议图片信息
 * Created by wzl on 2016/8/6.
 */
@Data
@Table(name = "t_meeting_img")
public class MeetingImg extends BaseEntity {

    /**
     * 图片名称
     */
    private String name;
    /**
     * 图片类型
     * {@link org.tplatform.meeting.entity.MeetingImgTypeEnum}
     */
    private String imgType;

    /**
     * 图片连接地址
     */
    private String imgUrl;

    /**
     * 图片简介
     */
    private String introduction;

}
