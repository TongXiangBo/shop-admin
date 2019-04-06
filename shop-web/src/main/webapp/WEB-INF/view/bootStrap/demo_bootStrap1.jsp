<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        body {padding-top:55px;}




    </style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">

            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#" id="menu-toggle">
                金科教育
            </a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">校园风采 <span class="sr-only">(current)</span></a></li>
                <li><a href="#">师资团队</a></li>
                <li><a href="#">明星学员</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">java课程 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">云计算</a></li>
                        <li><a href="#">云应用</a></li>
                        <li><a href="#">云服务</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">大数据</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">数据挖掘</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>




<div class="container-fluid">
    <div class="row">
        <div class="col-sm-4" >
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" >
                <div class="panel panel-default" style="margin:0;">

                    <div class="panel-heading">
                        <a href="#userMeun"   data-toggle="collapse">
                            <i class="icon-user-md icon-large"></i> 用户管理</a>
                    </div>



                    <ul id="userMeun" data-parent="#accordion" class="nav collapse">
                        <li class="active"><a href="#"><i class="icon-user"></i> 增加用户</a></li>
                        <li><a href="#"><i class="icon-edit"></i> 修改用户</a></li>
                        <li><a href="#"><i class="icon-trash"></i> 删除用户</a></li>
                        <li><a href="#"><i class="icon-list"></i> 用户列表</a></li>

                    </ul>
                </div>

                <div class="panel panel-default" style="margin:0;">

                    <div class="panel-heading">
                        <a href="#userMeun2"  data-parent="#accordion" data-toggle="collapse"><i class="icon-user-md icon-large"></i> 学生管理</a>
                    </div>

                    <ul id="userMeun2" class="nav collapse">
                        <li><a href="#"><i class="icon-user"></i> 增加用户</a></li>
                        <li><a href="#"><i class="icon-edit"></i> 修改用户</a></li>
                        <li><a href="#"><i class="icon-trash"></i> 删除用户</a></li>
                        <li><a href="#"><i class="icon-list"></i> 用户列表</a></li>

                    </ul>
                </div>

                <div class="panel panel-default" style="margin:0;">
                    <div class="panel-heading">
                        <a href="#userMeun3"  data-parent="#accordion" data-toggle="collapse"><i class="icon-user-md icon-large"></i> 学生管理3</a>
                    </div>

                    <ul id="userMeun3" class="nav collapse">
                        <li><a href="#"><i class="icon-user"></i> 增加用户</a></li>
                        <li><a href="#"><i class="icon-edit"></i> 修改用户</a></li>
                        <li><a href="#"><i class="icon-trash"></i> 删除用户</a></li>
                        <li><a href="#"><i class="icon-list"></i> 用户列表</a></li>

                    </ul>
                </div>
            </div>
        </div>









        <div class="col-sm-8">

            <form class="form-horizontal" role="form">
                <fieldset>
                    <legend>配置数据源</legend>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="ds_host">主机名</label>
                        <div class="col-sm-4">
                            <input class="form-control" id="ds_host" type="text" placeholder="192.168.1.161"/>
                        </div>
                        <label class="col-sm-2 control-label" for="ds_name">数据库名</label>
                        <div class="col-sm-4">
                            <input class="form-control" id="ds_name" type="text" placeholder="msh"/>
                        </div>


                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="ds_username">用户名</label>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <input type="text" class="input-sm form-control" name="start" />
                                <span class="input-group-addon">
									<i class="glyphicon glyphicon-calendar"></i>
									</span>
                                <input type="text" class="input-sm form-control" name="end" />
                            </div>
                        </div>
                        <label class="col-sm-2 control-label" for="ds_password">密码</label>
                        <div class="col-sm-4">
                            <input class="form-control" id="ds_password" type="password" placeholder="123456"/>
                        </div>
                    </div>
                </fieldset>

                <div class="clearfix form-actions" style="text-align:center">

                    <button class="btn btn-primary" type="button">
                        <i class="glyphicon glyphicon-ok"></i>
                        Submit
                    </button>
                    <button class="btn btn-default" type="reset">
                        <i class="glyphicon glyphicon-refresh"></i>
                        Reset
                    </button>

                </div>
            </form>
            <br/>
            <div style="background:#d8d8d8;text-align:right;">
                <button type="button" class="btn btn-info">
                    <span class="glyphicon glyphicon-plus"></span>
                    添加用户</button>

                <button type="button" class="btn btn-danger">
                    <span class="glyphicon glyphicon-remove"></span>
                    批量删除</button>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading ">
                    用户列表
                </div>

                <div class="table-responsive">

                    <table class="table table-hover table-bordered">
                        <thead>
                        <tr>
                            <th>选择</th>
                            <th>用户名</th>
                            <th>年龄</th>
                            <th>籍贯</th>
                            <th>职位</th>
                            <th>学历</th>
                            <th>公司</th>
                            <th>电话</th>
                            <th>邮箱</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>20</td>
                            <td>男</td>
                            <td>张三</td>
                            <td>20</td>
                            <td>男</td>
                            <td>张三</td>
                            <td>20</td>
                            <td>男</td>
                            <td>
                                <div class="btn-group">


                                    <button class="btn btn-xs btn-info ">
                                        <span class="glyphicon glyphicon-pencil"></span>
                                        修改
                                    </button>

                                    <button class="btn btn-xs btn-danger">
                                        <span class="glyphicon glyphicon-remove"></span>
                                        删除
                                    </button>


                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>20</td>
                            <td>男</td>
                            <td>张三</td>
                            <td>20</td>
                            <td>男</td>
                            <td>张三</td>
                            <td>20</td>
                            <td>男</td>
                            <td>
                                <div class="btn-group">


                                    <button class="btn btn-xs btn-info ">
                                        <span class="glyphicon glyphicon-pencil"></span>
                                        修改
                                    </button>

                                    <button class="btn btn-xs btn-danger">
                                        <span class="glyphicon glyphicon-remove"></span>
                                        删除
                                    </button>


                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>20</td>
                            <td>男</td>
                            <td>张三</td>
                            <td>20</td>
                            <td>男</td>
                            <td>张三</td>
                            <td>20</td>
                            <td>男</td>
                            <td>
                                <div class="btn-group">


                                    <button class="btn btn-xs btn-info ">
                                        <span class="glyphicon glyphicon-pencil"></span>
                                        修改
                                    </button>

                                    <button class="btn btn-xs btn-danger">
                                        <span class="glyphicon glyphicon-remove"></span>
                                        删除
                                    </button>


                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>20</td>
                            <td>男</td>
                            <td>张三</td>
                            <td>20</td>
                            <td>男</td>
                            <td>张三</td>
                            <td>20</td>
                            <td>男</td>
                            <td>
                                <div class="btn-group">


                                    <button class="btn btn-xs btn-info ">
                                        <span class="glyphicon glyphicon-pencil"></span>
                                        修改
                                    </button>

                                    <button class="btn btn-xs btn-danger">
                                        <span class="glyphicon glyphicon-remove"></span>
                                        删除
                                    </button>


                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>20</td>
                            <td>男</td>
                            <td>张三</td>
                            <td>20</td>
                            <td>男</td>
                            <td>张三</td>
                            <td>20</td>
                            <td>男</td>
                            <td>
                                <div class="btn-group">


                                    <button class="btn btn-xs btn-info ">
                                        <span class="glyphicon glyphicon-pencil"></span>
                                        修改
                                    </button>

                                    <button class="btn btn-xs btn-danger">
                                        <span class="glyphicon glyphicon-remove"></span>
                                        删除
                                    </button>


                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <nav>
                        <ul class="pagination">
                            <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
                            <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">6</a></li>
                        </ul>
                    </nav>

                </div>


            </div>
        </div>
    </div>
</div>









<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<%=request.getContextPath()%>/js/jquery-1.7.2.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>

<script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
</script>
</body>
</html>