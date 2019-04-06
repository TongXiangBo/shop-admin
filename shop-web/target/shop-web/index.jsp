<html>
<body>
<h2>Hello World!</h2>
</body>
</html>


"ajax":function(data,callback,settings) {
//参数封装
var param = {};
param.draw = data.draw;
param.limit = data.length;//页面显示记录条数，在页面显示每页显示多少项的时候
param.start = data.start;//开始的记录序号
param.page = (data.start / data.length)+1;
param.filter = data.search.value;//过滤条件
// alert(JSON.stringify(data));
alert(JSON.stringify(data.order))
//单排序条件
/* if(data.order) {
if(data.order[0].dir) {
param.order = "releaseTime" + " " + data.order[0].dir;
}
} */
//多排序条件
param.order = " ";
if(data.order) {
$.each(data.order,function(index,value){
var col = data.order[index].column;
$.each(data.columns,function(i,v) {
var name = data.columns[i].name;
if(name) {
if(col ==  window.parseInt(name)) {
var arr = name.split("_");
param.order += arr[1] + " " + data.order[index].dir + ",";
}
}
})
})
}
param.order= param.order.substring(0,param.order.length-1);
$.ajax({
type:"POST",
url:"${pageContext.request.contextPath}/newsController/getAllNews.action",
data:param,
cache:false,
dataType:"json",
success:function(result) {
var returnData = {};
returnData.draw = result.draw;//个人感觉这里直接写data.draw也可以
returnData.recordsTotal = result.recordsTotal;//返回数据全部记录
returnData.recordsFiltered = result.recordsFiltered;//后台不实现过滤功能，每次查询均视作全部结果
returnData.data = result.data;//返回的数据列表
//更改时间格式
for(var i=0;i<result.data.length; i++) {
result.data[i].releaseTime = new Date(result.data[i].releaseTime).toLocaleDateString();
}
//回调函数(数据渲染)
callback(returnData);
},
error:function(ajax,textStatus) {
/*  alert(JSON.stringify(ajax));
alert(textStatus); */
alert("未找到数据");
}
})
},