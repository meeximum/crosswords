package at.meeximum.crosswords

class Token {

    String token
    String description

    static constraints = {
        token(nullable: false, blank: false, unique: true)
        description(maxSize: 1000, nullable:true)
    }

    String toString() {
        return token
    }
}
