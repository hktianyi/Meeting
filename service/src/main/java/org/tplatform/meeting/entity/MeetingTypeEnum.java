package org.tplatform.meeting.entity;

/**
 * 会议类型枚举
 * Created by wzl on 2016/8/6.
 */
public enum MeetingTypeEnum {

    PPERXUN(1,"培训/讲座"),
    JOBSUMMAY(1,"工作会/总结会"),
    DAXIE(1,"答谢会"),
    YYANTAO(1,"研讨/交流/论坛"),
    SHANGWU(1,"经销商会议/招商会/推介会"),
    NIANHUI(1,"公司年会"),
    TONGXUE(1,"同学会/好友聚会"),
    FABU(1,"发布会/颁奖/庆典"),
    SHAOLONG(1,"沙龙"),
    TUANJIAN(1,"团队建设/拓展/休闲会议");

    private int code;
    private String value;

    MeetingTypeEnum(int code,String value){
     this.code = code;
    }

    public String getValue(){
        return this.value;
    }

}
