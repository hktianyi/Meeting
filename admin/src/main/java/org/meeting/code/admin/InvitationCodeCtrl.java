package org.meeting.code.admin;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.tplatform.common.BaseCtrl;
import org.tplatform.core.entity.RespBody;
import org.tplatform.meeting.entity.MeetingCode;
import org.tplatform.meeting.service.MeetingCodeService;

/**
 * Created by hdb on 2016/8/23.
 */
@Controller
@RequestMapping("/invitationCode")
public class InvitationCodeCtrl extends BaseCtrl<MeetingCode> {

  @Autowired
  private MeetingCodeService meetingCodeService;

  @Override
  public RespBody load(MeetingCode meetingCode, PageInfo pageInfo, Integer start, Integer length) {
    pageInfo.setStartRow(start);
    pageInfo.setPageSize(length);
    return RespBody.ok(meetingCodeService.findForAttendee(meetingCode, pageInfo));
  }

  /**
   * 签到
   * @param meetCode
   * @return
   */
  @RequestMapping("/signIn/{meetCode}")
  @ResponseBody
  public RespBody signIn(@PathVariable String meetCode) {
    meetingCodeService.updateCodeAndAttendee(meetCode);
    return RespBody.ok();
  }
}
