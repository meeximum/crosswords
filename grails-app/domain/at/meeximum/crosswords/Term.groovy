package at.meeximum.crosswords

class Term {

    String term
    Integer length
    String description
    Token token

    static belongsTo = [Token]

    static constraints = {
        term(nullable: false, blank: false, unique: false)
        description(maxSize: 1000, nullable:true)
        token(nullable:true)
        length(nullable: true)
    }

    String toString() {
        return term
    }
}
