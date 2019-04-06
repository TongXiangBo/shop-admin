<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/bootstrap-fileInput/css/fileinput.css">




    <title>Insert title here</title>

</head>
<body>


<div style="margin-left: 280px"><h1>品牌添加</h1></div>
<div class="container-fluid" >

    <div class="row">

        <div class="col-sm-8" id="bodyDiv" style="float: left;width: 100%">

            <form class="form-horizontal" role="form" action="<%=request.getContextPath()%>/brand/addBrand.jhtml" method="post" enctype="multipart/form-data" >
                <fieldset>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="ds_host">品牌名称</label>
                        <div class="col-sm-4">
                            <input name="brandName" class="form-control" id="ds_host" type="text" placeholder="品牌名称">
                        </div>
                    </div>




                   <%-- <div class="form-group">
                        <label class="col-sm-2 control-label">图片添加</label>
                        <div class="col-sm-4">
                            <button class="btn btn-group-lg" type="button"> <input name="brandImageName"  type="file" placeholder="图片添加"></button>
                        </div>
                        <div class="col-md-3"> <button onclick="addInputFile()" class="btn btn-group-lg  " type="button"><span class="glyphicon glyphicon-hand-down"></span></button></div>
                    </div>--%>

                <div class="form-group">
                        <label class="col-sm-2 control-label">图片</label>
                        <div class="col-sm-4">
                       <%--  ================= ==============================================--%>
                           <!-- Button trigger modal -->
                           <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                               Launch Modal
                           </button>

                           <!-- Modal -->
                           <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                               <div class="modal-dialog modal-lg" role="document">
                                   <div class="modal-content">
                                       <div class="modal-header">
                                           <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                               <span aria-hidden="true">&times;</span>
                                           </button>
                                       </div>
                                       <div class="modal-body">
                                           <div class="file-loading">
                                               <input id="input-b9" name="input-b9[]" multiple type="file">
                                           </div>
                                           <div id="kartik-file-errors"></div>
                                       </div>
                                       <div class="modal-footer">
                                           <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                           <button type="button" class="btn btn-primary" title="Your custom upload logic">Save</button>
                                       </div>
                                   </div>
                               </div>
                           </div>

                           <div class="form-group">
                               <div class="col-sm-offset-2 col-md-10">
                                   <div class="checkbox">
                                       <label>
                                           <input id="debugId" name="debugId" hidden="true" /> <!-- 文件上传额外参数 -->

                                           <input id="fileInput" name="brandImageName" multiple type="file" class="file" />

                                       </label>
                                   </div>
                               </div>
                           </div>

                       <%--  ============================================= ==============================================--%>
                        </div>
                    </div>



                </fieldset>

                <div class="form-group" >
                    <div class="col-md-offset-3">
                        <button  class="btn btn-success  col-sm-2" type="submit">
                            <i class="glyphicon glyphicon-ok"></i>
                            Submit
                        </button>
                    </div>
                    <div class=" col-md-offset-3">
                        <button class="btn btn-group-lg  col-sm-2" type="reset">
                            <i class="glyphicon glyphicon-refresh"></i>
                            Reset
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
<script src="/js/jquery-1.7.2.js"></script>
<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/bootbox/bootbox.all.min.js"></script>
<script type="text/javascript" src="/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js"></script>
<script src="/bootstrap-fileInput/js/fileinput.min.js"></script>
<script src="/bootstrap-fileInput/js/fileinput_locale_zh.js"></script>

