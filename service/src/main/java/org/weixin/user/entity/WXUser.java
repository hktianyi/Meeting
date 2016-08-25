package org.weixin.user.entity;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.annotation.JSONField;
import lombok.Data;
import org.tplatform.core.entity.BaseEntity;

import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * 微信用户
 * Created by tianyi on 16/8/7.
 */
@Data
@Table(name = "t_wx_user")
public class WXUser extends BaseEntity {

  /**
   * 系统用户唯一标识
   */
  private String memberId;
  /**
   * 公众号唯一标识
   */
  private String appId;
  /**
   * 用户的唯一标识
   */
  private String openId;
  /**
   * 用户昵称
   */
  private String nickname;
  /**
   * 用户的性别，值为1时是男性，值为2时是女性，值为0时是未知
   */
  @JSONField(name = "sex")
  private int gender;
  /**
   * 用户个人资料填写的省份
   */
  private String province;
  /**
   * 普通用户个人资料填写的城市
   */
  private String city;
  /**
   * 国家，如中国为CN
   */
  private String country;
  /**
   * 用户头像，最后一个数值代表正方形头像大小（有0、46、64、96、132数值可选，0代表640*640正方形头像），用户没有头像时该项为空
   */
  private String headimgurl;
  /**
   * 用户特权信息，json 数组，如微信沃卡用户为（chinaunicom）
   */
  @Transient
  private JSONArray privilege;
  /**
   * 用户是否订阅该公众号标识，值为0时，代表此用户没有关注该公众号，拉取不到其余信息。
   */
  @JSONField(name = "subscribe")
  private boolean isSubscribe;
  /**
   * 关注时间
   */
  @JSONField(name = "subscribe_time")
  private long subscribeTime;
  /**
   * 使用语言
   */
  private String language;
  /**
   * 只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段
   */
  @JSONField(name = "unionid")
  private String unionId;
  /**
   * 公众号运营者对粉丝的备注，公众号运营者可在微信公众平台用户管理界面对粉丝添加备注
   */
  private String remark;
  /**
   * 用户所在的分组ID
   */
  @JSONField(name = "groupid")
  private int groupId;
}
