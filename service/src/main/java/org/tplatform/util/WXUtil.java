package org.tplatform.util;

import com.foxinmy.weixin4j.model.WeixinAccount;
import com.foxinmy.weixin4j.mp.WeixinProxy;
import com.foxinmy.weixin4j.setting.Weixin4jSettings;
import org.tplatform.constant.GlobalConstant;
import org.tplatform.framework.util.SpringContextUtil;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by tianyi on 16/8/7.
 */
public class WXUtil {

  private static Map<String, WeixinProxy> proxyMap = new HashMap<>();

  private WXUtil() {
  }

  /**
   * 获取默认微信APPID
   * @return
   */
  public static String getAppId() {
    Object appId = SpringContextUtil.getSession().getAttribute(GlobalConstant.KEY_SESSION_APPID);
    return appId == null ? PropertyUtil.getProInfo("WX_APPID_DEFAULT") : appId.toString();
  }

  /**
   * 获取微信代理
   * @return
   */
  public static WeixinProxy getProxy() {
    return getProxy(getAppId());
  }

  /**
   * 获取微信代理
   * @param appId
   * @return
   */
  public static WeixinProxy getProxy(String appId) {
    if(proxyMap.containsKey(appId)) return proxyMap.get(appId);

    Weixin4jSettings<WeixinAccount> settings = new Weixin4jSettings<>(new WeixinAccount(appId, PropertyUtil.getProInfo("WX_SECRET_" + appId)));
//    settings.setCacheStorager(new RedisCacheStorager<>());
    WeixinProxy weixinProxy = new WeixinProxy(settings);
    proxyMap.put(appId, weixinProxy);
    return weixinProxy;
  }

}
