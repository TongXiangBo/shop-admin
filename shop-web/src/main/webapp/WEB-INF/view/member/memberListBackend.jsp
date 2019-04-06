<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>用户展示</title>
    <%-- css样式引入--%>
    <jsp:include page="/WEB-INF/common/cssReference.jsp"/>
</head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>会员展示</title>
</head>
<body>

<%--==============================================================================================================--%>

<div class="container-fluid">


    <div class="col-md-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">用户查询</h3>
            </div>
            <div class="panel-body">

                <%--///面板主题--%>
                <div class="container-fluid text-center">
                    <form id="productForm">
                        <div class="row">
                            <div class="col-lg-3">

                                <div class="input-group">
             <span class="input-group-addon">
       用户名：
      </span>
                                    <input type="text" id="userName" class="form-control" aria-label="...">
                                </div><!-- /input-group -->
                            </div><!-- /.col-lg-6 -->

                        </div>


                        <div class="row">
                            <div class="col-lg-6">

                                <div class="input-group">
             <span class="input-group-addon">
      生日：
      </span>
                                    <input type="text" id="minBirthday" class="input-sm form-control form_datetime"
                                           aria-label="...">
                                    <span class="input-group-addon">
      <span class="glyphicon glyphicon-resize-horizontal"></span>
      </span>
                                    <input type="text" id="maxBirthday" class="input-sm form-control form_datetime"
                                           aria-label="...">
                                </div><!-- /input-group -->
                            </div><!-- /.col-lg-6 -->

                        </div>


                        <div class="row">
                            <div class="col-lg-6">

                                <div class="input-group" id="areaDIVByQuery">
                                    <span class="input-group-addon">地区：</span>
<%--

                                    <div class="col-lg-3"  >
                                        <select class="form-control"  id="shengid">
                                            <option value="-1">=省=</option>


                                        </select>
                                    </div>
                                    <div class="col-lg-3">
                                        <select class="form-control" id="shiid">
                                            <option value="-1">=市=</option>

                                        </select>
                                    </div>

                                    <div class="col-lg-3">
                                        <select class="form-control" id="xianid">
                                            <option value="-1">=县=</option>
                                        </select>
                                    </div>
--%>



                                </div><!-- /input-group -->
                            </div><!-- /.col-lg-6 -->

                        </div>


                        <div class="row" style="margin-top: 20px">

                            <div class="col-lg-2">
                                <button onclick="query()" type="button" class="btn  btn-success" >
                                    <span class="glyphicon glyphicon-search"></span>高级查询
                                </button>
                            </div>
                            <div class="col-lg-2">
                                <button type="reset"  class="btn   btn-warning">
                                    <span class="glyphicon glyphicon-repeat"></span>重置
                                </button>
                            </div>
                        </div>

                    </form>
                </div>

            </div>


        </div>

        <%--------------------------------------------------------------------------------------------------%>

       <%-- <div class="row">

            <div style="background:lightskyblue;text-align:left;">
                <button type="button" onclick="addUser()" class="btn  btn-warning">
                    <span class="glyphicon glyphicon-plus"></span>
                    添加用户
                </button>
                <button type="button" onclick="updateUser()" class="btn  btn-success">
                    <span class="glyphicon glyphicon-pencil"></span>
                    用户修改
                </button>

                <button type="button" onclick="batchDelete()" class="btn btn-danger">
                    <span class="glyphicon glyphicon-remove"></span>
                    批量删除
                </button>

                <button type="button" onclick="batchChangeDept()" class="btn btn-success">
                    <span class="glyphicon glyphicon-pencil"></span>
                    批量换部门
                </button>

                <button type="button" onclick="exportExcelByDept()" class="btn btn-success">
                    <span class="glyphicon glyphicon-pencil"></span>
                    按部门导出excel
                </button>
            </div>
        </div>--%>


        <%--------------------------------------------------------------------------------------------------%>
