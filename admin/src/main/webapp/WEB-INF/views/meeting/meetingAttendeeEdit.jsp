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
        <form class="form-horizontal" role="form" id="form1">
          <div class="form-body">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-3">姓名:</label>
                  <div class="col-md-9">
                    <p class="form-control-static">
                    ${data.name} &nbsp;&nbsp;&nbsp;&nbsp;${data.status eq 'VALID' ? '<span class="label label-sm label-info">已签到</span>' : '<span class="label label-sm label-default">已报名</span>'}
                    </p>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-3">称谓:</label>
                  <div class="col-md-9">
                    <p class="form-control-static">${data.salutation eq 1 ? '先生/Mr' : '女士/Ms'}</p>
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
                  <label class="control-label col-md-8">是否住宿/Accommodation:</label>
                  <div class="col-md-4">
                    <p class="form-control-static">${data.isStay eq '1' ? '是/YES' : '否/NO'}</p>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-8">艾菲研讨会 Effie Seminar:</label>
                  <div class="col-md-4">
                    <p class="form-control-static">${data.schedule221 eq '1' ? '参加/YES' : '不参加/NO'}</p>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-2">备注:</label>
                  <div class="col-md-4">
                    <input type="text" class="form-control" name="remark0" value="${data.remark0}">
                  </div>
                  <div class="col-md-4">
                    <input type="text" class="form-control" name="remark2" value="${data.remark2}">
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-8">自助午餐 Buffet Lunch:</label>
                  <div class="col-md-4">
                    <p class="form-control-static">${data.schedule222 eq '1' ? '参加/YES' : '不参加/NO'}</p>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-2">备注:</label>
                  <div class="col-md-9">
                    <input type="text" class="form-control" name="remark1" value="${data.remark1}">
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-8">VIP欢迎晚宴 VIP Welcome Dinner:</label>
                  <div class="col-md-4">
                    <p class="form-control-static">${data.schedule223 eq '1' ? '参加/YES' : '不参加/NO'}</p>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-2">备注:</label>
                  <div class="col-md-9">
                    <input type="text" class="form-control" name="remark3" value="${data.remark3}">
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-8">艾菲酒会 Effie Reception:</label>
                  <div class="col-md-4">
                    <p class="form-control-static">${data.schedule231 eq '1' ? '参加/YES' : '不参加/NO'}</p>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-2">备注:</label>
                  <div class="col-md-9">
                    <input type="text" class="form-control" name="remark4" value="${data.remark4}">
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-8">红毯秀 Red Carpet Show:</label>
                  <div class="col-md-4">
                    <p class="form-control-static">${data.schedule232 eq '1' ? '参加/YES' : '不参加/NO'}</p>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-2">备注:</label>
                  <div class="col-md-9">
                    <input type="text" class="form-control" name="remark5" value="${data.remark5}">
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-8">艾菲颁奖典礼 Effie Awards Gala:</label>
                  <div class="col-md-4">
                    <p class="form-control-static">${data.schedule233 eq '1' ? '参加/YES' : '不参加/NO'}</p>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-2">备注:</label>
                  <div class="col-md-9">
                    <input type="text" class="form-control" name="remark6" value="${data.remark6}">
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-8">艾菲派对 Effie After Party:</label>
                  <div class="col-md-4">
                    <p class="form-control-static">${data.schedule234 eq '1' ? '参加/YES' : '不参加/NO'}</p>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-2">备注:</label>
                  <div class="col-md-9">
                    <input type="text" class="form-control" name="remark7" value="${data.remark7}">
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-8">2016优秀案例赏析会 2016 Effie Forum:</label>
                  <div class="col-md-4">
                    <p class="form-control-static">${data.schedule241 eq '1' ? '参加/YES' : '不参加/NO'}</p>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-2">备注:</label>
                  <div class="col-md-9">
                    <input type="text" class="form-control" name="remark8" value="${data.remark8}">
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-8">VIP午宴 VIP Luncheon:</label>
                  <div class="col-md-4">
                    <p class="form-control-static">${data.schedule242 eq '1' ? '参加/YES' : '不参加/NO'}</p>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-md-2">备注:</label>
                  <div class="col-md-9">
                    <input type="text" class="form-control" name="remark9" value="${data.remark9}">
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
                    <button type="button" class="btn green" onclick="saveRemark();">
                      <i class="fa fa-save"></i> 保存笔记
                    </button>
                    <button type="button" class="btn default" onclick="history.back()">返回</button>
                  </div>
                </div>
              </div>
              <div class="col-md-6"></div>
            </div>
          </div>
          <input type="hidden" name="id" value="${data.id}">
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
  var index = 0;
  function saveRemark() {
    if(index !== 0) return;
    index = layer.load(1, {
      shade: [0.3,'#fff'] //0.1透明度的白色背景
    });
    $.ajax(_PATH + '/attendee/save', {
      type: 'POST',
      data: $('#form1').serialize(),
      success: function (resp) {
        if (resp.statusCode === 200) {
          layer.msg('保存成功');
          window.location.href = _PATH + "/attendee/list";
        } else {
          layer.close(index);
          layer.alert(resp.errorInfo);
        }
      },
      error: function (resp) {
        layer.close(index);
        layer.alert('保存失败');
      }
    });
  }
</script>