package at.meeximum.crosswords

class User {

    String user
    String password

    static constraints = {
        user(nullable: false, unique: true)
        password(nullable:false)
    }

    String toString() {
        retunr user
    }
}
