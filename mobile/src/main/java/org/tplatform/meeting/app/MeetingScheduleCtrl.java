package org.tplatform.meeting.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.tplatform.common.BaseCtrl;
import org.tplatform.meeting.entity.MeetingInfo;
import org.tplatform.meeting.entity.MeetingSchedule;
import org.tplatform.meeting.service.MeetingScheduleService;

/**
 * Created by wzl on 2016/8/6.
 */
@Controller
@RequestMapping("/meetingSchedule")
public class MeetingScheduleCtrl extends BaseCtrl {

    @Autowired
    private MeetingScheduleService meetingScheduleService;

    /**
     * 会议日程列表
     * @param meetingId
     * @param model
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public String list(Long meetingId, ModelMap model){

        return null;
    }

    /**
     * 会议日程信息
     * @param meetingId
     * @param scheduleId
     * @param model
     * @return
     */
    @RequestMapping(value = "/detail", method = RequestMethod.POST)
    public String detail(Long meetingId,Long scheduleId,ModelMap model){

        return null;
    }

    /**
     * 初始化添加会议
     * @param model
     * @return
     */
    @RequestMapping(value = "/new", method = RequestMethod.POST)
    public String initNew(ModelMap model){

        return null;
    }

    /**
     * 添加保存会议日程信息
     * @param model
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(MeetingSchedule entity, ModelMap model){

        return null;
    }

    /**
     * 修改日程信息
     * @param model
     * @return
     */
    @RequestMapping(value = "/upd", method = RequestMethod.POST)
    public String upd(MeetingSchedule entity,ModelMap model){

        return null;
    }

    /**
     * 删除日程信息
     * @param meetingId
     * @param scheduleId
     * @param model
     * @return
     */
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    public String del(Long meetingId,Long scheduleId,ModelMap model){

        return null;
    }

}
