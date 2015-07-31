<%@ page import="tarefateste.Tarefas" %>



<div class="fieldcontain ${hasErrors(bean: tarefasInstance, field: 'descricao', 'error')} ">
	<label for="descricao">
		<g:message code="tarefas.descricao.label" default="Descricao" />
		
	</label>
	<g:textField name="descricao" value="${tarefasInstance?.descricao}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tarefasInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="tarefas.status.label" default="Status" />
		
	</label>
	<g:checkBox name="status" value="${tarefasInstance?.status}" />
</div>

<div class="fieldcontain ${hasErrors(bean: tarefasInstance, field: 'categoria', 'error')} required">
	<label for="categoria">
		<g:message code="tarefas.categoria.label" default="Categoria" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="categoria" name="categoria.id" from="${tarefateste.Categoria.list()}" optionKey="id" required="" value="${tarefasInstance?.categoria?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tarefasInstance, field: 'dtFinal', 'error')} required">
	<label for="dtFinal">
		<g:message code="tarefas.dtFinal.label" default="Dt Final" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dtFinal" precision="day"  value="${tarefasInstance?.dtFinal}"  />
</div>

