package org.meeting.attendee.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.tplatform.common.BaseCtrl;
import org.tplatform.common.ViewExcelXls;
import org.tplatform.core.fsm.StatusEnum;
import org.tplatform.meeting.entity.MeetingAttendee;
import org.tplatform.meeting.service.MeetingAttendeeService;

import java.util.stream.Collectors;

/**
 * Created by hdb on 2016/8/23.
 */
@Controller
@RequestMapping("/attendee")
public class AttendeeCtrl extends BaseCtrl<MeetingAttendee> {

  @Autowired
  private MeetingAttendeeService meetingAttendeeService;

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

    modelMap.put(sheetName[0] + ".titles", new String[]{"报名时间","姓名","称谓","公司名","职位","邮箱","手机","证件类型","证件名称","证件号码","联系人姓名","联系人邮箱","联系人手机号","是否需要住宿","入住日期","离开日期","9月2日周五自助晚餐","9月3日周六答谢晚宴","9月4日周日搜狐之夜晚宴暨评委证书颁发仪式","状态"});
    modelMap.put(sheetName[0] + ".fieldNames", new String[][]{{"createTime"},{"name"},{"salutation"},{"company"},{"title"},{"email"},{"mobile"},{"travelType"},{"travelName"},{"travelNo"},{"contactName"},{"contactEmail"},{"contactMobile"},{"isStay"},{"stayDate"},{"leaveDate"},{"dinner1"},{"dinner2"},{"dinner3"},{"hierarchy"}});
    modelMap.put(sheetName[0] + ".data", meetingAttendeeService.findAll().stream().map(entry -> {
      entry.setSalutation("1".equals(entry.getSalutation()) ? "先生/Mr" : "女士/Ms");
      entry.setIsStay("0".equals(entry.getIsStay()) ? "不需要" : "需要");
      entry.setDinner1("2".equals(entry.getDinner1()) ? "不需要" : "需要");
      entry.setDinner2("2".equals(entry.getDinner2()) ? "不参加" : "参加");
      entry.setDinner3("2".equals(entry.getDinner3()) ? "不参加" : "参加");
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
    modelMap.put("countStay2", meetingAttendeeService.count("isStay='0'"));
    modelMap.put("countDinner11", meetingAttendeeService.count("dinner1='1'"));
    modelMap.put("countDinner12", meetingAttendeeService.count("dinner1='2'"));
    modelMap.put("countDinner21", meetingAttendeeService.count("dinner2='1'"));
    modelMap.put("countDinner22", meetingAttendeeService.count("dinner2='2'"));
    modelMap.put("countDinner31", meetingAttendeeService.count("dinner3='1'"));
    modelMap.put("countDinner32", meetingAttendeeService.count("dinner3='2'"));
    return "/stats/judger.jsp";
  }

}
