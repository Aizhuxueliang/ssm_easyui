<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Client Side Pagination in DataGrid - jQuery EasyUI Demo</title>
	<link rel="stylesheet" type="text/css" href="../easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="../easyui/demo.css">
	<script type="text/javascript" src="../easyui/js/jquery.min.js"></script>
	<script type="text/javascript" src="../easyui/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../easyui/locale/easyui-lang-zh_CN.js" charset="utf-8"></script>
	<script type="text/javascript">
	/* 加载表格 */
	$(function(){
		$('#dg').datagrid({
			url:'../list',
			queryParams: {
				names: $("#searchName").val()
			},
		    columns:[[
				{field:'id',title:'编号',width:'5%'},
				{field:'name',title:'姓名',width:'20%'},
				{field:'gender',title:'性别',width:'5%'},
				{field:'email',title:'邮箱',width:'25.55%'},
				{field:'tel',title:'电话',width:'26%'},
				{field:'cla',title:'专业',width:'20%'}
		    ]],
		    striped:true,
		    pagination:true,
		    pageList:[3,5,10],
		    singleSelect:true,
		    fitColumns:true
		});
	});
	/* 链接样式 */
	$(function(){
		$('#btnR').linkbutton({
		    iconCls: 'icon-search',
		    plain: 'true',
		});
		$('#btnR').bind('click', function(){
			var name = $('#searchName').val();
			if(name == ""){
				alert("请先输入姓名后再进行查询");
			} else {
				window.location.reload();
			}
	    });
		$('#btnD').linkbutton({
		    iconCls: 'icon-remove',
		    plain: 'true'
		});
		$('#btnU').linkbutton({
		    iconCls: 'icon-edit',
		    plain: 'true'
		});
		$('#btnC').linkbutton({
		    iconCls: 'icon-add',
		    plain: 'true'
		});
		$('#btnF').linkbutton({
		    iconCls: 'icon-reload',
		    plain: 'true'
		});
		$('#btnF').bind('click', function(){
			$('#searchName').val("");
			window.location.reload();
	    });
		
	});
	/* 删除操作 */	
	function destroyUser(){
		var row = $('#dg').datagrid('getSelected');
		if (row){
			$.messager.confirm('确认信息','确定要删除此用户吗?',function(r){
				if (r){
					$.post('../delete',{id:row.id},function(result){
						if (result){
							$('#dg').datagrid('reload');	// reload the user data
						} else {
							$.messager.show({	// show error message
								title: 'Error',
								msg: result.errorMsg
							});
						}
					},'json');
				}
			});
		} else {
			alert('请先点击你要删除的行');
		}
	}
	/* 打开添加窗口 */
	function newUser(){
		$('#winAdd').dialog('open').dialog('setTitle','添加');
		$('#fmAdd').form('clear');
	}
	/* 保存添加数据 */
	function saveUser(){
		$('#fmAdd').form('submit',{
			url: '../add',
			onSubmit: function(){
				return $(this).form('validate');
			},
			success: function(result){
				var result = eval('('+result+')');
				if (result.errorMsg){
					$.messager.show({
						title: 'Error',
						msg: result.errorMsg
					});
				} else {
					$('#winAdd').dialog('close');		// close the dialog
					$('#dg').datagrid('reload');	// reload the user data
				}
			}
		});
	}
	/* 打开修改窗口 */
	function editUser(){
		var row = $('#dg').datagrid('getSelected');
		if (row){
			$('#winEdit').dialog('open').dialog('setTitle','修改');
			$('#fmEdit').form('load',row);
			url = 'update?id='+row.id;
		} else {
			alert('请先点击你要修改的行');
		}
	}
	
	/* 保存修改数据 */
	function updateUser(){
		$('#fmEdit').form('submit',{
			url: '../update',
			onSubmit: function(){
				return $(this).form('validate');
			},
			success: function(result){
				var result = eval('('+result+')');
				if (result.errorMsg){
					$.messager.show({
						title: 'Error',
						msg: result.errorMsg
					});
				} else {
					$('#winEdit').dialog('close');		// close the dialog
					$('#dg').datagrid('reload');	// reload the user data
				}
			}
		});
	}
	
	    
	</script>
	
</head>
<body>
	<div id="tb" style="padding: 5px; height: auto">
		<div style="margin-bottom: 5px">
			姓名：<input type="text" id="searchName" style="border:1px solid #1D96E8"/>
			<a href="#" id="btnR">搜索</a> 
			<a href="#" id="btnF">刷新</a>	 
			<a href="#" id="btnD" onclick="destroyUser()">删除</a>
			<a href="#" id="btnU" onclick="editUser()">修改</a>
			<a href="#" id="btnC" onclick="newUser()">添加</a>
		</div>
	</div>
	
	<table id="dg">
	</table>
	
	<!-- 添加模块，默认隐藏 -->
	<div id="winAdd" class="easyui-window" title="My Window" style="width:500px;padding:20px 60px"
    	data-options="iconCls:'icon-save',modal:true,closed:true">
    	<form id="fmAdd" method="post">
			<div style="margin-bottom:20px">
				<div>姓名:</div>
				<input class="easyui-textbox" name="name" style="width:100%;height:32px">
			</div>
			<div style="margin-bottom:20px">
				<div>性别:</div>
				<input class="easyui-textbox" name="gender" style="width:100%;height:32px">
			</div>
			<div style="margin-bottom:20px">
				<div>邮箱:</div>
				<input class="easyui-textbox" name="email" style="width:100%;height:32px">
			</div>
			<div style="margin-bottom:20px">
				<div>电话:</div>
				<input class="easyui-textbox" name="tel" style="width:100%;height:32px">
			</div>
			<div style="margin-bottom:20px">
				<div>专业:</div>
				<input class="easyui-textbox" name="cla" style="width:100%;height:32px">
			</div>
		</form>
	    <div id="dlg-buttons">
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="saveUser()">保存</a>
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="javascript:$('#winAdd').dialog('close')">关闭</a>
		</div>
	</div>
	
	<!-- 修改模块，默认隐藏 -->
	<div id="winEdit" class="easyui-window" title="My Window" style="width:500px;padding:20px 60px"
    	data-options="iconCls:'icon-save',modal:true,closed:true">
    	<form id="fmEdit" method="post">
    		<input type="hidden" name="id">
			<div style="margin-bottom:20px">
				<div>姓名:</div>
				<input class="easyui-textbox" name="name" style="width:100%;height:32px">
			</div>
			<div style="margin-bottom:20px">
				<div>性别:</div>
				<input class="easyui-textbox" name="gender" style="width:100%;height:32px">
			</div>
			<div style="margin-bottom:20px">
				<div>邮箱:</div>
				<input class="easyui-textbox" name="email" style="width:100%;height:32px">
			</div>
			<div style="margin-bottom:20px">
				<div>电话:</div>
				<input class="easyui-textbox" name="tel" style="width:100%;height:32px">
			</div>
			<div style="margin-bottom:20px">
				<div>专业:</div>
				<input class="easyui-textbox" name="cla" style="width:100%;height:32px">
			</div>
		</form>
	    <div id="dlg-buttons">
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="updateUser()">保存</a>
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="javascript:$('#winEdit').dialog('close')">关闭</a>
		</div>
	</div>
	
	
</body>
</html>