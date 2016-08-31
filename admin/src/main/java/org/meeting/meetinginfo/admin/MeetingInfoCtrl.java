package org.meeting.meetinginfo.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.tplatform.common.BaseCtrl;
import org.tplatform.meeting.entity.MeetingInfo;

/**
 * Created by tianyi on 16/8/31.
 */
@Controller
@RequestMapping("/meetingInfo")
public class MeetingInfoCtrl extends BaseCtrl<MeetingInfo> {

}
