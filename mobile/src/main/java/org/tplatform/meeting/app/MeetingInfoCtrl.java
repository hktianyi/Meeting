package org.tplatform.meeting.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.tplatform.common.BaseCtrl;
import org.tplatform.constant.GlobalConstant;
import org.tplatform.core.entity.DynamicForm;
import org.tplatform.core.entity.RespBody;
import org.tplatform.core.fsm.StatusEnum;
import org.tplatform.core.service.IDynamicFormService;
import org.tplatform.meeting.entity.MeetingAttendee;
import org.tplatform.meeting.entity.MeetingImg;
import org.tplatform.meeting.entity.MeetingInfo;
import org.tplatform.meeting.entity.MeetingSchedule;
import org.tplatform.meeting.service.MeetingAttendeeService;
import org.tplatform.meeting.service.MeetingInfoService;
import org.tplatform.meeting.service.MeetingScheduleService;
import org.tplatform.member.entity.Member;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by wzl on 2016/8/6.
 */
@Controller
@RequestMapping("/meeting")
public class MeetingInfoCtrl extends BaseCtrl {


	@Autowired
	private MeetingInfoService meetingInfoService;
	@Autowired
	private MeetingScheduleService meetingScheduleService;
	@Autowired
	private MeetingAttendeeService meetingAttendeeService;
	@Autowired
	private IDynamicFormService dynamicFormService;

	/**
	 * 会议列表
	 *
	 * @param keywords
	 * @param meetingType
	 * @param startTime
	 * @param endTime
	 * @param orderBy     排序字段
	 * @param orderType   排序类型
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(String keywords, String meetingType, String startTime, String endTime, String orderBy, String orderType, ModelMap model) {
		model.put("dataList", meetingInfoService.findAll());
		return "/meeting/list.jsp";
	}

	/**
	 * 活动详情信息
	 *
	 * @param meetingId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/detail/{meetingId}", method = RequestMethod.GET)
	public String detail(@PathVariable("meetingId") Long meetingId, ModelMap model) {

		//基本信息
		model.put("meeting", meetingInfoService.find(meetingId));
		//轮播图片
		model.put("banner", meetingInfoService.find(meetingId));
		//会议日程列表
		MeetingSchedule schedule = new MeetingSchedule();
		schedule.setMeetingId(meetingId);
		model.put("schedules", meetingScheduleService.find(schedule));
		model.put("signUp",meetingAttendeeService.signUp(meetingId, ((Member)session.getAttribute(GlobalConstant.KEY_SESSION_USER)).getId()) > 0);
		return "/meeting/detail.jsp";
	}

	/**
	 * 报名
	 *
	 * @param meetingId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/signUp/{meetingId}", method = RequestMethod.POST)
	@ResponseBody
	public RespBody signUp(@PathVariable("meetingId") Long meetingId, MeetingAttendee meetingAttendee, ModelMap model) {
		Map<String, Object> respMap = new HashMap();
		meetingAttendee.setMeetingId(meetingId);
		meetingAttendee.setStatus(StatusEnum.COMMIT);
//		meetingAttendeeService.save(meetingAttendee);
		return RespBody.ok();
	}

	@RequestMapping(value = "/join/{meetingId}",method = RequestMethod.GET)
	public String join(ModelMap modelMap, @PathVariable(value = "meetingId") Long meetingId) {
		Member currMember = (Member) session.getAttribute(GlobalConstant.KEY_SESSION_USER);
		MeetingAttendee maExample = new MeetingAttendee();
		maExample.setMeetingId(meetingId);
		maExample.setOperator(String.valueOf(currMember.getId()));
		MeetingAttendee ma = meetingAttendeeService.findOne(maExample);
		modelMap.put("ma",ma);
		modelMap.put("meetingId",meetingId);
//		modelMap.put("schedules", dynamicFormService.findElementsByFormId2Permission("meeting_attendee", currMember.getHierarchy()));
		return "/meeting/attend.jsp";
	}
	@RequestMapping(value = "/sign",method = RequestMethod.POST)
	@ResponseBody
	public RespBody join(ModelMap modelMap,MeetingAttendee meetingAttendee) {
		meetingAttendee.setStatus(StatusEnum.COMMIT);
		int i = meetingAttendeeService.saveOrUpdate(meetingAttendee);
		if (i < 1){
			return RespBody.error("个人信息处理失败");
		}
		return RespBody.ok();
	}

	/**
	 * 保存媒体附录
	 *
	 * @return
	 */
	@RequestMapping("/saveSS")
	@ResponseBody
	public RespBody saveSS(@RequestParam("id") Long id, @RequestBody DynamicForm dynamicForm) {
		dynamicFormService.saveRecords(dynamicForm.getElements());
		return RespBody.ok();
	}

	/**
	 * 初始化添加会议
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String initNew(ModelMap model) {

		return "/meeting/add.jsp";
	}

	/**
	 * 添加保存会议
	 * 生成会议链接和二维码
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(MeetingInfo entity, ModelMap model) {
		int flag = meetingInfoService.save(entity);
		return "/meeting/success.jsp";
	}

	/**
	 * 添加保存会议图片信息
	 *
	 * @param entity
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/addImg", method = RequestMethod.POST)
	public String addImg(MeetingImg entity, ModelMap model) {

		return null;
	}


	/**
	 * 修改会议
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/upd", method = RequestMethod.POST)
	public String upd(MeetingInfo entity, ModelMap model) {

		return null;
	}

	/**
	 * 删除会议
	 *
	 * @param meetingId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/del", method = RequestMethod.POST)
	public String del(Long meetingId, ModelMap model) {

		return null;
	}

}
