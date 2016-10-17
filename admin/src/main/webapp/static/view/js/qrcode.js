var code = '', actionType = 'level';
var $tips = $('#tips'), $name = $('#name'), $job = $('#job'), $company = $('#company'), $level = $('#level'), $schedule222 = $('#schedule222'), $schedule230 = $('#schedule230'), $schedule242 = $('#schedule242');
var $qrcodeName = $('#qrcodeName'), $qrcodeImg = $('#qrcodeImg');
$(function () {
    document.onkeypress = function (event) {
        if(event.code === 'Enter') {
            if(code.length !== 6) {
                code = '';
                layer.msg('请重新扫码', {time:1000});
                return;
            }
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
        } else if(/^Digit\d$/.test(event.code)) {
            code += event.key;
        // } else if(event.keyCode === 99) {
        //     code = '';
        // } else if(event.keyCode === 100) {
        //     alert(code);
        }
    };
    // $(window).blur(function(){
    //     $tips.removeClass('note-info').addClass('note-danger').text('请注意！！！ 当前窗口不是激活窗口，无法正常扫码，请点击一下浏览器。');
    // });
    // $(window).focus(function(){
    //     $tips.removeClass('note-danger').addClass('note-info').text('嘉宾信息');
    // });
});

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
            $company.text('嘉宾信息不完整');
        }
    } else {
        $name.text('无信息');
    }
}

/**
 * 打印二维码
 */
function printQRCode() {
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