<div style="background-color: #66F4DF">

    <button onclick="addMember()" type="button" class="btn  btn-warning" >
    <span class="glyphicon glyphicon-plus"></span>新增
   </button>
  </div>
        <table id="memberTable" class="table table-striped table-bordered" style="width:100%">
            <thead>
            <tr>
                <th>全选反选</th>
                <th>编号</th>
                <th>用户名</th>
                <th>会员头像</th>
                <th>电话</th>
                <th>邮箱</th>
                <th>生日</th>
                <th>注册时间</th>
                <th>地址</th>
                <th>操作</th>


            </tr>
            </thead>
            <tfoot>
            <tr>
                <th>全选反选</th>
                <th>编号</th>
                <th>用户名</th>
                <th>会员头像</th>
                <th>电话</th>
                <th>邮箱</th>
                <th>生日</th>
                <th>注册时间</th>
                <th>操作</th>

            </tr>
            </tfoot>
        </table>
    </div>

</div>

<%--树隐藏div--%>



<%--
<div class="content_wrap">
    <div class="zTreeDemoBackground left" id="TreeDiv">
        <ul id="areaTree" class="ztree"></ul>
    </div>
</div>


<div >
    <form id="deptUser" method="post">
        <input type="text" name="sheetName"/>
        <input type="text" name="cellIds"/>

    </form>

</div>
--%>

<%--会员隐藏form--%>
<%--<div class="container-fluid" id="addMemberFormDiv" style="display: none">

    <div class="row">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title">会员注册</h3>
            </div>

            <div class="panel-body">

                <form class="form-horizontal">
                    <div class="form-group">
                        <input type="hidden" class="form-control" id="memberInfoId" >
                        <label class="col-sm-2 control-label">会员名称</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="memberName" placeholder="会员名称">
                        </div>
                    </div>

                  &lt;%&ndash;  <div class="form-group">
                        <label  class="col-sm-2 control-label">密码</label>
                        <div class="col-md-6">
                            <input type="password" class="form-control" id="password" placeholder="Password">
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">确认密码</label>
                        <div class="col-md-6">
                            <input type="password" class="form-control" id="ConfirmPassword" placeholder="确认密码">
                        </div>
                    </div>&ndash;%&gt;



                    <div class="form-group">
                        <label  class="col-sm-2 control-label">邮箱</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="email" placeholder="email">
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">出生日期</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control form_datetime" id="birthday" placeholder="出生日期">
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">密码</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control form_datetime" id="password" placeholder="密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">确认密码</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control form_datetime" id="confirmPassword" placeholder="确认密码">
                        </div>
                    </div>



                    <div class="form-group">
                        <label  class="col-sm-2 control-label">手机号码</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="phone" placeholder="手机号码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">图片添加</label>

                        <div class="col-md-8">
                            &lt;%&ndash; <div class="col-md-10" id="headerImageDiv"></div>&ndash;%&gt;
                            <!--=====================================-->
                            <div class="col-md-10">
                                <input id="file" name="uploadfile" type="file" value="上传" multiple/>
                                <input id="ImgPath" name="ImgPath">
                                <p class="help-block">支持jpg、jpeg、png、gif,txt,"docx","zip","xlsx"格式，大小没限制</p>
                            </div>
                            <!--=====================================-->

                        </div>
                        <div class="col-md-1"> <button onclick="addInputFile()" class="btn btn-group-lg  " type="button"><span class="glyphicon glyphicon-hand-down"></span></button></div>
                    </div>



                    <div class="form-group" >
                        <label  class="col-sm-2 control-label">地址</label>

                        <div  id="areaDIV">
                        <div class="col-sm-7">
                           <input type="hidden"   id="addressIds" >
                           <label  class="col-sm-7 control-label" id="address"> </label>
                        </div>
                        <div class="col-sm-1" >
                            <button type="button" onclick="initCity(1)" class="btn btn-xs btn-success">
                                <span class="glyphicon glyphicon-pencil"></span>
                                更新地址
                            </button>
                        </div>
                        <!--   <div class="col-md-1"  >
                              <select class="form-control"  onchange="initCity(id,this)">
                               <option value="-1">=选择=</option>
                              </select>
                           </div>-->
                        <!--<div class="col-md-1">
                            <select class="form-control" id="shiid">
                                <option value="-1">=市=</option>

                            </select>
                        </div>

                        <div class="col-md-1">
                            <select class="form-control" id="xianid">
                                <option value="-1">=县=</option>
                            </select>
                        </div>
    --></div>
                    </div>






                    <div class="form-group">
                        <div class="col-sm-offset-2 col-md-6">
                            <div class="checkbox">
                                <label>


                                    <button type="reset"  class="btn   btn-warning">
                                        <span class="glyphicon glyphicon-repeat"></span>重置
                                    </button>
                                </label>
                            </div>
                        </div>
                    </div>




                    <div class="form-group">
                        <div class="col-sm-offset-2 col-md-4">
                            <div class="checkbox">
                                <label>
                                    <!-- <input id="debugId" name="debugId" hidden="true" /> &lt;!&ndash; 文件上传额外参数 &ndash;&gt;

                                     <input id="fileInput" name="files" multiple type="file" class="file" value=""/>-->

                                </label>
                            </div>
                        </div>
                    </div>


                    <!--=====================================-->

                    <!--=====================================-->

                </form>




            </div>
        </div>
    </div>



