import at.meeximum.crosswords.User

class BootStrap {

    def init = { servletContext ->
        def user = new User(user: "reich", password: "1234")
        user.save()
    }
    def destroy = {
    }
}
