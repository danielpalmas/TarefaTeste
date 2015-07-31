<g:each var="tarefa" in="${tarefas}">
	<tr class="even">
			<td>${tarefa.descricao }</td>
			<td><time datetime="2015-10-14">${tarefa.dtFinal }</time></td>
			<td>${tarefa.categoria.descricao }</td>
			<td>
				<nav>
					<a href="#" class="editRow3">Editar</a>
					<a href="#" class="completeRow3">Completar</a>
					<a href="#" class="deleteRow3" >Deletar</a>
				</nav>
			</td>
		</tr>
</g:each>
				