</div>--%>

<div class="container-fluid" id="UpdateMemberFormDiv" style="display: none">

    <div class="row">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title">会员注册</h3>
            </div>

            <div class="panel-body">

                <form class="form-horizontal">
                    <div class="form-group">
                        <input type="hidden" class="form-control" id="memberInfoId" >
                        <label class="col-sm-2 control-label">会员名称</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="memberName" placeholder="会员名称">
                        </div>
                    </div>

                    <%--  <div class="form-group">
                          <label  class="col-sm-2 control-label">密码</label>
                          <div class="col-md-6">
                              <input type="password" class="form-control" id="password" placeholder="Password">
                          </div>
                      </div>

                      <div class="form-group">
                          <label  class="col-sm-2 control-label">确认密码</label>
                          <div class="col-md-6">
                              <input type="password" class="form-control" id="ConfirmPassword" placeholder="确认密码">
                          </div>
                      </div>--%>



                    <div class="form-group">
                        <label  class="col-sm-2 control-label">邮箱</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="email" placeholder="email">
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">出生日期</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control form_datetime" id="birthday" placeholder="出生日期">
                        </div>
                    </div>


                    <div id="password-div"></div>




                    <div class="form-group">
                        <label  class="col-sm-2 control-label">手机号码</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="phone" placeholder="手机号码">
                        </div>
                    </div>


                    <%-- 图片展示--%>
                    <div class="form-group" id="headerImageDiv"></div>

                    <div class="form-group">
                        <label class="col-md-2 control-label">图片添加</label>

                        <div class="col-md-8">
                            <%-- <div class="col-md-10" id="headerImageDiv"></div>--%>
                            <!--=====================================-->
                            <div class="col-md-10">
                                <input id="file" name="uploadfile" type="file" value="上传" multiple/>
                              <%--  图片新路径--%>
                                <input id="ImgPath" name="ImgPath">
                             <%--   图片原始路径--%>
                                <input id="headImageMember">
                                <p class="help-block">支持jpg、jpeg、png、gif,txt,"docx","zip","xlsx"格式，大小没限制</p>
                            </div>
                            <!--=====================================-->

                        </div>
                        <div class="col-md-1"> <button onclick="addInputFile()" class="btn btn-group-lg  " type="button"><span class="glyphicon glyphicon-hand-down"></span></button></div>
                    </div>



                    <div class="form-group" >
                        <label  class="col-sm-2 control-label">地址</label>

                        <div  id="areaDIV">
                            <div class="col-sm-7">
                                <input type="hidden"   id="addressIds" >
                                <label  class="col-sm-7 control-label" id="address"> </label>
                            </div>
                            <div class="col-sm-1" >
                                <button type="button" onclick="initCity(1)" class="btn btn-xs btn-success">
                                    <span class="glyphicon glyphicon-pencil"></span>
                                    更新地址
                                </button>
                            </div>
                            <!--   <div class="col-md-1"  >
                                  <select class="form-control"  onchange="initCity(id,this)">
                                   <option value="-1">=选择=</option>
                                  </select>
                               </div>-->
                            <!--<div class="col-md-1">
                                <select class="form-control" id="shiid">
                                    <option value="-1">=市=</option>

                                </select>
                            </div>

                            <div class="col-md-1">
                                <select class="form-control" id="xianid">
                                    <option value="-1">=县=</option>
                                </select>
                            </div>
        --></div>
                    </div>






                    <div class="form-group">
                        <div class="col-sm-offset-2 col-md-6">
                            <div class="checkbox">
                                <label>


                                    <button type="reset"  class="btn   btn-warning">
                                        <span class="glyphicon glyphicon-repeat"></span>重置
                                    </button>
                                </label>
                            </div>
                        </div>
                    </div>




                    <div class="form-group">
                        <div class="col-sm-offset-2 col-md-4">
                            <div class="checkbox">
                                <label>
                                    <!-- <input id="debugId" name="debugId" hidden="true" /> &lt;!&ndash; 文件上传额外参数 &ndash;&gt;

                                     <input id="fileInput" name="files" multiple type="file" class="file" value=""/>-->

                                </label>
                            </div>
                        </div>
                    </div>


                    <!--=====================================-->

                    <!--=====================================-->

                </form>




            </div>
        </div>
    </div>



