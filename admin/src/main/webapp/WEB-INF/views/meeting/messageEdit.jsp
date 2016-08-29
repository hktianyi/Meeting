<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page pageEncoding="UTF-8" language="java" %>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <a href="${_PATH}/main.html">首页</a>
      <i class="fa fa-angle-right"></i>
    </li>
    <li>
      <span>消息管理</span>
    </li>
  </ul>
</div>
<div class="row">
  <div class="col-md-12">
    <div class="portlet box blue">
      <div class="portlet-title">
        <div class="caption">
          <i class="fa fa-gift"></i> 发送消息
        </div>
      </div>
      <div class="portlet-body form">
        <form class="form-horizontal" role="form">
          <div class="form-body">
            <div class="row">
              <div class="col-md-12">
                <div class="form-group">
                  <label class="control-label col-md-3">用户:</label>
                  <div class="col-md-9">
                    <select multiple="multiple" class="multi-select" id="my_multi_select2" name="my_multi_select2[]">
                      <optgroup label="NFC EAST">
                        <option>Dallas Cowboys</option>
                        <option>New York Giants</option>
                        <option>Philadelphia Eagles</option>
                        <option>Washington Redskins</option>
                      </optgroup>
                      <optgroup label="NFC NORTH">
                        <option>Chicago Bears</option>
                        <option>Detroit Lions</option>
                        <option>Green Bay Packers</option>
                        <option>Minnesota Vikings</option>
                      </optgroup>
                      <optgroup label="NFC SOUTH">
                        <option>Atlanta Falcons</option>
                        <option>Carolina Panthers</option>
                        <option>New Orleans Saints</option>
                        <option>Tampa Bay Buccaneers</option>
                      </optgroup>
                      <optgroup label="NFC WEST">
                        <option>Arizona Cardinals</option>
                        <option>St. Louis Rams</option>
                        <option>San Francisco 49ers</option>
                        <option>Seattle Seahawks</option>
                      </optgroup>
                    </select>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="form-group">
                  <label class="control-label col-md-3">标题:</label>
                  <div class="col-md-9">
                    <input type="text" class="form-control" name="title" value="${data.title}" />
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="form-group">
                  <label class="control-label col-md-3">内容:</label>
                  <div class="col-md-9">
                    <textarea class="form-control ckeditor" id="context" name="context">${data.context}</textarea>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="form-actions">
            <div class="row">
              <div class="col-md-6">
                <div class="row">
                  <div class="col-md-offset-3 col-md-9">
                    <button type="submit" class="btn green">
                      <i class="fa fa-pencil"></i> 发送
                    </button>
                    <button type="button" class="btn default" onclick="history.back()">返回</button>
                  </div>
                </div>
              </div>
              <div class="col-md-6"></div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="${_PATH}/static/plugins/ckeditor/ckeditor.js"></script>