package org.tplatform.core.fsm;

/**
 * 通用状态机
 * Created by Tianyi on 2016/1/9.
 */
public enum StatusEnum {
  TEMP(0),   // 有效
  COMMIT(1),   // 有效
  VALID(2),   // 有效
  INVALID(3), // 无效
  DELETE(4);  // 删除

  private int code; //状态码

  StatusEnum(int code) {
    this.code = code;
  }

}
