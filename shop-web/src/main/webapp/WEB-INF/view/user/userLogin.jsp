<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
    <title>Insert title here</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/md5.js"></script>
</head>
<body>

<div style="margin-left: 280px"><h1>用户登录</h1></div>
<div class="container-fluid" >

    <div class="row">

        <div class="col-sm-8" id="bodyDiv" style="float: left;width: 100%">

            <form class="form-horizontal" role="form" action="<%=request.getContextPath()%>/user/userLogin.jhtml" method="post" enctype="multipart/form-data" >
                <fieldset>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="ds_host">用户名称</label>
                        <div class="col-sm-4">
                            <input name="userName" class="form-control" id="ds_host" type="text" placeholder="用户名称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="ds_name">用户密码</label>
                        <div class="col-sm-4">
                            <input type="password" name="password" class="form-control" id="ds_name" type="text" placeholder="用户密码">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" >验证码</label>
                        <div class="col-sm-4">
                            <input name="imageCode" class="form-control"  type="text" placeholder="验证码">
                        </div>
                        <div class="col-md-2">
                            <img src="<%=request.getContextPath()%>/imageCode" alt="" onclick="refreshImageCode(this)">
                        </div>

                    </div>







                </fieldset>

                <div class="form-group" >
                    <div class="col-md-offset-3">
                        <button onclick="addMD5()" class="btn btn-success  col-sm-1" type="submit">
                            <i class="glyphicon glyphicon-ok"></i>
                            Submit
                        </button>
                    </div>
                    <div class=" col-md-offset-3">
                        <button class="btn btn-group-lg  col-sm-1" type="reset">
                            <i class="glyphicon glyphicon-refresh"></i>
                            Reset
                        </button>
                    </div>

                    <div class=" col-md-offset-3">
                        <button onclick="registerUser()" class="btn btn-group-lg  col-sm-1" type="button">
                            <i class="glyphicon glyphicon-road"></i>
                            注册
                        </button>
                    </div>

                    <div class=" col-md-offset-3">
                        <button onclick="resetLock()" class="btn btn-group-lg  col-sm-1" type="button">
                            <i class="glyphicon glyphicon-lock"></i>
                            解锁
                        </button>
                    </div>
                </div>
                <%--多图片添加--%>
                <div id="imageInput">

                </div>

            </form>




        </div>
    </div>
</div>



<%--注册--%>
<div id="addUser">


</div>

<%--------------------------------------------------------------------------------------------------%>
<script src="<%=request.getContextPath()%>/datatable/jquery-3.3.1.js"></script>
<script src="<%=request.getContextPath()%>/datatable/DataTables/js/jquery.dataTables.min.js"></script>
<%--
<script type="text/javascript" src="<%=request.getContextPath()%>/datatable/DataTables/js/dataTables.bootstrap.min.js"></script>
--%>
<script src="<%=request.getContextPath()%>/bootbox/bootbox.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/brandSelect.js"></script>
<%--------------------------------------------------------------------------------------------------%>

