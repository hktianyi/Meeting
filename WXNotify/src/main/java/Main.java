import com.foxinmy.weixin4j.exception.WeixinException;
import com.foxinmy.weixin4j.handler.DebugMessageHandler;
import com.foxinmy.weixin4j.startup.WeixinServerBootstrap;

/**
 * Created by tianyi on 16/8/7.
 */
public class Main {
  public static void main(String[] args) {
    try {
      new WeixinServerBootstrap("token").addHandler(DebugMessageHandler.global).startup();
    } catch (WeixinException e) {
      e.printStackTrace();
    }
  }
}
