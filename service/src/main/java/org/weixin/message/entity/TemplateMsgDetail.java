package org.weixin.message.entity;

import lombok.Data;
import org.tplatform.core.entity.BaseEntity;

import javax.persistence.Table;

/**
 * 微信模板消息
 * Created by tianyi on 16/8/7.
 */
@Data
@Table(name = "t_wx_template_msg_detail")
public class TemplateMsgDetail extends BaseEntity {

  private Long templateId; // 模板ID

  private String key;
  private String color;
  private String text;
}
