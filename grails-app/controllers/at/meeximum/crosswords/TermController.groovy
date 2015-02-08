package at.meeximum.crosswords

import pl.touk.excel.export.WebXlsxExporter

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TermController {

    static beforeInterceptor = {
        if (!session.user) {
            redirect(controller: 'index', action: 'logon')
            return
        }
    }

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Term.list(params), model: [termInstanceCount: Term.count()]
    }

    def show(Term termInstance) {
        respond termInstance
    }

    def create() {
        respond new Term(params)
    }

    @Transactional
    def save(Term termInstance) {
        if (termInstance == null) {
            notFound()
            return
        }

        if (termInstance.hasErrors()) {
            respond termInstance.errors, view: 'create'
            return
        }

        termInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'term.label', default: 'Term'), termInstance.id])
                redirect termInstance
            }
            '*' { respond termInstance, [status: CREATED] }
        }
    }

    def edit(Term termInstance) {
        respond termInstance
    }

    @Transactional
    def update(Term termInstance) {
        if (termInstance == null) {
            notFound()
            return
        }

        if (termInstance.hasErrors()) {
            respond termInstance.errors, view: 'edit'
            return
        }

        termInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Term.label', default: 'Term'), termInstance.id])
                redirect termInstance
            }
            '*' { respond termInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Term termInstance) {

        if (termInstance == null) {
            notFound()
            return
        }

        termInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Term.label', default: 'Term'), termInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'term.label', default: 'Term'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def export() {
        def terms  = Term.findAll()
        def headers = ["id",message(code: 'term.term.label'), message(code: 'term.token.label'), message(code: 'term.description.label')]
        def withProperties = ['id', 'term', 'token', 'description']
        new WebXlsxExporter().with {
            setResponseHeaders(response)
            fillHeader(headers)
            add(terms, withProperties)
            save(response.outputStream)
        }
    }
}
