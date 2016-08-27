package org.weixin.user.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.tplatform.member.entity.Member;
import org.weixin.user.entity.WXUser;
import tk.mybatis.mapper.common.Mapper;

/**
 * Created by tianyi on 16/8/7.
 */
public interface WXUserMapper extends Mapper<WXUser> {

  /**
   * 根据微信用户查询系统用户
   * @param appId
   * @param openId
   * @return
   */
  @Select("SELECT t1.* FROM t_member t1, t_wx_user t2 where t1.id = t2.memberId and t2.appId = #{appId} and t2.openId = #{openId}")
  Member selectMember(@Param("appId") String appId, @Param("openId") String openId);

  /**
   * 微信用户绑定系统用户
   * @param appId
   * @param openId
   * @param memberId
   * @return
   */
  @Update("UPDATE t_wx_user SET memberId = #{memberId} WHERE appId = #{appId} and openId = #{openId}")
  int bindMember(@Param("appId") String appId, @Param("openId") String openId, @Param("memberId") Long memberId);
}
