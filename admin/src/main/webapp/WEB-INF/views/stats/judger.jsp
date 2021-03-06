<%@ page pageEncoding="UTF-8" language="java" %>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <a href="${_PATH}/main.html">首页</a>
      <i class="fa fa-angle-right"></i>
    </li>
    <li>
      <span>嘉宾信息统计</span>
    </li>
  </ul>
  <div class="page-toolbar">
    <button type="button" class="btn btn-circle blue btn-outline btn-xs">&nbsp;?&nbsp;</button>
  </div>
</div>
<div class="row">
  <div class="col-md-12">
    <div class="portlet light portlet-fit bordered">
      <div class="portlet-title">
        <div class="caption">
          <i class=" icon-layers font-green"></i>
          <span class="caption-subject font-green bold uppercase">嘉宾签到信息统计</span>
        </div>
        <%--<div class="actions">
          <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
            <i class="icon-cloud-upload"></i>
          </a>
          <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
            <i class="icon-wrench"></i>
          </a>
          <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
            <i class="icon-trash"></i>
          </a>
        </div>--%>
      </div>
      <div class="portlet-body">
        <div id="echarts_pie" style="height:500px;"></div>
      </div>
    </div>
  </div>
</div>
<div class="row">
  <div class="col-md-12">
    <div class="portlet light portlet-fit bordered">
      <div class="portlet-title">
        <div class="caption">
          <i class=" icon-layers font-green"></i>
          <span class="caption-subject font-green bold uppercase">嘉宾食宿信息统计</span>
        </div>
        <%--<div class="actions">
          <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
            <i class="icon-cloud-upload"></i>
          </a>
          <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
            <i class="icon-wrench"></i>
          </a>
          <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
            <i class="icon-trash"></i>
          </a>
        </div>--%>
      </div>
      <div class="portlet-body">
        <div id="echarts_bar" style="height:500px;"></div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="${_PATH}/static/plugins/echarts.min.js"></script>
<script type="text/javascript">
  $(function () {
    var echart_pie = echarts.init(document.getElementById('echarts_pie'));
    var option_pie = {
      title : {
        text: '艾菲评审会嘉宾签到统计信息',
        subtext: '',
        x:'center'
      },
      tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
      },
      legend: {
        orient: 'vertical',
        left: 'left',
        data: ['已报名嘉宾','已签到嘉宾','未使用邀请码数量','先生/Mr','女士/Ms']
      },
      series : [
        {
          name: '邀请码统计',
          type: 'pie',
          radius: ['40%', '55%'],
          color: ['#9933ff','#ff6600','#ccc'],
          data:[
            {value:'${countCommit}', name:'已报名嘉宾'},
            {value:'${countValid}', name:'已签到嘉宾'},
            {value:'${countUnused}', name:'未使用邀请码数量'}
          ],
          itemStyle: {
            emphasis: {
              shadowBlur: 10,
              shadowOffsetX: 0,
              shadowColor: 'rgba(0, 0, 0, 0.5)'
            }
          }
        },
        {
          name:'签到嘉宾统计',
          type:'pie',
          selectedMode: 'single',
          radius: [0, '30%'],
          label: {
            normal: {
              position: 'inner'
            }
          },
          color: ['#6633CC','#FF6633'],
          data:[
            {value:'${countGenderMr}', name:'先生/Mr'},
            {value:'${countGenderMs}', name:'女士/Ms'}
          ]
        }
      ]
    };
    echart_pie.setOption(option_pie);


    var echart_bar = echarts.init(document.getElementById('echarts_bar'));
    var option_bar = {
      tooltip : {
        trigger: 'axis',
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
          type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
        }
      },
      legend: {
        data:['是','否']
      },
      grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
      },
      xAxis : [
        {
          type : 'category',
          data : ["是否需要住宿","艾菲研讨会 Effie Seminar","自助午餐 Buffet Lunch","VIP欢迎晚宴 VIP Welcome Dinner","VIP自助午餐 VIP Buffet Lunch","艾菲酒会 Effie Reception","红毯秀 Red Carpet Show","艾菲颁奖典礼 Effie Awards Gala","艾菲派对 Effie After Party","2016优秀案例赏析会 2016 Effie Forum","VIP午宴 VIP Luncheon"]
        }
      ],
      yAxis : [
        {
          type : 'value'
        }
      ],
      color: ['#726DD1', '#57D2F7'],
      series : [
        {
          name:'是',
          type:'bar',
          stack: '广告',
          data:['${countStay1}', '${countSchedule2211}', '${countSchedule2221}', '${countSchedule2231}', '${countSchedule2301}', '${countSchedule2311}', '${countSchedule2321}', '${countSchedule2331}', '${countSchedule2341}', '${countSchedule2411}', '${countSchedule2421}']
        },
        {
          name:'否',
          type:'bar',
          stack: '广告',
          data:['${countStay0}', '${countSchedule2210}', '${countSchedule2220}', '${countSchedule2230}', '${countSchedule2300}', '${countSchedule2310}', '${countSchedule2320}', '${countSchedule2330}', '${countSchedule2340}', '${countSchedule2410}', '${countSchedule2420}']
        }
      ]
    };
    echart_bar.setOption(option_bar);
  });
</script>