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

    private Long meetingId;
    private String name;
    private String salutation;
    private String company;
    private String title;
    private String email;
    private String mobile;
    private String travelType;
    private String travelName;
    private String travelNo;
    private String contactName;
    private String contactEmail;
    private String contactMobile;

    private String isStay;
    private String stayDate;
    private String leaveDate;

    private String schedule221; // 艾菲研讨会 Effie Seminar
    private String schedule222; // 自助午餐 Buffet Lunch
    private String schedule223; // VIP欢迎晚宴 VIP Welcome Dinner

    private String schedule230; // VIP自助午餐/VIP Buffet Lunch
    private String schedule231; // 艾菲酒会 Effie Reception
    private String schedule232; // 红毯秀 Red Carpet Show
    private String schedule233; // 艾菲颁奖典礼 Effie Awards Gala
    private String schedule234; // 艾菲派对 Effie After Party

    private String schedule241; // 2016优秀案例赏析会 2016 Effie Forum
    private String schedule242; // VIP午宴 VIP Luncheon

    // 自助入场次数
    private String schedule222_c;
    private String schedule230_c;
    private String schedule242_c;
    private String print_c;

    // 日程笔记
    private String remark0;
    private String remark1;
    private String remark2;
    private String remark3;
    private String remark4;
    private String remark5;
    private String remark6;
    private String remark7;
    private String remark8;
    private String remark9;
    private String remark10;

}
