var code = '', actionType = 'level';
var $name = $('#name'), $job = $('#job'), $company = $('#company'), $level = $('#level'), $schedule222 = $('#schedule222'), $schedule230 = $('#schedule230'), $schedule242 = $('#schedule242');
var $qrcodeName = $('#qrcodeName'), $qrcodeImg = $('#qrcodeImg');
$(function () {
    document.onkeypress = function (event) {
        if(event.keyCode === 13) {
            event.preventDefault();
            if (isOpen) {
                if(code || inputBox.val()) {
                    if(code.length !== 6) search(inputBox.val());
                    else viewData();
                } else {
                    layer.msg('请输入查询内容', {time:1000});
                }
            } else if (code.length !== 6) {
                code = '';
                layer.msg('请重新扫码', {time:1000});
            } else {
                viewData(event);
            }
        } else if(/^Digit\d$/.test(event.code)) {
            code += event.key;
        // } else if(event.keyCode === 99) {
        //     code = '';
        // } else if(event.keyCode === 100) {
        //     alert(code);
        }
    };
});

function viewData(event){
    if(event) event.preventDefault();
    clearMemberInfo();
    console.info('扫码成功：' + code);
    $.ajax(_PATH + '/attendee/viewData/' + actionType + '/' + code, {
        type: 'GET',
        dataType: 'json',
        success: function (resp) {
            fillMemberInfo(resp.data);
        }
    });
    code = '';
}

function search(keyword){
    code = '';
    clearMemberInfo();
    $.ajax(_PATH + '/attendee/view_s?keyword=' + keyword, {
        type: 'GET',
        dataType: 'json',
        success: function (resp) {
            if (!resp.data) {
                $name.text('未搜索到嘉宾');
            } else if (resp.data.length === 0) {
                $name.text('未搜索到嘉宾');
            } else if (resp.data.length === 1) {
                fillMemberInfo(resp.data[0]);
            } else {
                $name.text('搜索到多位嘉宾，请从搜索狂下方的搜索结果中选择一位');
            }
        }
    });
}

function clearMemberInfo() {
    $name.text('扫码成功，正在加载嘉宾信息...');
    $qrcodeName.text(' ');
    $job.text(' ');
    $company.text(' ');
    $level.text('0');
    $schedule222.text('0');
    $schedule230.text('0');
    $schedule242.text('0');
    $qrcodeImg.attr('src', _PATH + '/static/common/img/logo.png');
}

function fillMemberInfo(member) {
    if(member) {
        console.info(member);
        try {
            $name.text(member.name);
            $job.text(member.title);
            $company.text(member.company);

            var level = (member.operator).substr(0,1);

            $qrcodeName.text(n_c(level) + ' ' + member.name);
            $level.text(level);
            $schedule222.text(member.schedule222_c);
            $schedule230.text(member.schedule230_c);
            $schedule242.text(member.schedule242_c);
            $qrcodeImg.attr('src', 'http://effie.china-caa.org:81/qrcode/' + member.operator + '.jpg');
        } catch (e) {
            $name.text('嘉宾信息不完整');
        }
    } else {
        $name.text('无信息');
    }
}

/**
 * 打印二维码
 */
function printQRCode() {
    $('#btnPrint').blur();
    $("#qrCodePrintArea").show().print({
        globalStyles: false,
        mediaPrint: false,
        stylesheet: null,
        noPrintSelector: ".no-print",
        iframe: true,
        append: null,
        prepend: null,
        manuallyCopyFormValues: false,
        deferred: $.Deferred(),
        timeout: 750,
        title: null,
        doctype: '<!doctype html>'
    });
}

/**
 * 扫码行为切换
 * @param type
 */
function ct(type) {
    $('#btn' + type).blur();
    actionType = type;
    $('#header nav a').removeClass('curr');
    $('#'+actionType).parent().addClass('curr');
}

function n_c(level) {
    switch (level) {
        case '1': return '①';
        case '2': return '②';
        case '3': return '③';
        case '4': return '④';
        case '5': return '⑤';
        default: return level;
    }
}