<script type="text/javascript">
    //解锁账户
    function resetLock() {

        var userName=$("input[name='userName']").val()
        var password=$("input[name='password']").val()
        var imageCode=$("input[name='imageCode']").val()


        //非空判断
        if(userName==""||password==""||imageCode==""){

            $("#errorMessage").html("<h2><font color='red'>输入框不能为空</font></h2>")
            $("#errorMessage").show()
            return false;
        }
        //md5加密
        password=hex_md5(password)
        $.ajax({
            url:"<%=request.getContextPath()%>/user/resetLockUser.jhtml",
            type:"post",

            data:{
                "userName":userName,
                "password":password,
                "imageCode":imageCode
            },
            success: function (result) {

                if(result.code==1001) {
                    $("#errorMessage").html("<h2><font color='red'>"+result.msg+"</font></h2>")
                    $("#errorMessage").show()
                }
                if(result.code==1003) {
                    $("#errorMessage").html("<h2><font color='red'>"+result.msg+"</font></h2>")
                    $("#errorMessage").show()
                }
                if(result.code==1005) {
                    $("#errorMessage").html("<h2><font color='red'>"+result.msg+"</font></h2>")
                    $("#errorMessage").show()
                }

                if(result.code==1007) {
                    $("#errorMessage").html("<h2><font color='red'>"+result.msg+"</font></h2>")
                    $("#errorMessage").show()
                }

                if(result.code==1008) {
                    $("#errorMessage").html("<h2><font color='red'>"+result.msg+"</font></h2>")
                    $("#errorMessage").show()
                }


            }
        })




    }


    //登录时密码加密
    function addMD5() {
        var password = $("input[name='password']").val();
        $("input[name='password']").val(hex_md5(password));
    }
    //验证码刷新
    function refreshImageCode(obj) {
        var date = new Date();
        var t = date.getTime();
        obj.src="<%=request.getContextPath()%>/imageCode?"+t;

    }
    //密码查看
    var v_bloon=true;
    function viePassword() {

        if(v_bloon){
            $("input[name='password']").prop("type","text")
            v_bloon=false;
            //return false;

        }else{

            $("input[name='password']").prop("type","password")
            v_bloon=true;
        }
    }


    //登录错误信息  反馈
    function validateUser(){
        <%String succ=(String)session.getAttribute("error"); %>

        <%if(succ!=null){%>
        $("#errorMessage").fadeIn(5000);
        $("#errorMessage").fadeOut(5000);
        <%}else{%>
        $("#errorMessage").hide();
        <%}%>

    }
    ///注册
    function  registerUser(){
        $("#addUser").html("<div style=\"margin-left: 280px\"><h1>用户注册</h1></div>\n" +
            "<div class=\"container-fluid\" >\n" +
            "\n" +
            "    <div class=\"row\">\n" +
            "\n" +
            "        <div class=\"col-sm-8\"  style=\"float: left;width: 100%\">\n" +
            "\n" +
            "            <form class=\"form-horizontal\" role=\"form\" action=\"<%=request.getContextPath()%>/user/addUser.jhtml\" method=\"post\" enctype=\"multipart/form-data\" >\n" +
            "                <fieldset>\n" +
            "\n" +
            "                    <div class=\"form-group\">\n" +
            "                        <label class=\"col-sm-2 control-label\" for=\"ds_host\">用户名称</label>\n" +
            "                        <div class=\"col-sm-4\">\n" +
            "                            <input id=\"userName\" name=\"userName\" onblur=\"validateUserName()\" class=\"form-control\"  type=\"text\" placeholder=\"用户名称\">\n" +
            "                        </div>\n" +
            "                    </div>\n" +
            "                    <div class=\"form-group\">\n" +
            "                        <label class=\"col-sm-2 control-label\" for=\"ds_name\">用户密码</label>\n" +
            "                        <div class=\"col-sm-4\">\n" +
            "                            <input type=\"password\" id=\"password\" name=\"password\" onblur=\"validatePassword()\" class=\"form-control\" type=\"text\" placeholder=\"用户密码\">\n" +
            "                        </div>\n" +
            "                    </div>\n" +
            "\n" +
            "                   \n" +
            "\n" +
            "\n" +
            "\n" +
            "\n" +
            "\n" +
            "\n" +
            "\n" +
            "                </fieldset>\n" +
            "\n" +
            "                <div class=\"form-group\" >\n" +
            "                    <div class=\"col-md-offset-3\">\n" +
            "                        <button id=\"registerSubmit\" onclick=\"addUser()\"  class=\"btn btn-success  col-sm-1\" type=\"submit\">\n" +
            "                            <i class=\"glyphicon glyphicon-ok\"></i>\n" +
            "                            Submit\n" +
            "                        </button>\n" +
            "                    </div>\n" +
            "                    <div class=\" col-md-offset-3\">\n" +
            "                        <button class=\"btn btn-group-lg  col-sm-1\" type=\"reset\">\n" +
            "                            <i class=\"glyphicon glyphicon-refresh\"></i>\n" +
            "                            Reset\n" +
            "                        </button>\n" +
            "                    </div>\n" +
            "\n" +
            "                   \n" +
            "                </div>\n" +
            "                \n" +
            "\n" +
            "            </form>\n" +
            "\n" +
            "\n" +
            "\n" +
            "\n" +
            "        </div>\n" +
            "    </div>\n" +
            "</div>\n")

        $("#addUser").css("background","lightblue")

    }
    //名称验证
    function validateUserName(){
        var userName= $("#userName").val()
        //判断名称是否为空
        if(userName!=null&&userName!=""){

            $.ajax({
                url:"<%=request.getContextPath()%>/user/validateUserName.jhtml",
                type:"post",
                dataType:"json",
                data:{
                    "userName":userName,
                },
                success:function(data){

                    if(data.succ==201){

                        $("#errorMessage").html("<h2><font color='red'>账号已存在，请重新填写你的账号信息</font></h2>")
                        $("#errorMessage").show()
                        $("#registerSubmit").prop("disabled","disabled")
                    }else{
                        // alert(444)
                        $("#errorMessage").html("<h2><font color='green'>账号唯一，请继续填写你的注册信息</font></h2>")
                        // $("#errorMessage").show()
                        $("#registerSubmit").prop("disabled","")

                    }
                }

            })

        }else{
            alert(22)
            $("#errorMessage").html("<h2><font color='red'>账号不能为空，请填写你的账号信息</font></h2>")
            $("#errorMessage").show()

        }


    }
    //密码验证
    /* function  validatePassword(){
        var password=$("#password").val()
      //  var userName= $("#userName").val()
       //判断密码是否为空
      if(password!=null&&password!=""){

      }else{
          //alert(333)
           $("#errorMessage").html("<h2><font color='red'>密码不能为空，请填写你的密码信息</font></h2>")
            $("#errorMessage").show()
      }


    } */

    ///点击注册时验证是否为空
    function  addUser(){

        /// alert(55)
        var password=$("#password").val()
        var userName= $("#userName").val()

        if(userName!=null&&userName!=""){
            if(password!=null&&password!=""){
                //传输时md5加密
                var password=hex_md5(password)
                $.ajax({
                    url:"<%=request.getContextPath()%>/user/addNewUser.jhtml",
                    type:"post",
                    data:{
                        "userName":userName,
                        "password":password
                    },
                    success:function(data){
                        alert(data)
                        $("#errorMessage").html("<h2><font color='green'>恭喜你，注册成功</font></h2>")
                        //注册成功后隐藏 注册页面
                        $("#addUser").html("")
                    }

                })

            }else{
                //alert(333)
                $("#errorMessage").html("<h2><font color='red'>密码不能为空，请填写你的密码信息</font></h2>")
                $("#errorMessage").show()}
        }else{
            $("#errorMessage").html("<h2><font color='red'>账号不能为空，请填写你的账号信息</font></h2>")
            $("#errorMessage").show();
        }
    }




</script>




</body>
</html>