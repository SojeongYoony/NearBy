/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.72
 * Generated at: 2022-01-12 14:42:17 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("jar:file:/D:/SmartWeb0809/springstudy/nearby/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/NEARBY/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153352682000L));
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1638721606326L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>NearBy - 내 주변의 빠른 소식통</title>\r\n");
      out.write("<link rel=\"shortcut icon\" type=\"image/x-icon\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/image/titleImg3.png\">\r\n");
      out.write("<!-- jquery -->\r\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.6.0.js\" integrity=\"sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("<!-- fontawesome -->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css\" integrity=\"sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==\" crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\" />\r\n");
      out.write("<!-- jquery cookie 제어쿼리 쿠키  -->\r\n");
      out.write("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js\" integrity=\"sha512-aUhL2xOCrpLEuGD5f6tgHbLYEXRpYZ8G5yD+WlFrXrPy2IrWBlu6bih5C9H6qGsgqnU6mgx6KtU8TreHpASprw==\" crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\"></script>\r\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@10\"></script>\r\n");
      out.write("\r\n");
      out.write("<style>\r\n");
      out.write("   * {\r\n");
      out.write("      margin: 0;\r\n");
      out.write("      padding: 0;\r\n");
      out.write("      box-sizing: border-box;\r\n");
      out.write("   }  \r\n");
      out.write("   a { text-decoration: none; color:black }\r\n");
      out.write("   @font-face {\r\n");
      out.write("     font-family: 'S-CoreDream-5Medium';\r\n");
      out.write("     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-5Medium.woff') format('woff');\r\n");
      out.write("     font-weight: normal;\r\n");
      out.write("     font-style: normal;\r\n");
      out.write("  }\r\n");
      out.write("  /* h1에 에스코어드림 M 적용하기*/\r\n");
      out.write("  .s_core_dream_m {\r\n");
      out.write("    font-family: 'S-CoreDream-5Medium';\r\n");
      out.write("  }\r\n");
      out.write("  @font-face {\r\n");
      out.write("    font-family: 'SBAggroL';\r\n");
      out.write("    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroL.woff') format('woff');\r\n");
      out.write("    font-weight: normal;\r\n");
      out.write("    font-style: normal;\r\n");
      out.write("  }\r\n");
      out.write("  /* p 태그 어그로체*/\r\n");
      out.write("  .aggroL {\r\n");
      out.write(" 	font-family:  'SBAggroL';\r\n");
      out.write("  }\r\n");
      out.write(" \r\n");
      out.write("   @import url('https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css');\r\n");
      out.write("  /* 로그인 관련 p태그에 나눔스퀘어적용*/\r\n");
      out.write("  .nanum_square {\r\n");
      out.write("    font-family: 'NanumSquare';\r\n");
      out.write("   }\r\n");
      out.write("\r\n");
      out.write("   .container {\r\n");
      out.write("      width: 100%;\r\n");
      out.write("      height: 100%;\r\n");
      out.write("      margin:   0 auto;\r\n");
      out.write("   }  \r\n");
      out.write("   .header_wrap {\r\n");
      out.write("      z-index: 5;\r\n");
      out.write("      position: fixed;\r\n");
      out.write("      top: 0;\r\n");
      out.write("      width:100%;\r\n");
      out.write("      height: 100px;\r\n");
      out.write("      background-color: rgba( 20, 20, 20, 0.9);\r\n");
      out.write("      display: flex;\r\n");
      out.write("   }\r\n");
      out.write("   .blur {\r\n");
      out.write("     opacity: 0.4;\r\n");
      out.write("     \r\n");
      out.write("   }\r\n");
      out.write("   .main {\r\n");
      out.write("         z-index: -1;\r\n");
      out.write("   }\r\n");
      out.write("   \r\n");
      out.write("   .main_box1 {\r\n");
      out.write("      width: 100%;\r\n");
      out.write("      height:400px;\r\n");
      out.write("      text-align: center;\r\n");
      out.write("      background-color: #fe565d;\r\n");
      out.write("      padding-bottom: 30px;\r\n");
      out.write("   }\r\n");
      out.write("   \r\n");
      out.write("   .main_box2 {\r\n");
      out.write("      width: 100%;\r\n");
      out.write("      height: 3000px;\r\n");
      out.write("      background-color: rgba(255, 250, 250, 0.8);\r\n");
      out.write("      margin: 0 auto;\r\n");
      out.write("      padding: 0 auto;\r\n");
      out.write("   }\r\n");
      out.write("   \r\n");
      out.write("   .main_box1 h1 {\r\n");
      out.write("      color: white;\r\n");
      out.write("      font-size: 56px;\r\n");
      out.write("      padding-top: 200px;\r\n");
      out.write("   }\r\n");
      out.write("   .btn {\r\n");
      out.write("      width: 140px;\r\n");
      out.write("      height: 40px;\r\n");
      out.write("      border-radius: 30px;\r\n");
      out.write("      border: none;\r\n");
      out.write("      font-size: 20px;\r\n");
      out.write("      cursor:pointer;   \r\n");
      out.write("   }\r\n");
      out.write("   .img_wrap {\r\n");
      out.write("      width: 100%;\r\n");
      out.write("      height: 1380px;\r\n");
      out.write("      display: flex;\r\n");
      out.write("   }\r\n");
      out.write("   .left_box {\r\n");
      out.write("      width: 50%;\r\n");
      out.write("      height: 100%;\r\n");
      out.write("      display: flex;\r\n");
      out.write("      text-align: center;\r\n");
      out.write("   }\r\n");
      out.write("   \r\n");
      out.write("   #img1 {\r\n");
      out.write("      margin: 260px auto;\r\n");
      out.write("	  width: 660px;\r\n");
      out.write("	  height: 924px;\r\n");
      out.write("   }\r\n");
      out.write("   \r\n");
      out.write("   #img2 {\r\n");
      out.write("     margin: 360px auto;\r\n");
      out.write("     width: 700px;\r\n");
      out.write("     height: 770px;\r\n");
      out.write("   }\r\n");
      out.write("   \r\n");
      out.write("   .right_box {\r\n");
      out.write("      width: 50%;\r\n");
      out.write("      height: 100%;\r\n");
      out.write("      display: inline-block;\r\n");
      out.write("      text-align: center;\r\n");
      out.write("   }\r\n");
      out.write("   #app_icon {\r\n");
      out.write("      width: 200px;\r\n");
      out.write("      margin-top: 500px;\r\n");
      out.write("   }\r\n");
      out.write("   \r\n");
      out.write("   .right_box h1 {\r\n");
      out.write("    margin-top: 80px;\r\n");
      out.write("    font-size: 40px;\r\n");
      out.write("    font-weight: 900;\r\n");
      out.write("   }\r\n");
      out.write("   .right_box p {\r\n");
      out.write("      margin-top: 10px;\r\n");
      out.write("      font-size: 30px;\r\n");
      out.write("      font-weight: 500;\r\n");
      out.write("   }\r\n");
      out.write("\r\n");
      out.write("   #login_btn1 {\r\n");
      out.write("      margin: 30px auto;\r\n");
      out.write("      margin-right:2%;\r\n");
      out.write("      border-radius: 30px;\r\n");
      out.write("   }\r\n");
      out.write("   #login_btn1:hover {\r\n");
      out.write("      background-color: #fe565d;\r\n");
      out.write("      color: white;\r\n");
      out.write("   }\r\n");
      out.write("    #login_btn2 {\r\n");
      out.write("      background-color: rgb(43,26,27);\r\n");
      out.write("      color: white;\r\n");
      out.write("        margin-top: 40px;\r\n");
      out.write("      border-radius: 30px;\r\n");
      out.write("   }\r\n");
      out.write("   #login_btn2:hover {\r\n");
      out.write("      background-color: white;\r\n");
      out.write("      color: black;\r\n");
      out.write("   }\r\n");
      out.write("   #join_btn1 {\r\n");
      out.write("        margin-top: 44px;\r\n");
      out.write("        color: black;\r\n");
      out.write("   }\r\n");
      out.write("   #join_btn2 {\r\n");
      out.write("       margin-top: 40px;\r\n");
      out.write("       background-color: rgb(43,26,27);\r\n");
      out.write("       color: white;\r\n");
      out.write("       width: 200px;\r\n");
      out.write("   }\r\n");
      out.write("   #join_btn2:hover{\r\n");
      out.write("    background-color: white;\r\n");
      out.write("     color: black;\r\n");
      out.write("   }\r\n");
      out.write("   \r\n");
      out.write("   .main_box3 h1 {  padding-top: 120px;   }\r\n");
      out.write("   \r\n");
      out.write("   #login_form {    \r\n");
      out.write("       box-shadow: 10px 10px 20px rgba(30, 30, 30, 0.5);\r\n");
      out.write("       position:fixed;\r\n");
      out.write("       top: 140px;\r\n");
      out.write("       left: 200px;\r\n");
      out.write("       right: 200px;\r\n");
      out.write("       width: 600px;\r\n");
      out.write("       height: 670px;\r\n");
      out.write("       border-radius: 30px;\r\n");
      out.write("       border : 1px solid rgba(50,50,50,0.3);\r\n");
      out.write("       margin: 0 auto;\r\n");
      out.write("       margin-top: 20px;\r\n");
      out.write("       padding: 10px;\r\n");
      out.write("       text-align: center;\r\n");
      out.write("       background-color: white;\r\n");
      out.write("   }\r\n");
      out.write("   #close_login_btn {\r\n");
      out.write("      font-size: 20px;\r\n");
      out.write("      margin-left: 520px;\r\n");
      out.write("      margin-top: 16px;\r\n");
      out.write("      color: rgb(43,26,27);\r\n");
      out.write("   }   \r\n");
      out.write("   #close_login_btn:hover {\r\n");
      out.write("      color: #fe585c;\r\n");
      out.write("      cursor: pointer;\r\n");
      out.write("   }\r\n");
      out.write("   .input_wrap{\r\n");
      out.write("      margin: 0 auto;\r\n");
      out.write("   }\r\n");
      out.write("   .idSavedCheck { \r\n");
      out.write("    display:inline-block;\r\n");
      out.write("    width:400px;\r\n");
      out.write("    height:50px;\r\n");
      out.write("   	  text-align: left;\r\n");
      out.write("   }\r\n");
      out.write("   #login_submit {\r\n");
      out.write("      margin-top: 30px;\r\n");
      out.write("      width: 400px;\r\n");
      out.write("      height: 50px;\r\n");
      out.write("      border-radius: 5px;\r\n");
      out.write("      border: none;\r\n");
      out.write("      background-color: #fe585c;\r\n");
      out.write("      font-size: 22px;\r\n");
      out.write("      color: white;   \r\n");
      out.write("   }\r\n");
      out.write("   #login_submit:hover {\r\n");
      out.write("      cursor: pointer;\r\n");
      out.write("   }  \r\n");
      out.write("   .see {\r\n");
      out.write("      display: block;\r\n");
      out.write("      width: 500px;\r\n");
      out.write("      height: 600px;\r\n");
      out.write("   }\r\n");
      out.write("   .no {\r\n");
      out.write("      display: none;\r\n");
      out.write("   }\r\n");
      out.write("   .input_box {\r\n");
      out.write("      border-radius: 5px;\r\n");
      out.write("      margin: 8px auto;\r\n");
      out.write("      margin-bottom: 30px;\r\n");
      out.write("      border: none;\r\n");
      out.write("      width: 400px;\r\n");
      out.write("      height: 40px;\r\n");
      out.write("      line-height: 20px;\r\n");
      out.write("      background-color: #e8f0fe;\r\n");
      out.write("   }\r\n");
      out.write("   .input_box > input {\r\n");
      out.write("      border: none;\r\n");
      out.write("      outline: none;\r\n");
      out.write("      width: 340px;\r\n");
      out.write("      height: 30px;\r\n");
      out.write("      line-height: 30px;\r\n");
      out.write("      margin-top: 8px;\r\n");
      out.write("      background-color: #e8f0fe;\r\n");
      out.write("   }\r\n");
      out.write("   .input_wrap > p{\r\n");
      out.write("      text-align: left;\r\n");
      out.write("      margin-left : 90px;\r\n");
      out.write("      font-size: 18px;\r\n");
      out.write("   }\r\n");
      out.write("   #logo2 {\r\n");
      out.write("      width: 280px;\r\n");
      out.write("      margin-top :40px;\r\n");
      out.write("      margin-bottom: 20px;      \r\n");
      out.write("   }\r\n");
      out.write("   #move_area {\r\n");
      out.write("     text-align: center;\r\n");
      out.write("     margin-top: 30px; \r\n");
      out.write("   }\r\n");
      out.write("   #move_area i {\r\n");
      out.write("     display: inline-block;\r\n");
      out.write("     margin-right: 10px;\r\n");
      out.write("     color: rgb(50, 50, 50, 0.7);\r\n");
      out.write("   }\r\n");
      out.write("   #move_area p {\r\n");
      out.write("     color: rgb(50, 50, 50, 0.7);\r\n");
      out.write("   }\r\n");
      out.write("   #find_btn1:hover:nth-of-type(1)  {\r\n");
      out.write("     color: rgb(30, 30, 30);   \r\n");
      out.write("     font-weight: bold;\r\n");
      out.write("   }\r\n");
      out.write("\r\n");
      out.write("   #join_btn1:hover  {\r\n");
      out.write("     color: rgb(30, 30, 30);   \r\n");
      out.write("     font-weight: bold;\r\n");
      out.write("   }\r\n");
      out.write("   \r\n");
      out.write("   /* sweet alert */\r\n");
      out.write("  .swal2-popup { padding: 0.5em; }\r\n");
      out.write("  .swal2-icon {\r\n");
      out.write("  	width: 4.5em;\r\n");
      out.write("  	height: 4.5em;\r\n");
      out.write("  }\r\n");
      out.write("   .swal2-styled { margin:  0.5em; }\r\n");
      out.write("   .swal2-styled.swal2-confirm { width: 100px; background-color: #d4d4d4;  }\r\n");
      out.write("   .swal2-styled.swal2-cancel {width: 100px;}\r\n");
      out.write("   .swal2-icon.swal2-warning { color: pink; border-color: pink;}\r\n");
      out.write("   .swal2-header{ height: 100px; }\r\n");
      out.write("   \r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("  $(document).ready(function(){\r\n");
      out.write("   fnLoginBtn();      // login 버튼 눌렀을 때 로그인 창 나타나기\r\n");
      out.write("   fnLogin();         // login 서브밋\r\n");
      out.write("   fnCloseLoginBtn();\r\n");
      out.write("   fnDisplayId();	// 아이디 표시\r\n");
      out.write("  });\r\n");
      out.write("     \r\n");
      out.write("  \r\n");
      out.write("     // login 버튼 눌렀을 때 로그인 창 나타나기 / 배경 흐림효과\r\n");
      out.write("    function fnLoginBtn() {\r\n");
      out.write("     $('.login_btn').click( function() {\r\n");
      out.write("        $('#login_form').addClass('see').removeClass('no');\r\n");
      out.write("        $('.main').addClass('blur');\r\n");
      out.write("      });\r\n");
      out.write("   }\r\n");
      out.write("     \r\n");
      out.write("    // close_login_btn 눌렀을 때 로그인 창 사라지기 / 배경 흐림효과 삭제\r\n");
      out.write("    function fnCloseLoginBtn() {\r\n");
      out.write("     $('#close_login_btn').click( function() {\r\n");
      out.write("        $('#login_form').addClass('no').removeClass('see');\r\n");
      out.write("        $('.main').removeClass('blur');\r\n");
      out.write("      });\r\n");
      out.write("   }\r\n");
      out.write("    \r\n");
      out.write("    function fnIdCheck(){\r\n");
      out.write("       // 클릭했는데 핑크이면 그레이로 / 클릭했는데 그레이면 핑크로\r\n");
      out.write("    	if( 	$('.fa-check-circle').css('color', \"#fe585c\") == true ){\r\n");
      out.write("    		$('.fa-check-circle').css('color', \"gray\");\r\n");
      out.write("       }else {\r\n");
      out.write("    		   $('.fa-check-circle').css('color', '#fe585c'); \r\n");
      out.write("       }\r\n");
      out.write("    	let rememberId = $.cookie('rememberId');\r\n");
      out.write("    	if (rememberId != '') {  // id 값 널아니고, 아이디 저장 기억하기 되어있으면 \r\n");
      out.write("    	 if( 	$('#checkRememberId').prop('checked') == true   ){\r\n");
      out.write("    		 \r\n");
      out.write("    		 $('#checkRememberId').prop('checked', true);\r\n");
      out.write("    			$('.fa-check-circle').css('color',\"gray\");\r\n");
      out.write("    	 } else {\r\n");
      out.write("    			$('#id').val(rememberId);\r\n");
      out.write("    			$('#checkRememberId').prop('checked', false);\r\n");
      out.write("    			$('.fa-check-circle').css('color',\"#fe585c\");\r\n");
      out.write("    	  }\r\n");
      out.write("    	}\r\n");
      out.write("    }\r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("    // 아이디 표시\r\n");
      out.write("    function fnDisplayId(){\r\n");
      out.write("    	let rememberId = $.cookie('rememberId');\r\n");
      out.write("    	if (rememberId != '') {\r\n");
      out.write("    		$('#id').val(rememberId);\r\n");
      out.write("    		$('#checkRememberId').prop('checked', true);\r\n");
      out.write("    		$('.fa-check-circle').css('color',\"#fe585c\");\r\n");
      out.write("    	} else {\r\n");
      out.write("    		$('#checkRememberId').prop('checked', false);\r\n");
      out.write("    		$('.fa-check-circle').css('color',\"gray\");\r\n");
      out.write("    	} \r\n");
      out.write("}\r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("     // login 서브밋\r\n");
      out.write("   function fnLogin() {\r\n");
      out.write("      $(\"#login_form\").submit(function(event){\r\n");
      out.write("         let regId = /^[a-zA-Z0-9_-]{4,}$/;                  // ID 정규식\r\n");
      out.write("         let regPw = /^[a-zA-Z0-9!@$%^&*()]{8,20}$/;         // PW 정규식\r\n");
      out.write("         if ( regId.test($('#id').val()) == false || regPw.test($('#pw').val()) == false){\r\n");
      out.write("            alert('아이디와 비밀번호의 형식이 올바르지 않습니다.');\r\n");
      out.write("            event.preventDefault();\r\n");
      out.write("            return false;\r\n");
      out.write("         }\r\n");
      out.write("         \r\n");
      out.write("      // 아이디 저장하기\r\n");
      out.write("			if ( $('#checkRememberId').is(':checked') ){  // 아이디 저장이 체크되어 있으면,\r\n");
      out.write("				$.cookie('rememberId', $('#id').val());  // 쿠키 rememberId 생성(아이디 저장) \r\n");
      out.write("			} else {\r\n");
      out.write("				$.cookie('rememberId', '');  // 쿠키 rememberId 생성(빈 문자열 저장)\r\n");
      out.write("			}\r\n");
      out.write("			return true;\r\n");
      out.write("      });\r\n");
      out.write("   }\r\n");
      out.write("   \r\n");
      out.write("   \r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("   <div class=\"container\">\r\n");
      out.write("     \r\n");
      out.write("     \r\n");
      out.write("     <!------------------------------------- header ------------------------------------->      \r\n");
      out.write("      \r\n");
      out.write("      <header class=\"header_wrap\">\r\n");
      out.write("           <img id=\"logo\" src=\"resources/image/logo_white.png\" width=\"200px\">\r\n");
      out.write("           <input type=\"button\" value=\"로그인\" id=\"login_btn1\" class=\"btn login_btn\">\r\n");
      out.write("      </header>\r\n");
      out.write("      \r\n");
      out.write("      <!------------------------------------- main --------------------------------------->\r\n");
      out.write("      \r\n");
      out.write("      <main class=\"main\" >\r\n");
      out.write("         <div class=\"main_box1\">\r\n");
      out.write("            <h1 class=\"s_core_dream_m\">당신 근처에 일어나는 다양한 일들 알고싶어?</h1>\r\n");
      out.write("            <input type=\"button\" value=\"시작하기\" id=\"login_btn2\" class=\"btn login_btn\">\r\n");
      out.write("         </div>\r\n");
      out.write("      <div class=\"main_box2\">\r\n");
      out.write("            <div class=\"img_wrap\">\r\n");
      out.write("               <div class=\"left_box\">\r\n");
      out.write("                  <img id=\"img1\" src=\"resources/image/board1.png\">\r\n");
      out.write("               </div>\r\n");
      out.write("               <div class=\"right_box\">\r\n");
      out.write("                  <img id=\"app_icon\" src=\"resources/image/app_icon.png\">\r\n");
      out.write("                  <h1 class=\"s_core_dream_m\">나도 모르는 사이 내 주변에 이런 일이? </h1>\r\n");
      out.write("                  <p class=\"aggroL\">인싸들만 아는 정보들? 걱정 NO NO!</p>\r\n");
      out.write("                  <p class=\"aggroL\">NEARBY 친구들이 알아서 알려줄거야</p>\r\n");
      out.write("               </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"img_wrap\">\r\n");
      out.write("               <div class=\"right_box\">\r\n");
      out.write("                  <img id=\"app_icon\" src=\"resources/image/app_icon.png\">\r\n");
      out.write("                  <h1 class=\"s_core_dream_m\">오늘 저녁 뭐 먹지? </h1>\r\n");
      out.write("                  <p class=\"aggroL\">주변에 인기있는 핫플레이스 맛집 검색까지!</p>\r\n");
      out.write("                  <p class=\"aggroL\">#홍대맛집 #분위기좋은바</p>\r\n");
      out.write("               </div>\r\n");
      out.write("               <div class=\"left_box\">\r\n");
      out.write("                  <img id=\"img2\" src=\"resources/image/board2.png\">\r\n");
      out.write("               </div>\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("                           \r\n");
      out.write("         </div>\r\n");
      out.write("         <div class=\"main_box1 main_box3\">\r\n");
      out.write("            <h1 class=\"s_core_dream_m\">지금 당장 NEARBY 시작하기</h1>\r\n");
      out.write("            <a href=\"/nearby/member/agreement\"><input type=\"button\" class=\"nanum_square btn\" value=\"간편회원가입\" id=\"join_btn2\" class=\"btn join_btn\"></a>\r\n");
      out.write("         </div>\r\n");
      out.write("      </main>\r\n");
      out.write("      <!---------------------------------------- 로그인 폼(숨김)---------------------------------------> \r\n");
      out.write("             <form id=\"login_form\" method=\"post\" class=\"no\" action=\"/nearby/member/login\">\r\n");
      out.write("               <div>\r\n");
      out.write("                  <i id=\"close_login_btn\" class=\"fas fa-times\"></i>   \r\n");
      out.write("               </div>\r\n");
      out.write("               <div>\r\n");
      out.write("                  <img id=\"logo2\" src=\"resources/image/logo_color.png\" width=\"200px\">\r\n");
      out.write("               </div>\r\n");
      out.write("               <div class=\"input_wrap\">\r\n");
      out.write("                  <p class=\"nanum_square\">아이디</p>\r\n");
      out.write("                  <div class=\"input_box\">\r\n");
      out.write("                     <input type=\"text\" name=\"id\" id=\"id\">\r\n");
      out.write("                  </div>\r\n");
      out.write("               </div>   \r\n");
      out.write("               <div class=\"input_wrap\">\r\n");
      out.write("                  <p class=\"nanum_square\">비밀번호<p>\r\n");
      out.write("                  <div class=\"input_box\">\r\n");
      out.write("                     <input type=\"password\" name=\"pw\" id=\"pw\">\r\n");
      out.write("                  </div>\r\n");
      out.write("                  \r\n");
      out.write("               </div>     \r\n");
      out.write("               <div>\r\n");
      out.write("               		<input type=\"checkbox\" id=\"checkRememberId\" style=\"visibility: hidden;\">\r\n");
      out.write("               		\r\n");
      out.write("               		<label for=\"checkRememberId\" class=\"idSavedCheck\" onclick=\"fnIdCheck()\"><i class=\"far fa-check-circle\"></i> 아이디 저장</label>\r\n");
      out.write("               	</div>\r\n");
      out.write("                      \r\n");
      out.write("                  <button class=\"nanum_square\" id=\"login_submit\">로그인</button>\r\n");
      out.write("                        <div id=\"move_area\">\r\n");
      out.write("                        <a id=\"find_btn1\" class=\"find_btn1\" href=\"/nearby/member/findIdPw\"><i class=\"fas fa-key\"></i>아이디/비밀번호 찾기</a><br><br>\r\n");
      out.write("                        <a id=\"join_btn1\" class=\"join_btn1\" href=\"/nearby/member/agreement\"><i class=\"fas fa-sign-in-alt\"></i>회원가입 하러가기</a>\r\n");
      out.write("                    </div>\r\n");
      out.write("             </form>   \r\n");
      out.write("      \r\n");
      out.write("        \r\n");
      out.write("     <!------------------------------------- footer ---------------------------------------->\r\n");
      out.write("      <footer>\r\n");
      out.write("           ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/WEB-INF/views/layout/footerIndex.jsp", out, true);
      out.write("\r\n");
      out.write("      </footer>\r\n");
      out.write("   </div>   \r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
