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
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/brandSelect.js"></script>
</head>
<body>


<div style="margin-left: 280px"><h1>品牌修改</h1></div>
<div class="container-fluid" >

    <div class="row">

        <div class="col-sm-8" id="bodyDiv" style="float: left;width: 100%">

            <form class="form-horizontal" role="form" action="<%=request.getContextPath()%>/brand/updateBrand.jhtml" method="post" enctype="multipart/form-data" >
                <fieldset>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="ds_host">品牌名称</label>
                        <div class="col-sm-4">
                            <input name="productName" class="form-control" id="ds_host" type="text" placeholder="品牌名称">
                        </div>
                    </div>



                    <%--
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">图片添加</label>
                                            <div class="col-sm-4">
                                                <button class="btn btn-group-lg" type="button"> <input name="brandImageName"  type="file" placeholder="图片添加"></button>
                                            </div>
                                            <div class="col-md-3"> <button onclick="addInputFile()" class="btn btn-group-lg  " type="button"><span class="glyphicon glyphicon-hand-down"></span></button></div>
                                        </div>--%>

                    <%--<div class="form-group">
                        <label class="col-sm-2 control-label">品牌添加</label>
                        <div class="col-sm-4">
                            <select name="brand.id" id="brandSelect" class="form-control">
                                <option value="-1">---请选择---</option>
                            </select>
                        </div>
                    </div>--%>


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




                <input type="hidden" name="id" value="${brand.id}"/><br>
                <input type="hidden" name="brandImagePath" value="${brand.brandImagePath}"/><br>

            </form>




        </div>
    </div>
</div>


</body>
</html>