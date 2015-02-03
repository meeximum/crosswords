package at.meeximum.crosswords


import grails.test.mixin.*
import spock.lang.*

@TestFor(TokenController)
@Mock(Token)
class TokenControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.tokenInstanceList
        model.tokenInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.tokenInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'POST'
        def token = new Token()
        token.validate()
        controller.save(token)

        then: "The create view is rendered again with the correct model"
        model.tokenInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        token = new Token(params)

        controller.save(token)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/token/show/1'
        controller.flash.message != null
        Token.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def token = new Token(params)
        controller.show(token)

        then: "A model is populated containing the domain instance"
        model.tokenInstance == token
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def token = new Token(params)
        controller.edit(token)

        then: "A model is populated containing the domain instance"
        model.tokenInstance == token
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'PUT'
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/token/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def token = new Token()
        token.validate()
        controller.update(token)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.tokenInstance == token

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        token = new Token(params).save(flush: true)
        controller.update(token)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/token/show/$token.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'DELETE'
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/token/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def token = new Token(params).save(flush: true)

        then: "It exists"
        Token.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(token)

        then: "The instance is deleted"
        Token.count() == 0
        response.redirectedUrl == '/token/index'
        flash.message != null
    }
}