<script>

    //step3：控件回显重新初始化
    // 假设后台信息已经查询完毕！假设为data！！

    $("#fileInput").fileinput('destroy');
    $("#fileInput").fileinput({
        language: 'zh', //设置语言
        uploadUrl:'/api/member/saveFile.jhtml?id='+bugId, //上传的地址
        showUpload: false, //是否显示上传按钮
        showCaption: false,//是否显示标题
        maxFileCount: 6, //表示允许同时上传的最大文件个数
        fileActionSettings:{showUpload: false},//是否显示上文件上的上传按钮
        overwriteInitial: false,
        allowedPreviewTypes: ['image'],
        /*
        ！这里是预览的数据格式
        initialPreview: [
            // IMAGE RAW MARKUP
            'http://localhost:8080/amp/base/imgs/app-default.jpg',
            // IMAGE RAW MARKUP
            'http://localhost:8080/amp/base/imgs/app-default.jpg',
            // TEXT RAW MARKUP
            '123asd啊实打实',
            'http://localhost:8080/amp/base/imgs/123.docx'
        ],*/
        initialPreview : data.initialPreview,
        initialPreviewAsData: true, // allows you to set a raw markup
        initialPreviewFileType: 'image', // image is the default and can be overridden in config below
        initialPreviewDownloadUrl:'/api/member/downFile.do?image={key}',
        /*
        ！这里是回显的数据格式，后台查询后，按照格式展示即可，url是删除访问地址，key是删除的id
        initialPreviewConfig: [
            {type: "image", caption: "Image-1.jpg", size: 847000, url: "/amp/project/delFile.do", key: 1},
            {type: "image", caption: "Image-2.jpg", size: 817000, url: "/amp/project/delFile.do", key: '1519713821098wwp4h8v'},  // set as raw markup
            {type: "text", size: 1430, caption: "LoremIpsum.txt", url: "/amp/project/delFile.do", key: 3},
            {type: "office", size: 102400, caption: "123.docx", url: "/amp/project/delFile.do", key: '1519788281200pwxfx87'}
        ],*/
        initialPreviewConfig : data.initialPreviewConfig,
        preferIconicPreview: true, // this will force thumbnails to display icons for following file extensions
        previewFileIconSettings: { // configure your icon file extensions
            'doc': '<i class="fa fa-file-word-o text-primary"></i>',
            'xls': '<i class="fa fa-file-excel-o text-success"></i>',
            'ppt': '<i class="fa fa-file-powerpoint-o text-danger"></i>',
            'pdf': '<i class="fa fa-file-pdf-o text-danger"></i>',
            'txt': '<i class="fa fa-file-text-o text-info"></i>',
            'zip': '<i class="fa fa-file-archive-o text-muted"></i>',
            'htm': '<i class="fa fa-file-code-o text-info"></i>',
            'mov': '<i class="fa fa-file-movie-o text-warning"></i>',
            'mp3': '<i class="fa fa-file-audio-o text-warning"></i>'
        },
        previewFileExtSettings: { // configure the logic for determining icon file extensions
            'doc': function(ext) {
                return ext.match(/(doc|docx)$/i);
            },
            'xls': function(ext) {
                return ext.match(/(xls|xlsx)$/i);
            },
            'ppt': function(ext) {
                return ext.match(/(ppt|pptx)$/i);
            },
            'zip': function(ext) {
                return ext.match(/(zip|rar|tar|gzip|gz|7z)$/i);
            },
            'htm': function(ext) {
                return ext.match(/(htm|html)$/i);
            },
            'mov': function(ext) {
                return ext.match(/(avi|mpg|mkv|mov|mp4|3gp|webm|wmv)$/i);
            },
            'mp3': function(ext) {
                return ext.match(/(mp3|wav)$/i);
            },
            'txt': function(ext) {
                return ext.match(/(txt|ini|csv|java|php|js|css)$/i);
            }
        },
        layoutTemplates:{
            actionZoom:''
        },
        uploadExtraData: {
            img_key: "1000",
            img_keywords: "happy, nature"
        }
    });

    //动态添加input
 function addFileInput() {
      $("tr[data-image='imageTr']").last().after(' <tr data-image="imageTr">' +
          '<td>选择子图片：</td>' +
          '<td><input type="file" name="brandChildImageName"/> <input type="button" onclick="delFileInput(this)" value="-"/></td> </tr>')
   }
    //动态删除input
    function delFileInput(obj){
       $(obj).parents("tr").remove();
    }

</script>


</body>
</html>