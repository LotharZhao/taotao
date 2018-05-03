<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="${pageContext.request.contextPath}/admin/css/Style1.css" rel="stylesheet" type="text/css" />
		<script language="javascript" src="${pageContext.request.contextPath}/admin/js/public.js"></script>
		<script type="text/javascript">
			function addCategorySecond(){
				window.location.href = "${pageContext.request.contextPath}/adminCategorySecond_addPage.action";
			}
		</script>
	</HEAD>
	<body>
		<br>
		<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3">
						<strong>二级分类列表</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01" align="right">
						<button type="button" id="add" name="add" value="添加" class="button_add" onclick="addCategorySecond()">&#28155;&#21152;</button>

					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all" bordercolor="gray" border="1" id="DataGrid1" style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
								<td align="center" width="3%">
									序号
								</td>
								<td align="center" width="12%">
									二级分类id
								</td>
								<td align="center" width="20%">
									二级分类名称
								</td>
								<td align="center" width="35%">
									二级分类描述
								</td>
								<td align="center" width="20%">
									所属一级分类
								</td>
								<td width="5%" align="center">
									编辑
								</td>
								<td width="5%" align="center">
									删除
								</td>
							</tr>
								<s:iterator var="cs" value="pageBean.list" status="status">
									<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
										<td style="CURSOR: hand; HEIGHT: 25px" align="center">
											<s:property value="#status.count"/>
										</td>
										<td style="CURSOR: hand; HEIGHT: 25px" align="center">
											<s:property value="#cs.csid"/>
										</td>
										<td style="CURSOR: hand; HEIGHT: 25px" align="center">
											<s:property value="#cs.csname"/>
										</td>
										<td style="CURSOR: hand; HEIGHT: 25px" align="center">
											<s:property value="#cs.desc"/>
										</td>
										<td style="CURSOR: hand; HEIGHT: 25px" align="center">
											<select name="category.cid" disabled="disabled">
												<s:iterator var="c" value="cList">
													<option value="<s:property value="#c.cid"/>" <s:if test="#c.cid==#cs.category.cid">selected</s:if>><s:property value="#c.cname"/></option>
												</s:iterator>
											</select>
										</td>
										<td align="center" style="HEIGHT: 25px">
											<a href="${ pageContext.request.contextPath }/adminCategorySecond_edit.action?csid=<s:property value="#cs.csid"/>">
												<img src="${pageContext.request.contextPath}/admin/img/i_edit.gif" border="0" style="CURSOR: hand">
											</a>
										</td>
								
										<td align="center" style="HEIGHT: 25px">
											<a href="${ pageContext.request.contextPath }/adminCategorySecond_delete.action?csid=<s:property value="#cs.csid"/>">
												<img src="${pageContext.request.contextPath}/admin/img/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
											</a>
										</td>
									</tr>
								</s:iterator>	
						</table>
					</td>
					
				</tr>
				<tr align="center">
					<td colspan="4">
						第<s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/>页  
						<s:if test="pageBean.page != 1">
							<a href="${pageContext.request.contextPath }/adminCategorySecond_findAll.action?page=1">首页</a> |
							<a href="${pageContext.request.contextPath }/adminCategorySecond_findAll.action?page=<s:property value="pageBean.page-1"/>">上一页</a> |
						</s:if>
						<s:if test="pageBean.page != pageBean.totalPage">
						<a href="${pageContext.request.contextPath }/adminCategorySecond_findAll.action?page=<s:property value="pageBean.page+1"/>">下一页</a> |
						<a href="${pageContext.request.contextPath }/adminCategorySecond_findAll.action?page=<s:property value="pageBean.totalPage"/>">尾页</a> 
						</s:if>
					</td>
				</tr>
			</TBODY>
		</table>
	</body>
</HTML>

