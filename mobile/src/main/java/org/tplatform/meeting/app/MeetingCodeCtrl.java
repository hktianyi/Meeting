package org.tplatform.meeting.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.tplatform.common.BaseCtrl;
import org.tplatform.constant.GlobalConstant;
import org.tplatform.meeting.entity.MeetingCode;
import org.tplatform.meeting.service.MeetingAttendeeService;
import org.tplatform.meeting.service.MeetingCodeService;
import org.tplatform.meeting.service.MeetingInfoService;
import org.tplatform.meeting.service.MeetingScheduleService;
import org.tplatform.member.entity.Member;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by wzl on 2016/8/13.
 */
@Controller
@RequestMapping("/meetingcode")
public class MeetingCodeCtrl extends BaseCtrl {


    @Autowired
    private MeetingCodeService meetingCodeService;
    @Autowired
    private MeetingInfoService meetingInfoService;
    @Autowired
    private MeetingScheduleService meetingScheduleService;
    @Autowired
    private MeetingAttendeeService meetingAttendeeService;

    @RequestMapping(value = "/checkcode", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> checkCode(ModelMap model,String meetCode){
        Map<String, Object> result = new HashMap<>();
        MeetingCode meetingCode = meetingCodeService.checkCode(meetCode);
        if(meetingCode!=null){
            Member member = new Member();
            member.setId(meetingCode.getId());
            member.setUserName(meetCode);
            session.setAttribute(GlobalConstant.SESSION_USER_KEY, member);
            result.put("status", "1");
            result.put("meetingId", meetingCode.getMeetingId());
        }else{
            result.put("status", "0");
        }
        return result;
    }


    @RequestMapping(value = "/welcome")
    public String welcome(ModelMap model,String meetCode){

        return "/meeting/welcome.jsp";
    }


    @RequestMapping(value = "/qrcodecheck")
    public String qrcodecheck(ModelMap model){
        //meetingCodeService.geneQrcode();
        return "/meeting/qrcodecheck.jsp";
    }





}
