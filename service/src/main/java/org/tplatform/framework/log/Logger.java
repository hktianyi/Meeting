package org.tplatform.framework.log;

import org.slf4j.LoggerFactory;

/**
 * Created by Tianyi on 2014/11/19.
 */
//@DependsOn("springContextUtil")
public final class Logger {

//  private static String provider, to;
//
//  static {
//    SysConfService confService = SpringContextUtil.getBean(SysConfService.class);
//    provider = confService.findVal("Email_Provider");
//    to = confService.findVal("Email_Exception_Addressee");
//  }

  private Logger() {
  }

  private static String getClazzName() {
    return Thread.currentThread().getStackTrace()[3].getClassName();
  }

  /**
   * INFO记录
   *
   * @param msg
   */
  public static void d(String msg) {
    LoggerFactory.getLogger(getClazzName()).debug(msg);
  }

  /**
   * INFO记录
   *
   * @param msg
   */
  public static void i(String msg) {
    LoggerFactory.getLogger(getClazzName()).info(msg);
  }

  /**
   * 警告
   *
   * @param msg
   */
  public static void w(String msg) {
    LoggerFactory.getLogger(getClazzName()).warn(msg);
  }

  /**
   * 错误
   *
   * @param msg
   */
  public static void e(String msg) {
    LoggerFactory.getLogger(getClazzName()).error(msg);
//    MailUtil.sendSimple("zhangyuyong@yunqiandai.com", "zhangyuyong@yunqiandai.com", msg + "[" + clazz.getName() + "]", msg);
  }

  /**
   * 带异常信息的错误日志
   *
   * @param msg
   * @param e
   */
  public static void e(String msg, Exception e) {
    String className = getClazzName();
    String text = logStyle(className, msg, e);
    LoggerFactory.getLogger(className).error(text);
//    if(StringUtil.isNotEmpty(to))
//      MailUtil.sendSimple("zhangyuyong@yunqiandai.com", "zhangyuyong@yunqiandai.com", msg + "[" + className + "]", text);
  }

  private static String logStyle(String className, String message, Exception e) {
    StringBuffer info = new StringBuffer("");
    info.append("\n错误位置:\n\t");
    info.append(className);
    info.append("\n描述:\n\t");
    info.append(message);
    info.append("\n类型:\n\t");
    info.append(e.getMessage());
    info.append("\n堆栈信息:\n");

    StackTraceElement[] message1 = e.getStackTrace();
    int cou = message1.length;

    for (int i = 0; i < cou; i++) {
      info.append("\t" + message1[i].toString() + "\n");
    }
    return info.toString();
  }
}
