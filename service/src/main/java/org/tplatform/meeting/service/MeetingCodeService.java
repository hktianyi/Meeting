package org.tplatform.meeting.service;

import com.foxinmy.weixin4j.mp.model.QRParameter;
import com.foxinmy.weixin4j.mp.model.QRResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.tplatform.impl.BaseService;
import org.tplatform.meeting.entity.MeetingCode;
import org.tplatform.meeting.mapper.MeetingCodeMapper;
import org.tplatform.util.WXUtil;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
            MeetingCode meetingCode = meetList.get(0);
            meetingCode.setBizStatus("2");
            this.saveOrUpdate(meetingCode);
            return meetList.get(0);
        }else{
            return null;
        }


    }

    public Map<String, Object> geneQrcode(){
        //WXUtil.getProxy("1").sendTmplMessage(templateMessage);

//        try {
//            QRParameter parameter = new QRParameter();
//            QRResult res = WXUtil.getProxy("1").createQR(parameter);
//        }catch (Exception e){
//            e.printStackTrace();
//        }
        return null;
    }

}
