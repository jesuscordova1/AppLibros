
import Foundation

struct BookFox : Decodable{
    let works : [Work]
}

struct Work : Decodable{
    let title : String
    let subject : [String]
    let authors : [Author]
    let key : String
    let cover_id : Int
}


struct Author : Decodable{
    let name : String
}

