package org.weixin.message.service;

import com.foxinmy.weixin4j.exception.WeixinException;
import com.foxinmy.weixin4j.mp.WeixinProxy;
import com.foxinmy.weixin4j.mp.message.TemplateMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.tplatform.core.fsm.StatusEnum;
import org.tplatform.impl.BaseService;
import org.tplatform.util.WXUtil;
import org.weixin.message.entity.TemplateMsg;
import org.weixin.message.mapper.TemplateMsgMapper;

import java.util.List;

/**
 * Created by tianyi on 16/8/7.
 */
@Service
public class TemplateMsgService extends BaseService<TemplateMsg> {

  @Autowired
  private TemplateMsgMapper templateMsgMapper;

  /**
   * 测试发送模板消息
   * @param openId
   * @param content
   * @throws WeixinException
   */
  public void sendAgendaWarn(String appId, String openId, String content) throws WeixinException {
    String agendaWarnID = "8cHzS_rKzTHRd-0OMVUk03WnkH96PzE23aH2_5txwuM";
    TemplateMessage templateMessage = new TemplateMessage(openId, agendaWarnID, "");
    templateMessage.pushHead("测试头");
    templateMessage.pushTail("测试脚");
    templateMessage.pushItem("keyword1", content);
    WXUtil.getProxy(appId).sendTmplMessage(templateMessage);
  }

  /**
   * 测试发送模板消息
   * @param templateMsg
   * @throws WeixinException
   */
  public void send(TemplateMsg templateMsg) {
    WeixinProxy proxy = WXUtil.getProxy(templateMsg.getAppId());
    templateMsg.getOpenId().stream().forEach(openId -> {
      TemplateMessage templateMessage = new TemplateMessage(openId, templateMsg.getTempId(), templateMsg.getUrl());
      templateMsg.getDetail().stream().forEach(temp -> {
        switch (temp.getKey()) {
          case "first": templateMessage.pushHead(temp.getColor(), temp.getText()); break;
          case "remark": templateMessage.pushTail(temp.getColor(), temp.getText()); break;
          default: templateMessage.pushItem(temp.getKey(), temp.getColor(), temp.getText());
        }
      });
      try {
        proxy.sendTmplMessage(templateMessage);
      } catch (WeixinException e) {
        e.printStackTrace();
      }
    });
  }

  /**
   * 查找可用的模板消息
   * @param appId
   * @return
   */
  public List<TemplateMsg> find(String appId) {
    TemplateMsg templateMsg = new TemplateMsg();
    templateMsg.setAppId(appId);
    templateMsg.setStatus(StatusEnum.VALID);
    List<TemplateMsg> list = templateMsgMapper.select(templateMsg);
    list.stream().forEach(temp -> temp.setDetail(templateMsgMapper.selectDetail(temp.getId())));
    return list;
  }
}
