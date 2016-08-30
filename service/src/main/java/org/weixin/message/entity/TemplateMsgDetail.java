package org.weixin.message.entity;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.tplatform.core.entity.BaseEntity;

import javax.persistence.Table;
import javax.validation.constraints.NotNull;

/**
 * 微信模板消息
 * Created by tianyi on 16/8/7.
 */
@Data
@Table(name = "t_wx_template_msg_detail")
public class TemplateMsgDetail extends BaseEntity {

  public TemplateMsgDetail() {}
  public TemplateMsgDetail(String key, String text) {this.key = key; this.text = text;}

  private Long templateId; // 模板ID

  private String key;
  private String color;
  private String text;
}
