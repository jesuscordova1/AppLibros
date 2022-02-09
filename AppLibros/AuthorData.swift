
import Foundation

struct AuthorData : Decodable{
    let entries : [Entry]
}

struct Entry : Decodable{
    let title : String
    let subjects : [String]?
    let covers : [Int]?
    let subject_times : [String]?
    let excerpts: [Excerpt]?
}

struct Excerpt: Decodable {
    let excerpt, comment: String
}
