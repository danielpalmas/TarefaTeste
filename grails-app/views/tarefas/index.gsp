<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Tarefas</title>

<script type="text/javascript" src="${resource(dir:'js', file:'date.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js', file:'jquery-2.1.4.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js', file:'jquery-ui.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js', file:'jquery.tmpl.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js', file:'jquery-serialization.js')}"></script>

<script type="text/javascript" src="${resource(dir:'js', file:'tasks-controller.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js', file:'jquery.validate.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js', file:'tasks-webGrails.js')}"></script>

<link rel="stylesheet" href="${resource(dir: 'css', file: '02-tasks.css')}" type="text/css" media="screen" />

</head>
<body>
	<header>
	  
		<span>Lista de Tarefas</span>
	</header>
	<main id="taskPage">
		<section id="taskCreation" class="not">
			<form id="taskForm">
				<div>
					<label>Tarefa</label> 
					<input type="hidden" name="id" />
					<input maxlength="200" type="text" required="required" name="task" class="large" placeholder="Estudar e programar" />
					
					
				</div>
				<div>
					<label>Finalizar até</label> <input type="date" required="required" name="requiredBy" />
				</div>
				<div>
					<label>Categoria</label> 
					<select name="category">
						<option value="Pessoal">Pessoal</option>
						<option value="Profissional">Profissional</option>
					</select>
				</div>
				<nav>
					<a href="#" id="saveTask">Salvar tarefa</a> 
					<a href="#" id="clearTask">Limpar tarefa</a>

				</nav>

			</form>
		</section>
		<section>
			<table id="tblTasks">
						<colgroup>
							<col width="40%">
							<col width="15%">
							<col width="15%">
							<col width="30%">
						</colgroup>
				<thead>
					<tr>
						<th>Nome</th>
						<th>Deadline</th>
						<th>Categoria</th>
						<th>Ações</th>
					</tr>
				</thead>
				<tbody>
				<g:render template="lista" model="[tarefa: tarefas]" />
				</tbody>
			</table>
			<nav>
				<a href="#" id="btnAddTask">Adicionar tarefa</a>
			</nav>
		</section>
	</main>
	<footer>Você tem <span id="taskCount"></span> tarefas em aberto</footer>
</body>


<script>

$(document).ready(function() {
	tasksController.init($('#taskPage'));
	tasksController.loadTasks();

});
</script>

			
<script id="taskRow" type="text/x-jQuery-tmpl">
<tr>
	<td {{if complete == true}} class="taskCompleted" {{/if}}>${task}</td>
	<td {{if complete == true}} class="taskCompleted" {{/if}}><time datetime="${requiredBy}"> ${requiredBy}</time></td>
	<td {{if complete == true}} class="taskCompleted" {{/if}}>${category}</td>
	<td>
		<nav>
			{{if complete != true}}
			<a href="#" class="editRow" data-task-id="${id}">Editar</a>
			<a href="#" class="completeRow" data-task-id="${id}">Completar</a>
			{{/if}}	
			<a href="#" class="deleteRow" data-task-id="${id}">Deletar</a>
		</nav>
	</td>
</tr>
</script>

</html>
