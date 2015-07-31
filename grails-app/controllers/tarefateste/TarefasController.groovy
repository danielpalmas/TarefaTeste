package tarefateste

import grails.converters.JSON

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TarefasController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Tarefas.list(params), model:[tarefasInstanceCount: Tarefas.count(), categorias: Categoria.list()]
    }

	def list(){
		render text: [tasks:Tarefas.list([sort: 'requiredBy', order:'desc'])] as JSON, contentType: 'application/json'
	}
	
	def get(){
		render text: [task:Tarefas.findById(params.id)] as JSON, contentType: 'application/json'
	}

    def show(Tarefas tarefasInstance) {
        respond tarefasInstance
    }

    def create() {
        respond new Tarefas(params)
    }

    @Transactional
    def save(Tarefas tarefasInstance) {
        if (tarefasInstance == null) {
            notFound()
            return
        }

        if (tarefasInstance.hasErrors()) {
            respond tarefasInstance.errors, view:'create'
            return
        }
		render text: [tarefas:tarefasInstance] as JSON, contentType: 'application/json'
        tarefasInstance.save flush:true
/*
        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tarefasInstance.label', default: 'Tarefas'), tarefasInstance.id])
                redirect tarefasInstance
            }
            '*' { respond tarefasInstance, [status: CREATED] }
        }
  */
    }

    def edit(Tarefas tarefasInstance) {
        respond tarefasInstance
    }

    @Transactional
    def update(Tarefas tarefasInstance) {
        if (tarefasInstance == null) {
            notFound()
            return
        }

        if (tarefasInstance.hasErrors()) {
            respond tarefasInstance.errors, view:'edit'
            return
        }

        tarefasInstance.save flush:true
/*
        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Tarefas.label', default: 'Tarefas'), tarefasInstance.id])
                redirect tarefasInstance
            }
            '*'{ respond tarefasInstance, [status: OK] }
        }
  */
    }

    @Transactional
    def delete(Tarefas tarefasInstance) {

        if (tarefasInstance == null) {
            notFound()
            return
        }

        tarefasInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Tarefas.label', default: 'Tarefas'), tarefasInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tarefasInstance.label', default: 'Tarefas'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
