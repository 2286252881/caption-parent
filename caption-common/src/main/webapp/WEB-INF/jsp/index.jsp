<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../tag.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="${baseurl}/js/ztree/css/demo.css" type="text/css">
	<link rel="stylesheet" href="${baseurl}/js/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="${baseurl}/js/ztree/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="${baseurl}/js/ztree/js/jquery.ztree.core.js"></script>
	<script type="text/javascript" src="${baseurl}/js/ztree/js/jquery.ztree.excheck.js"></script>
<title>Insert title here</title>
</head>
<body>
			<ul id="treeDemo" class="ztree"></ul>
</body>
	<script type="text/javascript">
	var setting = {
			view: {
				selectedMulti: false
			},
			check: {
				enable: true
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				beforeCheck: beforeCheck,
				onCheck: onCheck
			}
		};
		var code, log, className = "dark";
		function beforeCheck(treeId, treeNode) {
			className = (className === "dark" ? "":"dark");
			return (treeNode.doCheck !== false);
		}
		function onCheck(e, treeId, treeNode) {
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			//点击节点时获取所有选中的节点
			var nodes=treeObj.getCheckedNodes(true);
			for(var i=0;i<nodes.length;i++){
	            //alert(nodes[i].id); //弹出选中节点的值
	        }
		}		
		$(document).ready(function(){
			var zNodes=new Array();
			tree_0={
				id:1,
				pId:0,
				name:"权限管理",
				open:true
			}
			zNodes.push(tree_0);
			$.ajax({
				url: "${baseurl}/getMenu.action", 
				success: function(data){
					var ids=data.ids;
					var data=data.menus;
					var flag;
		         	$.each(data,function(d1){
		         		if(data[d1].menus.length>0){
		         			flag=true;
		         		};
		         		var tree={
		         			id:data[d1].id,
		         			pId:data[d1].pid,
		         			name:data[d1].menuName,
		         			open:flag
		         		};
		         		$.each(data[d1].menus,function(d2){
			         		flag=false;
			         		var tree2={
				         			id:data[d1].menus[d2].id,
				         			pId:data[d1].menus[d2].pid,
				         			name:data[d1].menus[d2].menuName,
				         			open:flag
				         		};
			         		$.each(data[d1].menus[d2].menus,function(d3){
			         			var tree3={
					         			id:data[d1].menus[d2].menus[d3].id,
					         			pId:data[d1].menus[d2].menus[d3].pid,
					         			name:data[d1].menus[d2].menus[d3].menuName
					         		};
			         			zNodes.push(tree3);
			         		});
			         		zNodes.push(tree2);
		         		});
		         		zNodes.push(tree);
						$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		         	});
					var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
		         	$.each(ids,function(i){
		         		var node=treeObj.getNodeByParam("id",ids[i]);
		         		if(node!=null){
							treeObj.checkNode(node, true);
		         		}
					});
		      }});
		});
		_submit=function(){
			//提交时获取所有选中的节点
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			var nodes=treeObj.getCheckedNodes(true);
			for(var i=0;i<nodes.length;i++){
	            //alert(nodes[i].id); //弹出选中节点的值
	            console.info(nodes[i].id);
	        }
		}
	</script>
</html>