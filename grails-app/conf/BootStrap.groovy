import at.meeximum.crosswords.User
import grails.util.Environment

class BootStrap {

    def init = { servletContext ->

        def currentEnv = Environment.current

        if (currentEnv == Environment.DEVELOPMENT) {
            def user = new User(user: "reich", password: "1234")
            user.save()
        }

    }
    def destroy = {
    }
}
