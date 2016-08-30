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
      <span>嘉宾信息</span>
    </li>
  </ul>
</div>
<div class="row">
  <div class="col-md-12">
    <div class="portlet box blue">
      <div class="portlet-title">
        <div class="caption">
          <i class="fa fa-gift"></i>嘉宾信息
        </div>
      </div>
      <div class="portlet-body form">
        <form class="form-horizontal" role="form">
          <div class="form-body">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-3">姓名:</label>
                  <div class="col-md-9">
                    <p class="form-control-static">${data.name}</p>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-3">称谓:</label>
                  <div class="col-md-9">
                    <p class="form-control-static">${data.salutation eq 1 ? '先生' : '女士'}</p>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-3">公司:</label>
                  <div class="col-md-9">
                    <p class="form-control-static">${data.company}</p>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-3">职位:</label>
                  <div class="col-md-9">
                    <p class="form-control-static">${data.title}</p>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-3">电话:</label>
                  <div class="col-md-9">
                    <p class="form-control-static">${data.mobile}</p>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-3">邮箱:</label>
                  <div class="col-md-9">
                    <p class="form-control-static">${data.email}</p>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-3">证件类型:</label>
                  <div class="col-md-9">
                    <p class="form-control-static">${data.travelType}</p>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-3">证件号码:</label>
                  <div class="col-md-9">
                    <p class="form-control-static">${data.travelNo}</p>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-3">证件名称:</label>
                  <div class="col-md-9">
                    <p class="form-control-static">${data.travelName}</p>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-3">联系人姓名:</label>
                  <div class="col-md-9">
                    <p class="form-control-static">${data.contactName}</p>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-3">联系人电话:</label>
                  <div class="col-md-9">
                    <p class="form-control-static">${data.contactMobile}</p>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-3">联系人邮箱:</label>
                  <div class="col-md-9">
                    <p class="form-control-static">${data.contactEmail}</p>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-3">到达日期:</label>
                  <div class="col-md-9">
                    <p class="form-control-static">${data.stayDate}</p>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-3">离开日期:</label>
                  <div class="col-md-9">
                    <p class="form-control-static">${data.leaveDate}</p>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-3">是否需要住宿:</label>
                  <div class="col-md-9">
                    <p class="form-control-static">${data.isStay eq '1' ? '需要' : '不需要'}</p>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-3">9月4日周日搜狐之夜晚宴暨评委证书颁发仪式:</label>
                  <div class="col-md-9">
                    <p class="form-control-static">${data.dinner3 eq '1' ? '参加' : '不参加'}</p>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-3">9月2日周五自助晚餐:</label>
                  <div class="col-md-9">
                    <p class="form-control-static">${data.dinner1 eq '1' ? '需要' : '不需要'}</p>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-3">9月3日周六答谢晚宴:</label>
                  <div class="col-md-9">
                    <p class="form-control-static">${data.dinner2 eq '1' ? '参加' : '不参加'}</p>
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
                    <%--<button type="submit" class="btn green">
                      <i class="fa fa-pencil"></i> Edit
                    </button>--%>
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