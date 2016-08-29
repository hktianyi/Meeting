package org.meeting.attendee.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.tplatform.common.BaseCtrl;
import org.tplatform.meeting.entity.Message;
import org.tplatform.meeting.service.MeetingAttendeeService;

/**
 * Created by hdb on 2016/8/23.
 */
@Controller
@RequestMapping("/message")
public class MessageCtrl extends BaseCtrl<Message> {

  @Autowired
  private MeetingAttendeeService meetingAttendeeService;

  @Override
  protected void editHook(Long id, ModelMap modelMap) {
    modelMap.put("judgers", meetingAttendeeService.findAll());
    super.editHook(id, modelMap);
  }
}
