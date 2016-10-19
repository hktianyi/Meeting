package org.meeting.attendee.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.tplatform.common.BaseCtrl;
import org.tplatform.common.ViewExcelXls;
import org.tplatform.core.entity.RespBody;
import org.tplatform.core.fsm.StatusEnum;
import org.tplatform.meeting.entity.MeetingAttendee;
import org.tplatform.meeting.service.MeetingAttendeeService;
import org.tplatform.meeting.service.MeetingCodeService;

import java.util.stream.Collectors;

/**
 * Created by hdb on 2016/8/23.
 */
@Controller
@RequestMapping("/attendee")
public class AttendeeCtrl extends BaseCtrl<MeetingAttendee> {

  @Autowired
  private MeetingAttendeeService meetingAttendeeService;
  @Autowired
  private MeetingCodeService meetingCodeService;

  @Override
  protected void editHook(Long id, ModelMap modelMap) {
    if (id != null) {
      MeetingAttendee meetingAttendee = baseService.find(id);
      modelMap.put("data", meetingAttendee);
      modelMap.put("qrCodeUrl", meetingCodeService.geneQrcode(id.toString()));
    }
  }

  @RequestMapping("/viewAll")
  public String viewAll(ModelMap modelMap) {
    MeetingAttendee meetingAttendee = new MeetingAttendee();
    meetingAttendee.setStatus(StatusEnum.COMMIT);
    modelMap.addAttribute("dataList", meetingAttendeeService.find(meetingAttendee));
    return super.dir + "/view_all.jsp";
  }

  @RequestMapping("/view/{type}")
  public String view(@PathVariable("type") String type) {
    return super.dir + "/view_" + type + ".jsp";
  }

  @RequestMapping("/viewData/{actionType}/{id}")
  @ResponseBody
  public RespBody viewData(@PathVariable("actionType") String actionType, @PathVariable("id") Long id) {
    if("level".equalsIgnoreCase(actionType)) {
      meetingCodeService.updateCodeAndAttendee(id.toString());
    } else {
      meetingAttendeeService.update(actionType, id);
    }
    return RespBody.ok(baseService.find(id));
  }

  @RequestMapping("/view_s")
  @ResponseBody
  public RespBody search(@RequestParam("keyword") String keyword) {
    return RespBody.ok(meetingAttendeeService.search(keyword));
  }

  /**
   * 导出
   * @param filename
   * @param suffix
   * @param modelMap
   * @return
   */
  @RequestMapping("/export{filename}.{suffix}")
  public ModelAndView export(@PathVariable("filename") String filename, @PathVariable("suffix") String suffix, ModelMap modelMap) {
    String[] sheetName = new String[]{filename};
    modelMap.put("sheetName", sheetName);

    modelMap.put(sheetName[0] + ".titles", new String[]{"报名时间","姓名","称谓","公司名","职位","邮箱","手机","证件类型","证件名称","证件号码","联系人姓名","联系人邮箱","联系人手机号","是否需要住宿","入住日期","离开日期","艾菲研讨会 Effie Seminar","自助午餐 Buffet Lunch","VIP欢迎晚宴 VIP Welcome Dinner","VIP自助午餐 VIP Buffet Lunch","艾菲酒会 Effie Reception","红毯秀 Red Carpet Show","艾菲颁奖典礼 Effie Awards Gala","艾菲派对 Effie After Party","2016优秀案例赏析会 2016 Effie Forum","VIP午宴 VIP Luncheon","状态"});
    modelMap.put(sheetName[0] + ".fieldNames", new String[][]{{"createTime"},{"name"},{"salutation"},{"company"},{"title"},{"email"},{"mobile"},{"travelType"},{"travelName"},{"travelNo"},{"contactName"},{"contactEmail"},{"contactMobile"},{"isStay"},{"stayDate"},{"leaveDate"},{"schedule221"},{"schedule222"},{"schedule223"},{"schedule230"},{"schedule231"},{"schedule232"},{"schedule233"},{"schedule234"},{"schedule241"},{"schedule242"},{"hierarchy"}});
    modelMap.put(sheetName[0] + ".data", meetingAttendeeService.findAll().stream().map(entry -> {
      entry.setSalutation("1".equals(entry.getSalutation()) ? "先生/Mr" : "女士/Ms");
      entry.setIsStay("0".equals(entry.getIsStay()) ? "否/NO" : "是/YES");
      entry.setSchedule221("0".equals(entry.getSchedule221()) ? "不参加/NO" : "参加/YES");
      entry.setSchedule222("0".equals(entry.getSchedule222()) ? "不参加/NO" : "参加/YES");
      entry.setSchedule223("0".equals(entry.getSchedule223()) ? "不参加/NO" : "参加/YES");
      entry.setSchedule230("0".equals(entry.getSchedule230()) ? "不参加/NO" : "参加/YES");
      entry.setSchedule231("0".equals(entry.getSchedule231()) ? "不参加/NO" : "参加/YES");
      entry.setSchedule232("0".equals(entry.getSchedule232()) ? "不参加/NO" : "参加/YES");
      entry.setSchedule233("0".equals(entry.getSchedule233()) ? "不参加/NO" : "参加/YES");
      entry.setSchedule234("0".equals(entry.getSchedule234()) ? "不参加/NO" : "参加/YES");
      entry.setSchedule241("0".equals(entry.getSchedule241()) ? "不参加/NO" : "参加/YES");
      entry.setSchedule242("0".equals(entry.getSchedule242()) ? "不参加/NO" : "参加/YES");
      entry.setHierarchy(StatusEnum.VALID.equals(entry.getStatus()) ? "已签到" : "已报名");
      return entry;
    }).collect(Collectors.toList()));

    return new ModelAndView(new ViewExcelXls(), modelMap);
  }

