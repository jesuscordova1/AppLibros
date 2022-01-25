import Foundation
import UIKit

class Libros{
    var libros : [Libro]?
    
    init(libros: [Libro]){
        self.libros = libros
    }
}

class Libro{
    var title : String?
    var author : String?
    var category : String?
    var imgName : String?
    var rating : String?
    var description : String?
    var imgAuthorName : String?
    var descAuthor : String?
    
    init(title: String, author: String, category: String, imgName : String, rating : String, description: String, imgAuthorName: String, descAuthor: String){
        self.title = title
        self.author = author
        self.category = category
        self.imgName = imgName
        self.rating = rating
        self.description = description
        self.imgAuthorName = imgAuthorName
        self.descAuthor = descAuthor
    }
}