</div>


<div id="passwordContentDiv">
    <div class="form-group">
        <label  class="col-sm-2 control-label">密码</label>
        <div class="col-md-6">
            <input type="text" class="form-control form_datetime" id="password" placeholder="密码">
        </div>
    </div>
    <div class="form-group">
        <label  class="col-sm-2 control-label">确认密码</label>
        <div class="col-md-6">
            <input type="text" class="form-control form_datetime" id="confirmPassword" placeholder="确认密码">
        </div>
    </div>
</div>

<%--------------------------------------------------------------------------------------------------%>

<jsp:include page="/WEB-INF/common/jsReference.jsp"></jsp:include>
<script>

    $(function () {
        seach();
        initDate();
       // areaZTree();
        //initCity(1);
        initArea(1);
    })

    function initFileInput(obj) {

        $("#file",obj).fileinput({
            //初始化上传文件框
            language: "zh",//配置语言
            showUpload : true, //显示整体上传的按钮
            showRemove : true,//显示整体删除的按钮
            uploadAsync: true,//默认异步上传
            uploadLabel: "上传",//设置整体上传按钮的汉字
            removeLabel: "移除",//设置整体删除按钮的汉字
            uploadClass: "btn btn-primary",//设置上传按钮样式
            showCaption: true,//是否显示标题
            dropZoneEnabled: false,//是否显示拖拽区域
            uploadUrl: "<%=request.getContextPath()%>/file/uploadFile.jhtml",//这个是配置上传调取的后台地址，本项目是SSM搭建的
            maxFileSize : 2000,//文件大小限制
            maxFileCount: 10,//允许最大上传数，可以多个，
            enctype: 'multipart/form-data',
            allowedFileExtensions : ["jpg", "png","gif","docx","zip","xlsx","txt"],/*上传文件格式限制*/
            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
            showBrowse: true,
            browseOnZoneClick: true,
        }).on("fileuploaded", function (event, data, previewId, index) {
            console.log(data);
            $("#ImgPath",obj).val(data.response.msg);
        });

    }
    function initFileUpdateInput(obj,param) {


        $("#file",obj).fileinput({
            //初始化上传文件框
            language: "zh",//配置语言
            showUpload : true, //显示整体上传的按钮
            showRemove : true,//显示整体删除的按钮
            uploadAsync: true,//默认异步上传
            uploadLabel: "上传",//设置整体上传按钮的汉字
            removeLabel: "移除",//设置整体删除按钮的汉字
            initialPreviewAsData: true,//回显
            initialPreview: param,
            uploadClass: "btn btn-primary",//设置上传按钮样式
            showCaption: true,//是否显示标题
            dropZoneEnabled: false,//是否显示拖拽区域
            uploadUrl: "<%=request.getContextPath()%>/file/uploadFile.jhtml",//这个是配置上传调取的后台地址，本项目是SSM搭建的
            maxFileSize : 2000,//文件大小限制
            maxFileCount: 10,//允许最大上传数，可以多个，
            enctype: 'multipart/form-data',
            allowedFileExtensions : ["jpg", "png","gif","docx","zip","xlsx","txt"],/*上传文件格式限制*/
            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
            showBrowse: true,
            browseOnZoneClick: true,
        }).on("fileuploaded", function (event, data, previewId, index) {
            console.log(data);
            $("#ImgPath",obj).val(data.response.msg);
        });

    }