  /**
   * 统计邀请码、嘉宾签到信息
   * @param modelMap
   * @return
   */
  @RequestMapping("/stats")
  public String stats(ModelMap modelMap) {
    Long countCommit = meetingAttendeeService.count("status = '"+StatusEnum.COMMIT.name()+"'");
    Long countValid = meetingAttendeeService.count("status = '"+StatusEnum.VALID.name()+"'");
    modelMap.put("countCommit", countCommit);
    modelMap.put("countValid", countValid);
    modelMap.put("countUnused", 100 - countCommit - countValid);
    modelMap.put("countGenderMr", meetingAttendeeService.count("salutation = '1'"));
    modelMap.put("countGenderMs", meetingAttendeeService.count("salutation = '2'"));

    modelMap.put("countStay1", meetingAttendeeService.count("isStay='1'"));
    modelMap.put("countStay0", meetingAttendeeService.count("isStay='0'"));
    modelMap.put("countSchedule2211", meetingAttendeeService.count("schedule221='1'"));
    modelMap.put("countSchedule2210", meetingAttendeeService.count("schedule221='0'"));
    modelMap.put("countSchedule2221", meetingAttendeeService.count("schedule222='1'"));
    modelMap.put("countSchedule2220", meetingAttendeeService.count("schedule222='0'"));
    modelMap.put("countSchedule2231", meetingAttendeeService.count("schedule223='1'"));
    modelMap.put("countSchedule2230", meetingAttendeeService.count("schedule223='0'"));
    modelMap.put("countSchedule2301", meetingAttendeeService.count("schedule230='1'"));
    modelMap.put("countSchedule2300", meetingAttendeeService.count("schedule230='0'"));
    modelMap.put("countSchedule2311", meetingAttendeeService.count("schedule231='1'"));
    modelMap.put("countSchedule2310", meetingAttendeeService.count("schedule231='0'"));
    modelMap.put("countSchedule2321", meetingAttendeeService.count("schedule232='1'"));
    modelMap.put("countSchedule2320", meetingAttendeeService.count("schedule232='0'"));
    modelMap.put("countSchedule2331", meetingAttendeeService.count("schedule233='1'"));
    modelMap.put("countSchedule2330", meetingAttendeeService.count("schedule233='0'"));
    modelMap.put("countSchedule2341", meetingAttendeeService.count("schedule234='1'"));
    modelMap.put("countSchedule2340", meetingAttendeeService.count("schedule234='0'"));
    modelMap.put("countSchedule2411", meetingAttendeeService.count("schedule241='1'"));
    modelMap.put("countSchedule2410", meetingAttendeeService.count("schedule241='0'"));
    modelMap.put("countSchedule2421", meetingAttendeeService.count("schedule242='1'"));
    modelMap.put("countSchedule2420", meetingAttendeeService.count("schedule242='0'"));
    return "/stats/judger.jsp";
  }


//  /**
//   * 保存数据
//   *
//   * @param attendee 实体对象
//   * @return
//   */
//  @RequestMapping(value = "/save", method = RequestMethod.POST)
//  @ResponseBody
//  public RespBody save(MeetingAttendee attendee) {
//    meetingAttendeeService.saveRemark(attendee);
//    return RespBody.ok();
//  }

}
