package org.tplatform.common;

import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 基础业务控制器
 * Created by Tianyi on 2014/11/20.
 */
public abstract class BaseCtrl {
  @Autowired
  protected HttpServletRequest request;
  @Autowired
  protected HttpSession session;
}