//会员修改
    var  dialog_dept
    function toUpdateMember(memberId) {
       // alert(id)
        var v_source_form=$("#UpdateMemberFormDiv form").clone()
    dialog_dept = bootbox.dialog({
            title: '用户修改',
            message: v_source_form,//获取隐藏表单
            size: 'middle',
            buttons: {
                cancel: {
                    label: "取消",
                    className: 'btn-danger',
                    callback: function () {

                    }
                },

                ok: {
                    label: "确定",
                    className: 'btn-info',
                    callback: function () {
                        var param={};
                        param.id=$("#memberInfoId",dialog_dept).val();
                        param.userName=$("#memberName",dialog_dept).val();
                        param.phone=$("#phone",dialog_dept).val();
                        param.email=$("#email",dialog_dept).val();
                        param.birthday=$("#birthday",dialog_dept).val();


                        param.address=$("#address",dialog_dept).text();
                        param.addressIds=$("#addressIds",dialog_dept).val();

                        //判断span中是否有地址
                        if(param.address==""||param.address==null){



                        var address=""
                        var addressIds=""
                        $("select[name='areaId']").each(function () {
                            if(this.options[this.selectedIndex].value!=-1){

                            address+= this.options[this.selectedIndex].text+","
                            addressIds+=this.options[this.selectedIndex].value+","
                            }
                        })

                            param.address=address
                            param.addressIds=addressIds
                        }

                        param.newHeadImage=$("#ImgPath",dialog_dept).val()
                        param.headImage=$("#headImageMember",dialog_dept).val()

                        console.log(address)



                        $.ajax({
                            type: "post",
                            url: "/member/updateMemberInfo.jhtml",
                            //url:"http://192.168.1.62:8082/api/member/addNewMember.jhtml",

                            data: param,
                            success: function (result) {
                                console.log(result);
                                if (result.code == 200) {
                                    query()
                                } else {
                                    bootbox.alert("<span class='glyphicon glyphicon-bell'></span> " + result.msg, function () {
                                    })
                                }


                            }
                        })


                    }
                }





            }


        });

        var  paramHeadImage=[]
        //回显
        $.ajax({
            type: "post",
            url: "<%=request.getContextPath()%>/member/toUpdateMember.jhtml",
            data: {
                "id":memberId },

            success: function (result) {
                console.log(result)
                if (result.code == 200) {
                    $("#memberInfoId",dialog_dept).val(result.data.id)
                   $("#memberName",dialog_dept).val(result.data.userName)
                    $("#phone",dialog_dept).val(result.data.phone)
                    $("#birthday",dialog_dept).val(result.data.birthday)
                    $("#email",dialog_dept).val(result.data.email)
                    $("#address",dialog_dept).html(result.data.address)
                    $("#addressIds",dialog_dept).val(result.data.addressIds)
                    $("#headImageMember",dialog_dept).val(result.data.headImage)

                    paramHeadImage.push(result.data.headImage)
                    initFileUpdateInput(dialog_dept,paramHeadImage);


                }
            }

        })




    }

    //会员添加
    function addMember(memberId) {
        // alert(id)
        var v_source_form=$("#UpdateMemberFormDiv form").clone()
        dialog_dept = bootbox.dialog({
            title: '用户修改',
            message: v_source_form,//获取隐藏表单
            size: 'middle',
            buttons: {
                cancel: {
                    label: "取消",
                    className: 'btn-danger',
                    callback: function () {

                    }
                },

                ok: {
                    label: "确定",
                    className: 'btn-info',
                    callback: function () {
                        var param={};
                        param.id=$("#memberInfoId",dialog_dept).val();
                        param.userName=$("#memberName",dialog_dept).val();
                        param.phone=$("#phone",dialog_dept).val();
                        param.email=$("#email",dialog_dept).val();
                        param.birthday=$("#birthday",dialog_dept).val();
                        // param.phoneCode=$("#phoneCode").val();



                        ////名称
                        /*var shengName=$("option[value='"+ param.shengid+"']").text();
                        var shiName=$("option[value='"+ param.shiid+"']").html();
                        var xianName=$("option[value='"+ param.xianid+"']").text();*/
                        param.address=$("#address",dialog_dept).text();
                        param.addressIds=$("#addressIds",dialog_dept).val();

                        //判断span中是否有地址
                        if(param.address==""||param.address==null){



                            var address=""
                            var addressIds=""
                            $("select[name='areaId']").each(function () {
                                if(this.options[this.selectedIndex].value!=-1){

                                    address+= this.options[this.selectedIndex].text+","
                                    addressIds+=this.options[this.selectedIndex].value+","
                                }
                            })

                            param.address=address
                            param.addressIds=addressIds
                        }

                            param.headImage=$("#ImgPath",dialog_dept).val()


                        console.log(address)

                        $.ajax({
                            type: "post",
                            url: "/member/addMemberInfo.jhtml",
                            //url:"http://192.168.1.62:8082/api/member/addNewMember.jhtml",

                            data: param,
                            success: function (result) {
                                console.log(result);
                                if (result.code == 200) {
                                    query()
                                } else {
                                    bootbox.alert("<span class='glyphicon glyphicon-bell'></span> " + result.msg, function () {
                                    })
                                }


                            }
                        })




                    }
                }





            }


        });

        initFileInput(dialog_dept);
        var passwordContentDiv=   $("#passwordContentDiv").html()
        $("#password-div",dialog_dept).html(passwordContentDiv)



       /* $.ajax({
            type: "post",
            url: "<%=request.getContextPath()%>/member/toUpdateMember.jhtml",
            data: {
                "id":memberId },

            success: function (result) {
                console.log(result)
                if (result.code == 200) {
                    $("#memberInfoId",dialog_dept).val(result.data.id)
                    $("#memberName",dialog_dept).val(result.data.userName)
                    $("#phone",dialog_dept).val(result.data.phone)
                    $("#birthday",dialog_dept).val(result.data.birthday)
                    $("#email",dialog_dept).val(result.data.email)
                    $("#address",dialog_dept).html(result.data.address)
                    $("#addressIds",dialog_dept).val(result.data.addressIds)


                }
            }

        })*/




    }


    function initCity(id,obj) {
        if(id==1){
        $("#areaDIV",dialog_dept).html("")
        }
        $.ajax({

            type:"post",
            url:"/area/findCityList.jhtml",
            data:{"id":id},
            success:function (result) {

                console.log(result)
                if(result.code==200){

                    v_item=result.data

                    if(obj){
                        $(obj).parent().nextAll().remove()

                    }
                    if(result.data.length==0){
                        return;
                    }

                    var v_select="<div class=\"col-md-3\"  >\n" +
                        " <select class=\"form-control\" name='areaId' onchange=\"initCity(this.value,this)\">\n" +
                        "<option value=\"-1\">=选择=</option>"
                    for (var i = 0; i < v_item.length; i++) {
                        v_select+="<option value='"+v_item[i].id+"'>"+v_item[i].cityName+"</option>"

                    }
                    v_select+="</select>\n" +"</div>"
                    $("#areaDIV",dialog_dept).append(v_select)


                }
            }
        })


    }
    function initArea(id,obj) {

        $.ajax({

            type:"post",
            url:"/area/findCityList.jhtml",
            data:{"id":id},
            success:function (result) {

                console.log(result)
                if(result.code==200){
                    v_item=result.data

                    if(obj){
                        $(obj).parent().nextAll().remove()

                    }
                    if(result.data.length==0){
                        return;
                    }

                    var v_select="<div class=\"col-md-3\"  >\n" +
                        " <select class=\"form-control\" name='areaId' onchange=\"initArea(this.value,this)\">\n" +
                        "<option value=\"-1\">=选择=</option>"
                    for (var i = 0; i < v_item.length; i++) {
                        v_select+="<option value='"+v_item[i].id+"'>"+v_item[i].cityName+"</option>"

                    }
                    v_select+="</select>\n" +"</div>"
                    $("#areaDIVByQuery").append(v_select)


                }
            }
        })


    }




    //时间格式转换
    function initDate(){
        $(".form_datetime").datetimepicker({
            language: "zh-CN",
            format: "yyyy-mm-dd",
            showClean: true

        });
    }



    /*模糊查询*/
    function query() {
        var param = {};
        param.userName = $("#userName").val();
        param.minBirthday = $("#minBirthday").val()
        param.maxBirthday = $("#maxBirthday").val()

       /* param.shengid=$("#shengid").val();
        param.shiid=$("#shiid").val();
        param.xianid=$("#xianid").val();*/

       var addressIds=""
        $("select[name='areaId']").each(function () {
            if(this.options[this.selectedIndex].value!=-1){
                addressIds+=this.options[this.selectedIndex].value+","
            }
        })
        console.log(addressIds)
        param.addressIds=addressIds;
        memberTable.settings()[0].ajax.data = param;
        memberTable.ajax.reload();
    }


    var memberTable;

    function seach() {
        memberTable = $("#memberTable").DataTable({
            //所有禁用排序
            /*order: false,
            // 排序
            columnDefs: [{
                'targets': [0, 1, 3, 4, 5, 8],
                'orderable': false
            }],
*/

            ///回调函数
           /* "fnDrawCallback": function (oSettings) {
                console.log(oSettings);
                initCheckbox();

            },
*/

            //汉化
            language: {
                url: "/DataTables/Chinese.json"
            },


            "lengthMenu": [5, 10, 15],
            "bFilter": false,
            "processing": true,
            "serverSide": true,
            "ajax": {
                "url": "<%=request.getContextPath()%>/member/findMemberList.jhtml",
                "type": "POST",
                "dataSrc": function (result) {
                    if (result.code==200) {
                        result.draw=result.data.draw;
                        result.recordsFiltered=result.data.recordsFiltered;
                        result.recordsTotal=result.data.recordsTotal;
                        return result.data.data;
                    }

                }

            },


            "columns": [
                {
                    "data": "id",
                    //复选框
                    render: function (data, type, row, meta) {
                        return "<input type='checkbox' value='" + data + "' id='singleCheckbox' name='checkboxSingle'  >";
                    }
                },

                {"data": "id"},
                {"data": "userName"},
                {
                    "data": "headImage",
                    //复选框
                    render: function (data, type, row, meta) {
                        return "<img src='" + data + "'  width='100px'  >";
                    }
                },


                {"data": "phone"},
                {"data": "email"},


                {"data": "birthday"},
                {"data": "regTime"},
                {"data": "address"},

                {"data": "id",
                    render: function (data, type, row, meta) {
                        return "<button type=\"reset\" onclick='toUpdateMember("+data+")' class=\"btn   btn-primary\">\n" +
                            "<span class=\"glyphicon glyphicon-pencil\"></span>修改\n" +
                            " </button>";
                    }
                },



            ],


        });
    }


</script>
</body>
</html>
