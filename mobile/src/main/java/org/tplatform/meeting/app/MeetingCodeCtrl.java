package org.tplatform.meeting.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.tplatform.common.BaseCtrl;
import org.tplatform.constant.GlobalConstant;
import org.tplatform.core.entity.RespBody;
import org.tplatform.core.fsm.StatusEnum;
import org.tplatform.framework.util.DateUtil;
import org.tplatform.meeting.entity.*;
import org.tplatform.meeting.service.*;
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




}
