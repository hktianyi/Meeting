package org.tplatform.meeting.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.tplatform.core.fsm.StatusEnum;
import org.tplatform.impl.BaseService;
import org.tplatform.meeting.entity.MeetingCode;
import org.tplatform.meeting.mapper.MeetingCodeMapper;
import org.tplatform.util.PropertyUtil;

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

    public String geneQrcode(String code){
        try {
            Document document = Jsoup.connect(String.format(PropertyUtil.getProInfo("config", "api_qrCode_cli"), "http://effie.china-caa.org/m/meetingcode/validate/qrCode/" + code)).get();
            Element element = document.select("#qrcode_plugins_img").first();
            return element.attr("src");
        }catch (Exception e) {
            e.printStackTrace();
        }
        //WXUtil.getProxy("1").sendTmplMessage(templateMessage);

//        try {
//            QRParameter parameter = new QRParameter();
//            QRResult res = WXUtil.getProxy("1").createQR(parameter);
//        }catch (Exception e){
//            e.printStackTrace();
//        }
        return null;
    }

    public PageInfo<Map<String, Object>> findForAttendee(MeetingCode meetingCode, PageInfo pageInfo) {
        if (pageInfo.getPageNum() == 0) {
            pageInfo.setPageNum(pageInfo.getStartRow() / pageInfo.getPageSize() + 1);
        }
        PageHelper.startPage(pageInfo.getPageNum(), pageInfo.getPageSize());
        return new PageInfo<>(meetingCodeMapper.selectForAttendee());
    }


    public boolean updateCodeAndAttendee(String meetCode) {
        return meetingCodeMapper.updateCodeAndAttendee(meetCode, StatusEnum.VALID) > 0;
    }
}
