package org.meeting.attendee.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.tplatform.common.BaseCtrl;
import org.tplatform.core.entity.RespBody;
import org.tplatform.meeting.entity.Message;
import org.tplatform.meeting.service.MeetingAttendeeService;
import org.tplatform.meeting.service.MessageService;
import org.tplatform.util.WXUtil;
import org.weixin.message.entity.TemplateMsg;
import org.weixin.message.entity.TemplateMsgDetail;
import org.weixin.message.service.TemplateMsgService;
import org.weixin.user.service.WXUserService;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Created by hdb on 2016/8/23.
 */
@Controller
@RequestMapping("/message")
public class MessageCtrl extends BaseCtrl<Message> {

  @Autowired
  private MeetingAttendeeService meetingAttendeeService;
  @Autowired
  private MessageService messageService;
  @Autowired
  private WXUserService wxUserService;
  @Autowired
  private TemplateMsgService templateMsgService;

  @Override
  protected void editHook(Long id, ModelMap modelMap) {
    String appId = WXUtil.getAppId();
    modelMap.put("attendees", meetingAttendeeService.findAll());
    modelMap.put("wxUsers", wxUserService.selectWXUser(appId));
    modelMap.put("templates", templateMsgService.find(appId));
    modelMap.put("appId", appId);
    super.editHook(id, modelMap);
  }

  /**
   * 发送微信模板消息
   * @param id
   * @return
   */
  @RequestMapping("/sendTemplateMsg")
  @ResponseBody
  public RespBody sendTemplateMsg(@RequestParam Long id, @RequestParam String appId, @RequestParam("openId[]") List<String> openId, @RequestParam Map<String, String> params) {
    params.remove("id");
    params.remove("appId");
    params.remove("openId[]");
    TemplateMsg templateMsg = templateMsgService.find(id);
    templateMsg.setAppId(appId);
    templateMsg.setOpenId(openId);
    templateMsg.setDetail(params.entrySet().stream().map(entry -> new TemplateMsgDetail(entry.getKey(), "#333", entry.getValue())).collect(Collectors.toList()));
    templateMsgService.send(templateMsg);
    return RespBody.ok();
  }

  /**
   * 发送站内信
   * @param message
   * @return
   */
  @RequestMapping("/sendStationMsg")
  @ResponseBody
  public RespBody sendStationMsg(@RequestParam("memberId[]") Long[] memberId, Message message) {
    for(Long id : memberId) {
      message.setUserId(id);
      messageService.save(message);
    }
    return RespBody.ok();
  }
}
