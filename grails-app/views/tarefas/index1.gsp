
<%@ page import="tarefateste.Tarefas" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tarefas.label', default: 'Tarefas')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tarefas" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tarefas" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="descricao" title="${message(code: 'tarefas.descricao.label', default: 'Descricao')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'tarefas.status.label', default: 'Status')}" />
					
						<th><g:message code="tarefas.categoria.label" default="Categoria" /></th>
					
						<g:sortableColumn property="dtFinal" title="${message(code: 'tarefas.dtFinal.label', default: 'Dt Final')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tarefasInstanceList}" status="i" var="tarefasInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tarefasInstance.id}">${fieldValue(bean: tarefasInstance, field: "descricao")}</g:link></td>
					
						<td><g:formatBoolean boolean="${tarefasInstance.status}" /></td>
					
						<td>${fieldValue(bean: tarefasInstance, field: "categoria")}</td>
					
						<td><g:formatDate date="${tarefasInstance.dtFinal}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tarefasInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
