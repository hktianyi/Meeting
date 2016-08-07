package org.tplatform.util;

import com.foxinmy.weixin4j.model.WeixinAccount;
import com.foxinmy.weixin4j.mp.WeixinProxy;
import com.foxinmy.weixin4j.setting.Weixin4jSettings;

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
   * 获取微信代理
   * @param appId
   * @return
   */
  public static WeixinProxy getProxy(String appId) {
    if(proxyMap.containsKey(appId)) return proxyMap.get(appId);

    Weixin4jSettings<WeixinAccount> settings = new Weixin4jSettings<>(new WeixinAccount(appId, PropertyUtil.getProInfo("WX_APPID_" + appId)));
//    settings.setCacheStorager(new RedisCacheStorager<>());
    WeixinProxy weixinProxy = new WeixinProxy(settings);
    proxyMap.put(appId, weixinProxy);
    return weixinProxy;
  }

}
