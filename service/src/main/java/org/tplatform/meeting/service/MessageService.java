package org.tplatform.meeting.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.tplatform.core.fsm.StatusEnum;
import org.tplatform.impl.BaseService;
import org.tplatform.meeting.entity.Message;
import org.tplatform.meeting.mapper.MessageMapper;

/**
 * Created by guo_x on 2016/8/7.
 */
@Service
public class MessageService extends BaseService<Message> {

  @Autowired
  private MessageMapper messageMapper;

  public boolean markRead(Long id) {
    return messageMapper.updateStatus(id, StatusEnum.INVALID) > 0;
  }

  public int unReadCount(Long userId) {
    Message message = new Message();
    message.setUserId(userId);
    message.setStatus(StatusEnum.VALID);
    return messageMapper.selectCount(message);
  }
}
