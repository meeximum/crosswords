package at.meeximum.crosswords

class IndexController {

    def index() {
        if (!session.user) {
            redirect(action: 'logon')
            return
        }
        println("search called")
        if (!params.searchTextField) return
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def termList = Term.createCriteria().list(params) {
            String searchText = params.searchTextField
            println(searchText)
            ilike("term", searchText.replaceAll("#", "_").replaceAll("\\+", "%"))
        }
        [searchresults: termList, count: termList.totalCount]
        //render(template:'grid', model:[searchresults:termList, count:termList.totalCount])
    }

    def logon() {
    }

    def handleLogin() {
        def user = User.findByUser(params.userName)
        if (!user) {
            flash.message = "Benutzer nicht vorhanden! ${params.userName}"
            redirect(action: 'logon')
            return
        } else {
            if (!user.password.equals(params.userPass)) {
                flash.message = "Password falsch!"
                redirect(action: 'logon')
                return
            }
            session.user = user
            redirect(action: 'index')
            return
        }
    }

    def logout() {
        if (session.user) {
            session.user = null
            redirect(action: 'logon')
        }
    }

}


