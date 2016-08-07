/**
 * Created by wzl on 2016/8/7.
 */
// (function($) {
//
// })(jQuery);

    var meeting={
        addPage:{
            submit:function(){
                $("#form").submit();
            },
            validate:function(){
                var validate = $("#form").validate({
                    debug: true, //调试模式取消submit的默认提交功能
                    //errorClass: "label.error", //默认为错误的样式类为：error
                    focusInvalid: true, //当为false时，验证无效时，没有焦点响应
                    onkeyup: true,
                    submitHandler: function(form){   //表单提交句柄,为一回调函数，带一个参数：form
                        alert("提交表单");
                        form.submit();   //提交表单
                    },
                    rules: {
                        meeting_name: {required: true, rangelength: [6, 20]}
                    },
                    messages: {
                        meeting_name: {required: "请输入用户名", rangelength: $.validator.format("请输入{0}到{1}位字符串")}
                    }
                }); }
        },

    }

