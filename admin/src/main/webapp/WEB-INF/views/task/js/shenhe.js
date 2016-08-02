var ShenHeTable;
function getShenHeList() {
    if (typeof ShenHeTable !== 'undefined') {
    	ShenHeTable.fnPageChange('first');
        return;
    }
    var i = 1;
    ShenHeTable = $("#ShenHeList").DataTable({
        "sAjaxSource": _path + "/kpi/queryByPage",
        "fnServerParams": function (aoData) {
            aoData.push(
                { "name": "username", "value": $("#username").val()},
                { "name": "status", "value": $("#status").val() },
                { "name": "fromDate", "value": $("#fromDate").val() },
                { "name": "toDate", "value": $("#toDate").val() },
                { "name": "tablename", "value": $("#tablename").val() }
            );
        },
        "sServerMethod": "POST",
        "sAjaxDataProp": "dataList",
        "fnCreatedRow": function () {
            i++;
        },
        "fnPreDrawCallback": function () {
            i = 1;
        },
        "aoColumns": [
	          { "sTitle": "序号", "sWidth": "2%",
	              "mData": function () {
	                  return i;
	              }
	          },
            { "sTitle": "填表人", "mData": "username", "sWidth": "10%" },
            { "sTitle": "表名", "mData": "tablename", "sWidth": "10%",
            	 "mRender": function (data) {
                     var tablename = '';
                     switch (data) {
                         case '1': tablename = '大通关'; break;
                         case '2': tablename = '反恐'; break;
                         case '3': tablename = '赴港澳地区“个人游”'; break;
                         case '4': tablename = '赴港直通车'; break;
                         case '5': tablename = '检验检疫专项'; break;
                         case '6': tablename = '检疫犬'; break;
                         case '7': tablename = '科技专项'; break;
                         case '8': tablename = '口岸核心能力达标建设'; break;
                         case '9': tablename = '其他外事费'; break;
                         case '10': tablename = '实验室大修'; break;
                         case '11': tablename = '外事出国项目'; break;
                         case '12': tablename = '外事接待费'; break;
                         case '13': tablename = '仪器设备'; break;
                         case '14': tablename = '疫情疫病'; break;
                         case '15': tablename = '长吉图发展战略'; break;
                         case '16': tablename = '制装项目'; break;
                         case '17': tablename = '专项交通费'; break;
                         default : tablename = '未知'; break;
                     }
                     return tablename;
                 }
            },
            { "sTitle": "状态", "mData": "status", "sWidth": "10%",
                "mRender": function (data) {
                    var status = '';
                    switch (data) {
                        case '1': status = '待审核'; break;
                        case '2': status = '审核成功'; break;
                        case '3': status = '审核失败'; break;
                        default : status = '未知'; break;
                    }
                    return status;
                }
            },
            { "sTitle": "发布时间", "mData": "createTime", "sWidth": "10%" },
            { "sTitle": "操作", "sWidth": "10%",
                "mData": function (data) {
                    var status = '<a href="' + _path + '/kpi/look/' + data.id + '" class="btn default btn-xs purple"><i class="fa fa-edit" title="查看"></i></a>';
                    return status;
                }
            }
        ]
    });
}
