package org.conference.biz.service;

import com.foxinmy.weixin4j.exception.WeixinException;
import com.foxinmy.weixin4j.mp.message.TemplateMessage;
import org.conference.biz.entity.TemplateMsg;
import org.springframework.stereotype.Service;
import org.tplatform.impl.BaseService;
import org.tplatform.util.WXUtil;

/**
 * Created by tianyi on 16/8/7.
 */
@Service
public class TemplateMsgService extends BaseService<TemplateMsg> {

  private static String agendaWarnID = "8cHzS_rKzTHRd-0OMVUk03WnkH96PzE23aH2_5txwuM";

  /**
   * 测试发送模板消息
   * @param openId
   * @param content
   * @throws WeixinException
   */
  public void sendAgendaWarn(String appId, String openId, String content) throws WeixinException {
    TemplateMessage templateMessage = new TemplateMessage(openId, agendaWarnID, "");
    templateMessage.pushHead("测试头");
    templateMessage.pushTail("测试脚");
    templateMessage.pushItem("keyword1", content);
    WXUtil.getProxy(appId).sendTmplMessage(templateMessage);
  }
}
