package org.tplatform.meeting.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.tplatform.common.BaseCtrl;
import org.tplatform.constant.GlobalConstant;
import org.tplatform.framework.log.Logger;
import org.tplatform.meeting.entity.MeetingCode;
import org.tplatform.meeting.service.MeetingCodeService;
import org.tplatform.member.entity.Member;
import org.weixin.user.service.WXUserService;

import java.text.MessageFormat;
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
    private WXUserService wxUserService;

    @RequestMapping(value = "/checkcode", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> checkCode(ModelMap model,String meetCode){
        Map<String, Object> result = new HashMap<>();
        MeetingCode meetingCode = meetingCodeService.checkCode(meetCode);
        if(meetingCode!=null){
            Member member = new Member();
            member.setId(meetingCode.getId());
            member.setUserName(meetCode);
            member.setHierarchy(meetingCode.getHierarchy());
            session.setAttribute(GlobalConstant.KEY_SESSION_USER, member);
            result.put("status", "1");
            result.put("meetingId", meetingCode.getMeetingId());

            String ua = request.getHeader("user-agent").toLowerCase();
            if(ua.contains("micromessenger"))
                wxUserService.bindMember(String.valueOf(session.getAttribute(GlobalConstant.KEY_SESSION_APPID)), String.valueOf(session.getAttribute(GlobalConstant.KEY_SESSION_OPENID)), meetingCode.getId());
        }else{
            result.put("status", "0");
        }
        return result;
    }


    @RequestMapping(value = "/welcome")
    public String welcome(ModelMap model,String meetCode){
        if(session.getAttribute(GlobalConstant.KEY_SESSION_USER) != null) return GlobalConstant.REDIRECT + "/meeting/detail/2";
        return "/meeting/welcome.jsp";
    }


    @RequestMapping(value = "/validate/qrCode/{meetCode}")
    public String validate(@PathVariable String meetCode, ModelMap model){
        model.put("meetCode", meetCode);
        Member member = (Member)session.getAttribute(GlobalConstant.KEY_SESSION_USER);
        if(member!=null && (member.getUserName().startsWith("88888"))) {
            Logger.i("管理员扫码签到: " + meetCode);
            boolean flag = meetingCodeService.updateCodeAndAttendee(meetCode);
            model.put("qd", flag);
            Logger.i(MessageFormat.format("签到结果: {0}", flag ? "成功" : "失败"));
            return "/meeting/qdSuccess.jsp";
        } else {
            Logger.i("请管理员扫码签到: " + meetCode);
            return "/meeting/admin.jsp";
        }
    }


    @RequestMapping(value = "/qrcodecheck")
    public String qrcodecheck(ModelMap model){
        Member member = (Member) session.getAttribute(GlobalConstant.KEY_SESSION_USER);
        model.put("qrCodeUrl", meetingCodeService.geneQrcode(member.getUserName()));
        return "/meeting/qrcodecheck.jsp";
    }




}
