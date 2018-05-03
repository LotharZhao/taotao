<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<table width="100%">
	<s:iterator var="orderItem" value="list">
	<tr align="center">
		<td width="40%"><s:property value="#orderItem.product.pname"/></td>
		<td width="30%"><s:property value="#orderItem.count"/></td>
		<td width="30%"><s:property value="#orderItem.subtotal"/></td>
	</tr>
	</s:iterator>
</table>