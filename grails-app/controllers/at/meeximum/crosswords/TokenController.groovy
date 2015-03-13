package at.meeximum.crosswords

import pl.touk.excel.export.WebXlsxExporter

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TokenController {

    static beforeInterceptor = {
        if (!session.user) {
            redirect(controller: 'index', action: 'logon')
            return
        }
    }

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Token.list(params), model:[tokenInstanceCount: Token.count()]
    }

    def show(Token tokenInstance) {
        respond tokenInstance
    }

    def create() {
        respond new Token(params)
    }

    @Transactional
    def save(Token tokenInstance) {
        if (tokenInstance == null) {
            notFound()
            return
        }

        if (tokenInstance.hasErrors()) {
            respond tokenInstance.errors, view:'create'
            return
        }

        tokenInstance.token = tokenInstance.token.toUpperCase()

        tokenInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'token.label', default: 'Token'), tokenInstance.id])
                redirect tokenInstance
            }
            '*' { respond tokenInstance, [status: CREATED] }
        }
    }

    def edit(Token tokenInstance) {
        respond tokenInstance
    }

    @Transactional
    def update(Token tokenInstance) {
        if (tokenInstance == null) {
            notFound()
            return
        }

        if (tokenInstance.hasErrors()) {
            respond tokenInstance.errors, view:'edit'
            return
        }

        tokenInstance.token = tokenInstance.token.toUpperCase()

        tokenInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Token.label', default: 'Token'), tokenInstance.id])
                redirect tokenInstance
            }
            '*'{ respond tokenInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Token tokenInstance) {

        if (tokenInstance == null) {
            notFound()
            return
        }

        tokenInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Token.label', default: 'Token'), tokenInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'token.label', default: 'Token'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def export() {
        def tokens  = Token.findAll()
        def headers = ["id",message(code: 'token.token.label'), message(code: 'token.description.label')]
        def withProperties = ['id', 'token', 'description']
        new WebXlsxExporter().with {
            setResponseHeaders(response)
            fillHeader(headers)
            add(tokens, withProperties)
            save(response.outputStream)
        }
    }
}
