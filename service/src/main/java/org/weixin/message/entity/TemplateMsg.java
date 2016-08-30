package org.weixin.message.entity;

import lombok.Data;
import org.tplatform.core.entity.BaseEntity;

import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.List;

/**
 * 微信模板消息
 * Created by tianyi on 16/8/7.
 */
@Data
@Table(name = "t_wx_template_msg")
public class TemplateMsg extends BaseEntity {

  private String appId;
  private String tempId; // 模板ID
  private String name; // 模板名称

  private String url;

  @Transient
  private List<TemplateMsgDetail> detail;
  @Transient
  private List<String> openId;

}
