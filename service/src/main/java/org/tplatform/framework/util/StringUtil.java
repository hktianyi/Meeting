package org.tplatform.framework.util;

/**
 * 字符串工具类
 * Created by Tianyi on 2014/11/20.
 */
public class StringUtil {
  //工具类禁止实例化
  private StringUtil() {
  }

  /**
   * 判断字符是否非空
   *
   * @param str
   * @return
   */
  public static boolean isNotEmpty(String str) {
    return !isEmpty(str);
  }

  /**
   * 判断字符是否为空
   *
   * @param str
   * @return
   */
  public static boolean isEmpty(String str) {
    return null == str || str.length() == 0 || "null".equals(str.toLowerCase());
  }

  /**
   * 字符串转换unicode
   */
  public static String string2Unicode(String str) {

    if (isEmpty(str)) return null;

    StringBuffer unicode = new StringBuffer();
    char[] chars = str.toCharArray();
    for (char c : chars)
      unicode.append("\\u" + Integer.toHexString(c));

    return unicode.toString();
  }

  /**
   * unicode 转字符串
   */
  public static String unicode2String(String unicode) {

    if (isEmpty(unicode)) return null;

    StringBuffer sbf = new StringBuffer();
    String[] hex = unicode.split("\\\\u");
    for (int i = 1; i < hex.length; i++)
      sbf.append((char) Integer.parseInt(hex[i], 16));

    return sbf.toString();
  }

  public static void main(String[] args) {
    int i = 100000;
    Long start = DateUtil.getTimeInMillis();
    while (i-- > 0) {
      unicode2String("\\u2460");
    }
    Long end = DateUtil.getTimeInMillis();
    System.out.println("================================>" + (end - start));
  }

}
