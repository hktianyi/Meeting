package org.tplatform.meeting.app;

import com.itextpdf.text.DocumentException;
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
import org.tplatform.framework.util.PDFUtil;
import org.tplatform.meeting.entity.MeetingAttendee;
import org.tplatform.meeting.entity.MeetingImg;
import org.tplatform.meeting.entity.MeetingInfo;
import org.tplatform.meeting.entity.MeetingSchedule;
import org.tplatform.meeting.service.MeetingAttendeeService;
import org.tplatform.meeting.service.MeetingInfoService;
import org.tplatform.member.entity.Member;
import org.tplatform.util.MailUtil;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Created by wzl on 2016/8/6.
 */
@Controller
@RequestMapping("/meeting")
public class MeetingInfoCtrl extends BaseCtrl {


	@Autowired
	private MeetingInfoService meetingInfoService;
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

		Member member = (Member)session.getAttribute(GlobalConstant.KEY_SESSION_USER);
		//基本信息
		model.put("meeting", meetingInfoService.find(meetingId, member.getHierarchy()));
		//轮播图片
//		model.put("banner", meetingInfoService.find(meetingId));

		MeetingAttendee maExample = new MeetingAttendee();
		maExample.setMeetingId(meetingId);
		maExample.setOperator(String.valueOf(member.getId()));
		MeetingAttendee ma = meetingAttendeeService.findOne(maExample);

