
import Foundation


struct BookData : Decodable{
    let results : Result
}

struct Result : Decodable{
    let books : [Book]
    let list_name : String
}

struct Book : Decodable{
    let title : String
    let author : String
    let description : String
    let book_image : String
}
