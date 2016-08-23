package org.meeting.attendee.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.tplatform.common.BaseCtrl;
import org.tplatform.meeting.entity.MeetingAttendee;

/**
 * Created by hdb on 2016/8/23.
 */
@Controller
@RequestMapping("/attendee")
public class AttendeeCtrl extends BaseCtrl<MeetingAttendee> {
}
