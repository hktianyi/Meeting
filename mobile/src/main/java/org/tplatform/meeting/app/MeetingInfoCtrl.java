package org.tplatform.meeting.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.tplatform.common.BaseCtrl;
import org.tplatform.meeting.entity.MeetingImg;
import org.tplatform.meeting.entity.MeetingInfo;
import org.tplatform.meeting.service.MeetingImgService;
import org.tplatform.meeting.service.MeetingInfoService;
import org.tplatform.meeting.service.MeetingScheduleService;

/**
 * Created by wzl on 2016/8/6.
 */
@Controller
@RequestMapping("/meeting")
public class MeetingInfoCtrl extends BaseCtrl {


    @Autowired
    private MeetingInfoService meetingInfoService;
    @Autowired
    private MeetingImgService meetingImgService;
    @Autowired
    private MeetingScheduleService meetingScheduleService;

    /**
     * 会议列表
     * @param keywords
     * @param meetingType
     * @param startTime
     * @param endTime
     * @param orderBy  排序字段
     * @param orderType 排序类型
     * @param model
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(String keywords,String meetingType , String startTime,
                       String endTime,String orderBy,String orderType, ModelMap model){


        return "/meeting/list.jsp";
    }

    /**
     * 会议详细信息
     * @param meetingId
     * @param model
     * @return
     */
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String detail(Long meetingId,ModelMap model){

        //基本信息

        //轮播图片

        //会议日程列表

        return null;
    }


    /**
     * 初始化添加会议
     * @param model
     * @return
     */
    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public String initNew(ModelMap model){

        return "/meeting/add.jsp";
    }

    /**
     * 添加保存会议
     * @param model
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(MeetingInfo entity,ModelMap model){

        return null;
    }

    /**
     * 添加保存会议图片信息
     * @param entity
     * @param model
     * @return
     */
    @RequestMapping(value = "/addImg", method = RequestMethod.POST)
    public String addImg(MeetingImg entity, ModelMap model){

        return null;
    }


    /**
     * 修改会议
     * @param model
     * @return
     */
    @RequestMapping(value = "/upd", method = RequestMethod.POST)
    public String upd(MeetingInfo entity,ModelMap model){

        return null;
    }

    /**
     * 删除会议
     * @param meetingId
     * @param model
     * @return
     */
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    public String del(Long meetingId,ModelMap model){

        return null;
    }

}
