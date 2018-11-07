<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Complex Layout - jQuery EasyUI Demo</title>
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="easyui/demo.css">
	<script type="text/javascript" src="easyui/js/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<style type="text/css">
        #tt .tabs-panels>.panel>.panel-body {
			overflow: hidden;
		}
		.menus{
			text-decoration: none;
		}
	</style>
	<script type="text/javascript">
	function addTab(title, url, iconCls){
		if ($('#tt').tabs('exists', title)){
			$('#tt').tabs('select', title);
		} else {
			var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
			$('#tt').tabs('add',{
				title:title,
				iconCls : iconCls,
				content:content,
				closable:true
			});
		}
	}
	</script>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true,border:false">
		<div data-options="region:'north'" style="height:75px;background: #E0ECFF;">
			<h1 style="font: italic 2em Georgia, serif;">&nbsp;NORTH<font size="2px" color="#5F6368">&nbsp;ZhuXueLiang</font></h1>
		</div>
		<div data-options="region:'west',split:true,iconCls:'icon-home'" title="West" style="width:200px;">
			<div class="easyui-accordion" data-options="fit:true,border:false">
				<div title="Title1" data-options="iconCls:'icon-edit-page'" style="padding:10px;">
					<a href="#" class="menus" onclick="addTab('content1','modular/content1.jsp','icon-edit-page')">content1</a>
				</div>
				<div title="Title2" data-options="iconCls:'icon-favorite'" style="padding:10px;">
					<a href="#" class="menus" onclick="addTab('content2','modular/content2.jsp','icon-favorite')">content2</a>
				</div>
				<div title="Title3" data-options="iconCls:'icon-american'" style="padding:10px">
					<a href="#" class="menus" onclick="addTab('content3','modular/content3.jsp','icon-american')">content3</a>
				</div>
				<div title="Title4" data-options="iconCls:'icon-add-item'" style="padding:10px">
					<a href="#" class="menus" onclick="addTab('content4','modular/content4.jsp','icon-add-item')">content4</a>
				</div>
				<div title="Title5" data-options="iconCls:'icon-master',selected:true" style="padding:10px">
					<a href="#" class="menus" onclick="addTab('content5','modular/content5.jsp','icon-master')">content5</a>
				</div>
			</div>
		</div>
		<div data-options="region:'center',title:'',iconCls:''">
			<div id="tt" class="easyui-tabs" data-options="fit:true,border:false">
			    <div title="Tab1" data-options="iconCls:'icon-home-page'" style="padding:20px;display:none;">
					<h1 style="color:#666666">WELCOME</h1>
			    </div>
			</div>
		</div>
	</div>
</body>
</html>