package org.meeting.attendee.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.tplatform.common.BaseCtrl;
import org.tplatform.core.entity.RespBody;
import org.tplatform.meeting.entity.Message;
import org.tplatform.meeting.service.MeetingAttendeeService;
import org.tplatform.util.WXUtil;
import org.weixin.message.entity.TemplateMsg;
import org.weixin.message.service.TemplateMsgService;
import org.weixin.user.service.WXUserService;

/**
 * Created by hdb on 2016/8/23.
 */
@Controller
@RequestMapping("/message")
public class MessageCtrl extends BaseCtrl<Message> {

  @Autowired
  private MeetingAttendeeService meetingAttendeeService;
  @Autowired
  private WXUserService wxUserService;
  @Autowired
  private TemplateMsgService templateMsgService;

  @Override
  protected void editHook(Long id, ModelMap modelMap) {
    String appId = WXUtil.getAppId();
    modelMap.put("attendees", meetingAttendeeService.findAll());
    modelMap.put("members", wxUserService.findMembers(appId));
    modelMap.put("templates", templateMsgService.find(appId));
    modelMap.put("appId", appId);
    super.editHook(id, modelMap);
  }

  /**
   * 发送微信模板消息
   * @param templateMsg
   * @return
   */
  @RequestMapping("/sendTemplateMsg")
  protected RespBody sendTemplateMsg(TemplateMsg templateMsg) {
    templateMsgService.send(templateMsg);
    return RespBody.ok();
  }
}
