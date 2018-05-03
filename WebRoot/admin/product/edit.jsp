<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<LINK href="${pageContext.request.contextPath}/admin/css/Style1.css" type="text/css" rel="stylesheet">
	</HEAD>
	
	<body>
		<!--  -->
		<form id="userAction_save_do" name="Form1" action="${pageContext.request.contextPath}/adminProduct_update.action" method="post" enctype="multipart/form-data">
			<input type="hidden" name="pid" value="<s:property value="model.pid"/>">
			&nbsp;
			<table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
						height="26">
						<strong><STRONG>编辑商品</STRONG>
						</strong>
					</td>
				</tr>

				<tr>
					<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
						商品名称：
					</td>
					<td class="ta_01" bgColor="#ffffff" width="30%">
						<input type="text" name="pname" value="<s:property value="model.pname"/>" id="userAction_save_do_logonName" class="bg"/>
					</td>
					<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
						是否热门：
					</td>
					<td class="ta_01" bgColor="#ffffff" width="50%">
						<select name="ishot">
							<option value="0" <s:if test="model.ishot==0">selected</s:if>>否</option>
							<option value="1" <s:if test="model.ishot==1">selected</s:if>>是</option>
						</select>
					</td>
				</tr>
				<tr>
					<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
						商品价格：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="nowprice" value="<s:property value="model.nowprice"/>" id="userAction_save_do_logonName" class="bg"/>
					</td>
					<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
						星级：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<select name="star">
							<option value="0" <s:if test="model.star==0">selected</s:if>>--</option>
							<option value="1" <s:if test="model.star==1">selected</s:if>>一星</option>
							<option value="2" <s:if test="model.star==2">selected</s:if>>二星</option>
							<option value="3" <s:if test="model.star==3">selected</s:if>>三星</option>
							<option value="4" <s:if test="model.star==4">selected</s:if>>四星</option>
							<option value="5" <s:if test="model.star==5">selected</s:if>>五星</option>
						</select>
					</td>
				</tr>
				<tr>
					<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
						商品图片1：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="img1" value="<s:property value="model.img1"/>"/>
					</td>
					<td width="10%" align="center" bgColor="#f5fafe" class="ta_01">
						商品图片2：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="img2" value="<s:property value="model.img2"/>"/>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						所属的二级分类：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<select name="categorySecond.csid">
							<s:iterator var="cs" value="csList">
								<option value="<s:property value="#cs.csid"/>" <s:if test="#cs.csid == model.categorySecond.csid">selected</s:if>><s:property value="#cs.csname"/></option>
								</s:iterator>
						</select>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品描述：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<textarea name="desc" rows="4" cols="50"><s:property value="model.desc"/></textarea>
					</td>
				</tr>
				<tr>
					<td class="ta_01" style="WIDTH: 100%" align="center"
						bgColor="#f5fafe" colSpan="4">
						<button type="submit" id="userAction_save_do_submit" value="确定" class="button_ok">
							&#30830;&#23450;
						</button>

						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<button type="reset" value="重置" class="button_cancel">&#37325;&#32622;</button>

						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
						<span id="Label1"></span>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>