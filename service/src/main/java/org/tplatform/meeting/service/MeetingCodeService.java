package org.tplatform.meeting.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.tplatform.impl.BaseService;
import org.tplatform.meeting.entity.MeetingCode;
import org.tplatform.meeting.mapper.MeetingCodeMapper;

import java.util.List;

/**
 * Created by zjk on 2016/8/13.
 */
@Service
public class MeetingCodeService extends BaseService<MeetingCode> {

    @Autowired
    private MeetingCodeMapper meetingCodeMapper;

    public MeetingCode checkCode(String meetCode){
        List<MeetingCode> meetList = meetingCodeMapper.findMeetByCode(meetCode);
        if(meetList.size()>0){
            return meetList.get(0);
        }else{
            return null;
        }
    }

}
