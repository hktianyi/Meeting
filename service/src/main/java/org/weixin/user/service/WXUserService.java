package org.weixin.user.service;

import com.foxinmy.weixin4j.exception.WeixinException;
import com.foxinmy.weixin4j.mp.WeixinProxy;
import com.foxinmy.weixin4j.mp.model.User;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.tplatform.impl.BaseService;
import org.tplatform.member.entity.Member;
import org.tplatform.util.WXUtil;
import org.weixin.user.entity.WXUser;
import org.weixin.user.mapper.WXUserMapper;

import java.util.List;

/**
 * Created by tianyi on 16/8/7.
 */
@Service
public class WXUserService extends BaseService<WXUser> {

  @Autowired
  private WXUserMapper wxUserMapper;

  public List<Member> findMembers(String appId) {
    return wxUserMapper.selectMembers(appId);
  }

  /**
   * 获取微信用户
   * @param appId
   * @param openId
   * @return
   */
  public Member getMember(String appId, String openId) throws WeixinException {

    Member member = wxUserMapper.selectMember(appId, openId);

    if(member!=null) return member;

    WXUser wxUser = new WXUser();
    wxUser.setAppId(appId);
    wxUser.setOpenId(openId);
    wxUser = wxUserMapper.selectOne(wxUser);

    if(wxUser == null) {
      WeixinProxy proxy = WXUtil.getProxy(appId);
      User user = proxy.getUser(openId);
      if(user!=null) {
        wxUser = new WXUser();
        BeanUtils.copyProperties(user, wxUser);
        wxUser.setNickname(user.getNickName());
        wxUser.setAppId(appId);
        wxUserMapper.insert(wxUser);
      }
    }

    return null;
  }

  public void bindMember(String appId, String openId, Long memberId) {
    wxUserMapper.bindMember(appId, openId, memberId);
  }
}