		model.put("signUp", ma);
		return "/meeting/detail.jsp";
	}

	/**
	 * 查看批注
	 * @return
   */
	@RequestMapping(value = "/postil/{key}", method = RequestMethod.GET)
	@ResponseBody
	public RespBody postil(@PathVariable("key") String key) {
		Member member = (Member)session.getAttribute(GlobalConstant.KEY_SESSION_USER);
		return RespBody.ok(meetingAttendeeService.getPostil(meetingAttendeeService.findattendeeIdByMeetCode(member.getUserName()), key));
	}

	/**
	 * 修改批注
	 * @param key
	 * @param value
	 * @return
   */
	@RequestMapping(value = "/postil/{key}", method = RequestMethod.POST)
	@ResponseBody
	public RespBody postil(@PathVariable("key") String key, @RequestParam String value) {
		Member member = (Member)session.getAttribute(GlobalConstant.KEY_SESSION_USER);
		return RespBody.ok(meetingAttendeeService.setPostil(meetingAttendeeService.findattendeeIdByMeetCode(member.getUserName()), key, value));
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
		int i;
		if (meetingAttendee.getId() != null && meetingAttendee.getId() > 0) {
			i = meetingAttendeeService.update(meetingAttendee);
		} else {
			Member currMember = (Member) session.getAttribute(GlobalConstant.KEY_SESSION_USER);
			meetingAttendee.setId(Long.valueOf(currMember.getUserName()));
			i = meetingAttendeeService.save(meetingAttendee);
		}
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

	private static final String mailInfo = "感谢您注册2016艾菲实效节！请下载附件定制化日程表。Thank you for your registration! Please download the attached schedule for your private use. <br/><br/><br/>大中华区艾菲奖工作组 Effie Greater China";
	private static final String tmpdir = System.getProperty("java.io.tmpdir");

	/**
	 * 活动详情信息
	 *
	 * @return
	 */
	@RequestMapping(value = "/export/{meetingId}", method = RequestMethod.GET)
	@ResponseBody
	public RespBody export(@PathVariable("meetingId") Long meetingId, @RequestParam(value = "type", required = false) String type, HttpServletResponse response) {

		Member member = (Member)session.getAttribute(GlobalConstant.KEY_SESSION_USER);
		MeetingInfo meetingInfo = meetingInfoService.find(meetingId, member.getHierarchy());

		// 找到报名信息
		MeetingAttendee meetingAttendee = new MeetingAttendee();
		meetingAttendee.setOperator(member.getId() + "");
		meetingAttendee = meetingAttendeeService.findOne(meetingAttendee);

		List<MeetingSchedule> list = new LinkedList<>(meetingInfo.getDetail());

		// 过滤掉不参加的项目
		if("0".equals(meetingAttendee.getSchedule221())) {
			List list1 = list.stream().filter((obj) -> (obj.getId() == 1 || obj.getId() == 3)).collect(Collectors.toList());
			if(list1 != null && list1.size() > 0) {
				list1.forEach((obj) -> list.remove(obj));
			}
		}
		if("0".equals(meetingAttendee.getSchedule222())) {
			List list1 = list.stream().filter((obj) -> obj.getId() == 2).collect(Collectors.toList());
			if(list1 != null && list1.size() > 0) {
				list1.forEach((obj) -> list.remove(obj));
			}
		}
		if("0".equals(meetingAttendee.getSchedule223())) {
			List list1 = list.stream().filter((obj) -> obj.getId() == 4).collect(Collectors.toList());
			if(list1 != null && list1.size() > 0) {
				list1.forEach((obj) -> list.remove(obj));
			}
		}

		if("0".equals(meetingAttendee.getSchedule231())) {
			List list1 = list.stream().filter((obj) -> obj.getId() == 5).collect(Collectors.toList());
			if(list1 != null && list1.size() > 0) {
				list1.forEach((obj) -> list.remove(obj));
			}
		}
		if("0".equals(meetingAttendee.getSchedule232())) {
			List list1 = list.stream().filter((obj) -> obj.getId() == 6).collect(Collectors.toList());
			if(list1 != null && list1.size() > 0) {
				list1.forEach((obj) -> list.remove(obj));
			}
		}
		if("0".equals(meetingAttendee.getSchedule233())) {
			List list1 = list.stream().filter((obj) -> obj.getId() == 7).collect(Collectors.toList());
			if(list1 != null && list1.size() > 0) {
				list1.forEach((obj) -> list.remove(obj));
			}
		}
		if("0".equals(meetingAttendee.getSchedule234())) {
			List list1 = list.stream().filter((obj) -> obj.getId() == 8).collect(Collectors.toList());
			if(list1 != null && list1.size() > 0) {
				list1.forEach((obj) -> list.remove(obj));
			}
		}

		if("0".equals(meetingAttendee.getSchedule241())) {
			List list1 = list.stream().filter((obj) -> obj.getId() == 9).collect(Collectors.toList());
			if(list1 != null && list1.size() > 0) {
				list1.forEach((obj) -> list.remove(obj));
			}
		}
		if("0".equals(meetingAttendee.getSchedule242())) {
			List list1 = list.stream().filter((obj) -> obj.getId() == 10).collect(Collectors.toList());
			if(list1 != null && list1.size() > 0) {
				list1.forEach((obj) -> list.remove(obj));
			}
		}

		Map<String, List> params = new LinkedHashMap<>();

		boolean hasRemark = "1".equals(member.getHierarchy());

		MeetingAttendee finalMeetingAttendee = meetingAttendee;
		list.forEach(meetingSchedule -> {
			List list1 = params.get(meetingSchedule.getScheduleDate());
			if(list1==null) list1 = new ArrayList();

			// VVIP添加笔记
			if (hasRemark) {
				if (meetingSchedule.getId() == 1) meetingSchedule.setHierarchy(finalMeetingAttendee.getRemark0());
				else if (meetingSchedule.getId() == 2) meetingSchedule.setHierarchy(finalMeetingAttendee.getRemark1());
				else if (meetingSchedule.getId() == 3) meetingSchedule.setHierarchy(finalMeetingAttendee.getRemark2());
				else if (meetingSchedule.getId() == 4) meetingSchedule.setHierarchy(finalMeetingAttendee.getRemark3());
				else if (meetingSchedule.getId() == 5) meetingSchedule.setHierarchy(finalMeetingAttendee.getRemark4());
				else if (meetingSchedule.getId() == 6) meetingSchedule.setHierarchy(finalMeetingAttendee.getRemark5());
				else if (meetingSchedule.getId() == 7) meetingSchedule.setHierarchy(finalMeetingAttendee.getRemark6());
				else if (meetingSchedule.getId() == 8) meetingSchedule.setHierarchy(finalMeetingAttendee.getRemark7());
				else if (meetingSchedule.getId() == 9) meetingSchedule.setHierarchy(finalMeetingAttendee.getRemark8());
				else if (meetingSchedule.getId() == 10) meetingSchedule.setHierarchy(finalMeetingAttendee.getRemark9());
			}

			list1.add(meetingSchedule);
			params.put(meetingSchedule.getScheduleDate(), list1);
		});

		try {
			if ("mail".equalsIgnoreCase(type)) {
//				File pdf = File.createTempFile((meetingAttendee.getName() + " 实效节日程"), ".pdf");
				File pdf = new File(tmpdir + File.separator + (meetingAttendee.getName() + "_实效节日程_Effie Festival Schedule.pdf"));
				FileOutputStream fos = new FileOutputStream(pdf);
				PDFUtil.create(params, fos, hasRemark);

				MailUtil.sendWithAttachment("support@effie-greaterchina.org", meetingAttendee.getEmail(), "2016实效节日程/Effie Festival Schedule", mailInfo, pdf);
				pdf.delete();
			} else {
				// android 手机,提示下载
				String ua = request.getHeader("user-agent").toLowerCase();
				if(ua.contains("android") || ua.contains("linux")) {
					//设置ContentType
					response.setContentType("application/octet-stream; charset=utf-8");
					//处理中文文件名中文乱码问题
					response.setHeader("Content-Disposition", "attachment; filename=" + new String((meetingAttendee.getName() + "_实效节日程_Effie Festival Schedule.pdf").getBytes("utf-8"),"ISO-8859-1"));
				}
				PDFUtil.create(params, response.getOutputStream(), hasRemark);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return RespBody.ok();
	}

	@RequestMapping(value = "/previewSchedule/{meetingId}")
	public RespBody previewSchedule(@PathVariable("meetingId") Long meetingId, MeetingAttendee meetingAttendee, HttpServletResponse response) {
		Member member = (Member)session.getAttribute(GlobalConstant.KEY_SESSION_USER);
		MeetingInfo meetingInfo = meetingInfoService.find(meetingId, member.getHierarchy());

		List<MeetingSchedule> list = new LinkedList<>(meetingInfo.getDetail());

		// 过滤掉不参加的项目
		if("0".equals(meetingAttendee.getSchedule221())) {
			List list1 = list.stream().filter((obj) -> (obj.getId() == 1 || obj.getId() == 3)).collect(Collectors.toList());
			if(list1 != null && list1.size() > 0) {
				list1.forEach((obj) -> list.remove(obj));
			}
		}
		if("0".equals(meetingAttendee.getSchedule222())) {
			List list1 = list.stream().filter((obj) -> obj.getId() == 2).collect(Collectors.toList());
			if(list1 != null && list1.size() > 0) {
				list1.forEach((obj) -> list.remove(obj));
			}
		}
		if("0".equals(meetingAttendee.getSchedule223())) {
			List list1 = list.stream().filter((obj) -> obj.getId() == 4).collect(Collectors.toList());
			if(list1 != null && list1.size() > 0) {
				list1.forEach((obj) -> list.remove(obj));
			}
		}

		if("0".equals(meetingAttendee.getSchedule231())) {
			List list1 = list.stream().filter((obj) -> obj.getId() == 5).collect(Collectors.toList());
			if(list1 != null && list1.size() > 0) {
				list1.forEach((obj) -> list.remove(obj));
			}
		}
		if("0".equals(meetingAttendee.getSchedule232())) {
			List list1 = list.stream().filter((obj) -> obj.getId() == 6).collect(Collectors.toList());
			if(list1 != null && list1.size() > 0) {
				list1.forEach((obj) -> list.remove(obj));
			}
		}
		if("0".equals(meetingAttendee.getSchedule233())) {
			List list1 = list.stream().filter((obj) -> obj.getId() == 7).collect(Collectors.toList());
			if(list1 != null && list1.size() > 0) {
				list1.forEach((obj) -> list.remove(obj));
			}
		}
		if("0".equals(meetingAttendee.getSchedule234())) {
			List list1 = list.stream().filter((obj) -> obj.getId() == 8).collect(Collectors.toList());
			if(list1 != null && list1.size() > 0) {
				list1.forEach((obj) -> list.remove(obj));
			}
		}

		if("0".equals(meetingAttendee.getSchedule241())) {
			List list1 = list.stream().filter((obj) -> obj.getId() == 9).collect(Collectors.toList());
			if(list1 != null && list1.size() > 0) {
				list1.forEach((obj) -> list.remove(obj));
			}
		}
		if("0".equals(meetingAttendee.getSchedule242())) {
			List list1 = list.stream().filter((obj) -> obj.getId() == 10).collect(Collectors.toList());
			if(list1 != null && list1.size() > 0) {
				list1.forEach((obj) -> list.remove(obj));
			}
		}

		Map<String, List> params = new LinkedHashMap<>();

		boolean hasRemark = "1".equals(member.getHierarchy());

		meetingAttendee = new MeetingAttendee();
		meetingAttendee.setOperator(member.getId() + "");
		MeetingAttendee finalMeetingAttendee = meetingAttendeeService.findOne(meetingAttendee);
		list.forEach(meetingSchedule -> {
			List list1 = params.get(meetingSchedule.getScheduleDate());
			if(list1==null) list1 = new ArrayList();

			// VVIP添加笔记
			if (hasRemark) {
				if (meetingSchedule.getId() == 1) meetingSchedule.setHierarchy(finalMeetingAttendee.getRemark0());
				else if (meetingSchedule.getId() == 2) meetingSchedule.setHierarchy(finalMeetingAttendee.getRemark1());
				else if (meetingSchedule.getId() == 3) meetingSchedule.setHierarchy(finalMeetingAttendee.getRemark2());
				else if (meetingSchedule.getId() == 4) meetingSchedule.setHierarchy(finalMeetingAttendee.getRemark3());
				else if (meetingSchedule.getId() == 5) meetingSchedule.setHierarchy(finalMeetingAttendee.getRemark4());
				else if (meetingSchedule.getId() == 6) meetingSchedule.setHierarchy(finalMeetingAttendee.getRemark5());
				else if (meetingSchedule.getId() == 7) meetingSchedule.setHierarchy(finalMeetingAttendee.getRemark6());
				else if (meetingSchedule.getId() == 8) meetingSchedule.setHierarchy(finalMeetingAttendee.getRemark7());
				else if (meetingSchedule.getId() == 9) meetingSchedule.setHierarchy(finalMeetingAttendee.getRemark8());
				else if (meetingSchedule.getId() == 10) meetingSchedule.setHierarchy(finalMeetingAttendee.getRemark9());
			}

			list1.add(meetingSchedule);
			params.put(meetingSchedule.getScheduleDate(), list1);
		});

		try {
				// android 手机,提示下载
				String ua = request.getHeader("user-agent").toLowerCase();
				if(ua.contains("android") || ua.contains("linux")) {
					//设置ContentType
					response.setContentType("application/octet-stream; charset=utf-8");
					//处理中文文件名中文乱码问题
					response.setHeader("Content-Disposition", "attachment; filename=" + new String((meetingAttendee.getName() + "_实效节日程_Effie Festival Schedule.pdf").getBytes("utf-8"),"ISO-8859-1"));
				}
				PDFUtil.create(params, response.getOutputStream(), hasRemark);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return RespBody.ok();
	}

}
