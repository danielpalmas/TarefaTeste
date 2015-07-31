package tarefateste



import grails.test.mixin.*
import spock.lang.*

@TestFor(TarefasController)
@Mock(Tarefas)
class TarefasControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.tarefasInstanceList
            model.tarefasInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.tarefasInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def tarefas = new Tarefas()
            tarefas.validate()
            controller.save(tarefas)

        then:"The create view is rendered again with the correct model"
            model.tarefasInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            tarefas = new Tarefas(params)

            controller.save(tarefas)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/tarefas/show/1'
            controller.flash.message != null
            Tarefas.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def tarefas = new Tarefas(params)
            controller.show(tarefas)

        then:"A model is populated containing the domain instance"
            model.tarefasInstance == tarefas
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def tarefas = new Tarefas(params)
            controller.edit(tarefas)

        then:"A model is populated containing the domain instance"
            model.tarefasInstance == tarefas
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/tarefas/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def tarefas = new Tarefas()
            tarefas.validate()
            controller.update(tarefas)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.tarefasInstance == tarefas

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            tarefas = new Tarefas(params).save(flush: true)
            controller.update(tarefas)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/tarefas/show/$tarefas.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/tarefas/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def tarefas = new Tarefas(params).save(flush: true)

        then:"It exists"
            Tarefas.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(tarefas)

        then:"The instance is deleted"
            Tarefas.count() == 0
            response.redirectedUrl == '/tarefas/index'
            flash.message != null
    }
}
