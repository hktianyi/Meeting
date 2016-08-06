<%@ page pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if IE 8]> <html class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html>
<!--<![endif]-->
<head>
  <%@include file="../common/common.jsp" %>
</head>
  <body>
      <!-- Page Content -->
      <div id="content" class="page">

        <!-- Main Content -->
        <div class="animated fadeinup">
          
          <!-- Form Inputs --> 
          <div class="form-inputs">
			<form action="${_PATH }/saveFeedback" method="post">
            <h4 class="center">活动反馈!</h4>
            <div>
              <div class="input-field animated fadeinright">
                <input id="comeType" name="comeType" type="text" class="validate">
                <label for="first_name">来时交通工具类型</label>
              </div>
              <div class="input-field animated fadeinright delay-1">
                <input id="comeTicket" name="comeTicket" type="text" class="validate">
                <label for="last_name">来时航班/车次</label>
              </div>
            </div>
            <div class="input-field animated fadeinright delay-2">
              <input id="backType" name="backType" type="text">
              <label for="email">回时交通工具类型</label>
            </div>
            <div class="input-field animated fadeinright delay-3">
              <input id="backTicket" name="backTicket"type="text" class="validate">
              <label for="telephone">回时航班/车次</label>
            </div>
            <div class="input-field animated fadeinright delay-4">
              <input id="dinner" name="dinner" type="text" class="validate">
              <label for="city">用餐</label>
            </div>
            
            <div class="input-field animated fadeinright delay-5">
              <textarea class="materialize-textarea" id="activity"></textarea> 
              <label for="textarea1">活动</label>
            </div>

            <p class="remember animated bouncein delay-6">
              <input type="checkbox" id="test5" />
              <label for="test5">This is an awesome checkbox</label>
            </p>
        
            <input type="submit" class="waves-effect waves-light btn-large primary-color width-100 animated bouncein delay-6" value="提交"/>
            </form>
          </div>

      </div> <!-- End of Page Content -->

    </div> <!-- End of Page Container -->
 	<%@include file="../common/footer.jsp"%>
  </body>
</html>