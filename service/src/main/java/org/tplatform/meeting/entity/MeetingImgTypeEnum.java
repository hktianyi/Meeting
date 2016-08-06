package org.tplatform.meeting.entity;

/**
 * 会议图片类型枚举
 * Created by wzl on 2016/8/6.
 */
public enum MeetingImgTypeEnum {

    COVER(1,"封面图"),
    GENERAL(2,"普通图片");

    private int code;
    private String value;

    MeetingImgTypeEnum(int code, String value){
     this.code = code;
    }

    public String getValue(){
        return this.value;
    }

}
