<%@ page language="java" contentType="text/html;charset=utf-8" %>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <a href="${_PATH}/main.html">首页</a>
      <i class="fa fa-angle-right"></i>
    </li>
    <li>
      <a href="${_PATH}/kpi/list">绩效考核列表</a>
      <i class="fa fa-angle-right"></i>
    </li>
    <li>
      <span>反恐</span>
    </li>
  </ul>
  <div class="page-toolbar">
    <jsp:include page="actions.jsp"/>
  </div>
</div>
<div class="row">
  <div class="col-md-12">
    <form class="form-horizontal form-row-seperated">
      <input type="hidden" name="tablename" value="2"/>
      <input type="hidden" name="id" value="${data.id}"/>
      <input type="hidden" name="status" id="status" value="${data.status}"/>
      <div class="tablename">反恐经费支出绩效评价表</div>
      <table cellspacing="0" class="tableizer-table">
        <tr style=" font-weight:bold;">
          <td width="65" rowspan="2">一级指标</td>
          <td width="37" rowspan="2">权重</td>
          <td width="91" rowspan="2">二级指标</td>
          <td width="30" rowspan="2">分值</td>
          <td width="188" rowspan="2">三级指标</td>
          <td width="55" rowspan="2">计量单位</td>
          <td width="50" rowspan="2">目标值(标准)</td>
          <td width="30" rowspan="2">分值</td>
          <td colspan="2">采集数据项</td>
          <td width="70" rowspan="2">指标</td>
        </tr>
        <tr style=" font-weight:bold;">
          <td width="95">数据项1</td>
          <td width="95">数据项2</td>
        </tr>
        <tr>
          <td rowspan="9">预算绩效</td>
          <td rowspan="9">50</td>
          <td rowspan="6">预算管理</td>
          <td rowspan="6">75</td>
          <td style="text-align:left;">预算执行进度(7月)</td>
          <td>%</td>
          <td>40%</td>
          <td>7</td>
          <td><input type="text" name="sj111" value="${data.sj111}"
                     style="width:98%; height:120%;"/></td>
          <td><input type="text" name="sj121" value="${data.sj121}"
                     style="width:98%; height:120%;"/></td>
          <td><input type="text" name="zb11" value="${data.zb11}"
                     style="width:98%; height:120%;"/></td>
        </tr>
        <tr>
          <td style="text-align:left;">预算执行进度（11月）</td>
          <td>%</td>
          <td>80.21%</td>
          <td>8</td>
          <td><input type="text" name="sj112" value="${data.sj112}"
                     style="width:98%; height:120%;"/></td>
          <td><input type="text" name="sj122" value="${data.sj122}"
                     style="width:98%; height:120%;"/></td>
          <td><input type="text" name="zb12" value="${data.zb12}"
                     style="width:98%; height:120%;"/></td>
        </tr>
        <tr>
          <td style="text-align:left;">预算调整次数（实际调整数）</td>
          <td>次</td>
          <td>0</td>
          <td>5</td>
          <td><input type="text" name="sj113" value="${data.sj113}"
                     style="width:98%; height:120%;"/></td>
          <td>/</td>
          <td><input type="text" name="zb13" value="${data.zb13}"
                     style="width:98%; height:120%;"/></td>
        </tr>
        <tr>
          <td style="text-align:left;">项目预算资金是否被核减</td>
          <td>是/否</td>
          <td>否</td>
          <td>25</td>
          <td><input type="text" name="sj114" value="${data.sj114}"
                     style="width:98%; height:120%;"/></td>
          <td>/</td>
          <td><input type="text" name="zb14" value="${data.zb14}"
                     style="width:98%; height:120%;"/></td>
        </tr>
        <tr>
          <td style="text-align:left;">结转结余资金率</td>
          <td>%</td>
          <td>-0%</td>
          <td>25</td>
          <td><input type="text" name="sj115" value="${data.sj115}"
                     style="width:98%; height:120%;"/></td>
          <td><input type="text" name="sj125" value="${data.sj125}"
                     style="width:98%; height:120%;"/></td>
          <td><input type="text" name="zb15" value="${data.zb15}"
                     style="width:98%; height:120%;"/></td>
        </tr>
        <tr>
          <td style="text-align:left;">是否开展预算编报考评</td>
          <td>是/否</td>
          <td>是</td>
          <td>5</td>
          <td><input type="text" name="sj116" value="${data.sj116}"
                     style="width:98%; height:120%;"/></td>
          <td>/</td>
          <td><input type="text" name="zb16" value="${data.zb16}"
                     style="width:98%; height:120%;"/></td>
        </tr>
        <tr>
          <td rowspan="3">财务管理</td>
          <td rowspan="3">25</td>
          <td style="text-align:left;">用款计划差错率</td>
          <td>%</td>
          <td>-0%</td>
          <td>7</td>
          <td><input type="text" name="sj117" value="${data.sj117}"
                     style="width:98%; height:120%;"/></td>
          <td><input type="text" name="sj127" value="${data.sj127}"
                     style="width:98%; height:120%;"/></td>
          <td><input type="text" name="zb17" value="${data.zb17}"
                     style="width:98%; height:120%;"/></td>
        </tr>
        <tr>
          <td style="text-align:left;">是否存在违规行为</td>
          <td>是/否</td>
          <td>否</td>
          <td>13</td>
          <td><input type="text" name="sj118" value="${data.sj118}"
                     style="width:98%; height:120%;"/></td>
          <td>/</td>
          <td><input type="text" name="zb18" value="${data.zb18}"
                     style="width:98%; height:120%;"/></td>
        </tr>
        <tr>
          <td style="text-align:left;">是否开展会计决算报表考评</td>
          <td>是/否</td>
          <td>是</td>
          <td>5</td>
          <td><input type="text" name="sj119" value="${data.sj119}"
                     style="width:98%; height:120%;"/></td>
          <td>/</td>
          <td><input type="text" name="zb19" value="${data.zb19}"
                     style="width:98%; height:120%;"/></td>
        </tr>
        <tr style=" font-weight:bold;">
          <td rowspan="2">一级指标</td>
          <td rowspan="2">权重</td>
          <td rowspan="2">二级指标</td>
          <td rowspan="2">分值</td>
          <td rowspan="2">三级指标</td>
          <td rowspan="2">计量单位</td>
          <td rowspan="2"><p>目标值</p>
            <p>(标准)</p></td>
          <td rowspan="2">分值</td>
          <td colspan="2">采集数据项</td>
          <td rowspan="2">指标值</td>
        </tr>
        <tr style=" font-weight:bold;">
          <td>数据项1</td>
          <td>数据项2</td>
        </tr>
        <tr>
          <td rowspan="7">项目产出</td>
          <td rowspan="7">25</td>
          <td rowspan="2">产出数量</td>
          <td rowspan="2">40</td>
          <td width="166" style="text-align:left;">核与辐射监测设备覆盖率</td>
          <td>%</td>
          <td>100%</td>
          <td>20</td>
          <td><input type="text" name="sj211" value="${data.sj211}"
                     style="width:98%; height:120%;"/></td>
          <td><input type="text" name="sj221" value="${data.sj221}"
                     style="width:98%; height:120%;"/></td>
          <td><input type="text" name="zb21" value="${data.zb21}"
                     style="width:98%; height:120%;"/></td>
        </tr>
        <tr>
          <td width="166" style="text-align:left;">反恐人员专业培训覆盖率</td>
          <td>%</td>
          <td>100%</td>
          <td>20</td>
          <td><input type="text" name="sj212" value="${data.sj212}"
                     style="width:98%; height:120%;"/></td>
          <td><input type="text" name="sj222" value="${data.sj222}"
                     style="width:98%; height:120%;"/></td>
          <td><input type="text" name="zb22" value="${data.zb22}"
                     style="width:98%; height:120%;"/></td>
        </tr>
        <tr>
          <td rowspan="2">产出质量</td>
          <td rowspan="2">30</td>
          <td width="166" style="text-align:left;">发现异常情况的处置率</td>
          <td>%</td>
          <td>100%</td>
          <td>20</td>
          <td><input type="text" name="sj213" value="${data.sj213}"
                     style="width:98%; height:120%;"/></td>
          <td><input type="text" name="sj223" value="${data.sj223}"
                     style="width:98%; height:120%;"/></td>
          <td><input type="text" name="zb23" value="${data.zb23}"
                     style="width:98%; height:120%;"/></td>
        </tr>
        <tr>
          <td width="166" style="text-align:left;">是否提高口岸应对核化生等恐怖事件综合能力</td>
          <td>是/否</td>
          <td>是</td>
          <td>10 </td>
          <td><input type="text" name="sj214" value="${data.sj214}"
                     style="width:98%; height:120%;"/></td>
          <td>/</td>
          <td><input type="text" name="zb24" value="${data.zb24}"
                     style="width:98%; height:120%;"/></td>
        </tr>
        <tr>
          <td>产出时效</td>
          <td>10</td>
          <td style="text-align:left;">年度设备采购安装到位率</td>
          <td>%</td>
          <td>100%</td>
          <td>10 </td>
          <td><input type="text" name="sj215" value="${data.sj215}"
                     style="width:98%; height:120%;"/></td>
          <td><input type="text" name="sj225" value="${data.sj225}"
                     style="width:98%; height:120%;"/></td>
          <td><input type="text" name="zb25" value="${data.zb25}"
                     style="width:98%; height:120%;"/></td>
        </tr>
        <tr>
          <td rowspan="2">产出成本</td>
          <td rowspan="2"> 20</td>
          <td style="text-align:left;">大宗设备、物品采购是否政府采购</td>
          <td>是/否</td>
          <td>是</td>
          <td>10 </td>
          <td><input type="text" name="sj216" value="${data.sj216}"
                     style="width:98%; height:120%;"/></td>
          <td>/</td>
          <td><input type="text" name="zb26" value="${data.zb26}"
                     style="width:98%; height:120%;"/></td>
        </tr>
        <tr>
          <td style="text-align:left;">结余经费是否用于反恐项目支出</td>
          <td>是/否</td>
          <td>是</td>
          <td>10 </td>
          <td><input type="text" name="sj217" value="${data.sj217}"
                     style="width:98%; height:120%;"/></td>
          <td>/</td>
          <td><input type="text" name="zb27" value="${data.zb27}"
                     style="width:98%; height:120%;"/></td>
        </tr>
        <tr style=" font-weight:bold;">
          <td rowspan="2">一级指标</td>
          <td rowspan="2">权重</td>
          <td rowspan="2">二级指标</td>
          <td rowspan="2">分值</td>
          <td rowspan="2">三级指标</td>
          <td rowspan="2">计量单位</td>
          <td rowspan="2"><p>目标值</p>
            <p>(标准)</p></td>
          <td rowspan="2">分值</td>
          <td colspan="3">采集数据项</td>
        </tr>

        <tr style=" font-weight:bold;">
          <td>数据项1</td>
          <td colspan="2">理由</td>
        </tr>

        <tr>
          <td rowspan="22">项目效果</td>
          <td rowspan="22">25</td>
          <td rowspan="4">经济效益</td>
          <td rowspan="4">20</td>
          <td rowspan="4" style="text-align:left;">专项资金投入是否提高了口岸反恐综合能力建设</td>
          <td rowspan="4">是/否</td>
          <td rowspan="4">是</td>
          <td>5</td>
          <td rowspan="4"><input type="text" name="sj31"
                                 value="${data.sj31}" style="width:98%; height:100%;"/></td>
          <td colspan="2" style="text-align:left;">①<input type="text"
                                                           name="ly311" value="${data.ly311}"
                                                           style="width:93%;height:135%;"/>
          </td>
        </tr>
        <tr>
          <td>5</td>
          <td colspan="2" style="text-align:left;">②<input type="text"
                                                           name="ly312" value="${data.ly312}"
                                                           style="width:93%;height:135%;"/></td>
        </tr>
        <tr>
          <td>5</td>
          <td colspan="2" style="text-align:left;">③<input type="text"
                                                           name="ly313" value="${data.ly313}"
                                                           style="width:93%;height:135%;"/></td>
        </tr>
        <tr>
          <td>5</td>
          <td colspan="2" style="text-align:left;">④<input type="text"
                                                           name="ly314" value="${data.ly314}"
                                                           style="width:93%;height:135%;"/></td>
        </tr>
        <tr>
          <td rowspan="8">社会效益</td>
          <td rowspan="8">40</td>
          <td rowspan="4" style="text-align:left;">专项资金投入是否降低了核、生、化材料非法入境量</td>
          <td rowspan="4">是/否</td>
          <td rowspan="4">是</td>
          <td>5</td>
          <td rowspan="4"><input type="text" name="sj32"
                                 value="${data.sj32}" style="width:98%; height:100%;"/></td>
          <td colspan="2" style="text-align:left;">①<input type="text"
                                                           name="ly321" value="${data.ly321}"
                                                           style="width:93%;height:135%;"/></td>
        </tr>
        <tr>
          <td>5</td>
          <td colspan="2" style="text-align:left;">②<input type="text"
                                                           name="ly322" value="${data.ly322}"
                                                           style="width:93%;height:135%;"/></td>
        </tr>
        <tr>
          <td>5</td>
          <td colspan="2" style="text-align:left;">③<input type="text"
                                                           name="ly323" value="${data.ly323}"
                                                           style="width:93%;height:135%;"/></td>
        </tr>
        <tr>
          <td>5</td>
          <td colspan="2" style="text-align:left;">④<input type="text"
                                                           name="ly324" value="${data.ly324}"
                                                           style="width:93%;height:135%;"/></td>
        </tr>
        <tr>
          <td rowspan="4" style="text-align:left;">专项资金投入是否减少了口岸发生核、生、化恐怖袭击的可能性</td>
          <td rowspan="4">是/否</td>
          <td rowspan="4">是</td>
          <td>5</td>
          <td rowspan="4"><input type="text" name="sj33"
                                 value="${data.sj33}" style="width:98%; height:100%;"/></td>
          <td colspan="2" style="text-align:left;">①<input type="text"
                                                           name="ly331" value="${data.ly331}"
                                                           style="width:93%;height:135%;"/></td>
        </tr>
        <tr>
          <td>5</td>
          <td colspan="2" style="text-align:left;">②<input type="text"
                                                           name="ly332" value="${data.ly332}"
                                                           style="width:93%;height:135%;"/></td>
        </tr>
        <tr>
          <td>5</td>
          <td colspan="2" style="text-align:left;">③<input type="text"
                                                           name="ly333" value="${data.ly333}"
                                                           style="width:93%;height:135%;"/></td>
        </tr>
        <tr>
          <td>5</td>
          <td colspan="2" style="text-align:left;">④<input type="text"
                                                           name="ly334" value="${data.ly334}"
                                                           style="width:93%;height:135%;"/></td>
        </tr>
        <tr>
          <td rowspan="4">环境效益</td>
          <td rowspan="4"> 20</td>
          <td rowspan="4" style="text-align:left;">专项资金投入是否提高了口岸超标放射性物质的发现能力</td>
          <td rowspan="4">是/否</td>
          <td rowspan="4">是</td>
          <td>5 </td>
          <td rowspan="4"><input type="text" name="sj34"
                                 value="${data.sj34}" style="width:98%; height:100%;"/></td>
          <td colspan="2" style="text-align:left;">①<input type="text"
                                                           name="ly341" value="${data.ly341}"
                                                           style="width:93%;height:135%;"/></td>
        </tr>
        <tr>
          <td>5</td>
          <td colspan="2" style="text-align:left;">②<input type="text"
                                                           name="ly342" value="${data.ly342}"
                                                           style="width:93%;height:135%;"/></td>
        </tr>
        <tr>
          <td>5</td>
          <td colspan="2" style="text-align:left;">③<input type="text"
                                                           name="ly343" value="${data.ly343}"
                                                           style="width:93%;height:135%;"/></td>
        </tr>
        <tr>
          <td>5</td>
          <td colspan="2" style="text-align:left;">④<input type="text"
                                                           name="ly344" value="${data.ly344}"
                                                           style="width:93%;height:135%;"/></td>
        </tr>
        <tr>
          <td rowspan="4">可持续影响</td>
          <td rowspan="4">20 </td>
          <td rowspan="4" style="text-align:left;">专项资金投入是否提高了恐怖组织通过口岸运输核、生、化材料或对口岸实施相应恐怖袭击的威慑力</td>
          <td rowspan="4">是/否</td>
          <td rowspan="4">是</td>
          <td> 5 </td>
          <td rowspan="4"><input type="text" name="sj35"
                                 value="${data.sj35}" style="width:98%; height:100%;"/></td>
          <td colspan="2" style="text-align:left;">①<input type="text"
                                                           name="ly351" value="${data.ly351}"
                                                           style="width:93%;height:135%;"/></td>
        </tr>
        <tr>
          <td>5</td>
          <td colspan="2" style="text-align:left;">②<input type="text"
                                                           name="ly352" value="${data.ly352}"
                                                           style="width:93%;height:135%;"/></td>
        </tr>
        <tr>
          <td>5</td>
          <td colspan="2" style="text-align:left;">③<input type="text"
                                                           name="ly353" value="${data.ly353}"
                                                           style="width:93%;height:135%;"/></td>
        </tr>
        <tr>
          <td>5</td>
          <td colspan="2" style="text-align:left;">④<input type="text"
                                                           name="ly354" value="${data.ly354}"
                                                           style="width:93%;height:135%;"/></td>
        </tr>
        <tr>
          <td rowspan="2">服务对象满意度</td>
          <td rowspan="2"> </td>
          <td> </td>
          <td> </td>
          <td> </td>
          <td> </td>
          <td> </td>
          <td colspan="2"> </td>
        </tr>
        <tr>
          <td> </td>
          <td> </td>
          <td> </td>
          <td> </td>
          <td> </td>
          <td colspan="2"> </td>
        </tr>
        <tr style=" font-weight:bold;">
          <td>总分</td>
          <td>100</td>
          <td>得分</td>
          <td><input type="text" name="defen" value="${data.defen}"
                     style="width:98%; height:120%;"/></td>
          <td colspan="7"> </td>
        </tr>
      </table>
      <div style="font-size:12px;">
        <p style="margin-top:2%;margin-left:5%;font-weight:bold;">
          填报单位（公章）：<input type="text" name="tbdw" value="${data.tbdw}"
                          style="width:28%; height:120%;"/> <span style="margin-left:5%;">
							单位负责人：<input type="text" name="dwfzr" value="${data.dwfzr}"
                           style="width:28%; height:120%;"/>
						</span>
        </p>
        <p style="margin-left:0%;">填表说明:</p>
        <p style="margin-left:2%;">1、填报单位需对数据真实性、准确性、完整性负责。</p>
        <p style="margin-left:2%;">2、表格中所有格式（包括行、列、公式等）均不得改动。</p>
        <p style="margin-left:2%;">3、采集数据项量化指标只填写数值，不含中英文字符。</p>
        <p style="margin-left:2%;">4、采集数据项必须严格按照计量单位填写。</p>
        <p style="margin-left:2%;">5、项目效果凡确定为“是”的，需在理由栏中举例说明，举例要求真实恰当，举例不全或不符合要求扣减相应分值。</p>
        <p style="margin-left:2%;">6、表格需盖章、签字，手续完备。</p>
      </div>
    </form>
  </div>
</div>

