<%@ page import="tarefateste.Categoria" %>



<div class="fieldcontain ${hasErrors(bean: categoriaInstance, field: 'descricao', 'error')} ">
	<label for="descricao">
		<g:message code="categoria.descricao.label" default="Descricao" />
		
	</label>
	<g:textField name="descricao" value="${categoriaInstance?.descricao}"/>
</div>

