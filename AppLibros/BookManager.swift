
import Foundation

protocol BookManagerDelegate{
    func tapBooksData(_ bookManager: BookManager, book: BookData)
}

struct BookManager{
    var rank : Int
    var delegate : BookManagerDelegate?
    
    let url = "https://api.nytimes.com/svc/books/v3/lists/manga.json?api-key=wj99ThkWtkfF7JL4CGBixEjVyYuYK76N"
    
    func request(urlString : String){
        
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){(data, response, error)
                in
                if error != nil{
                    print(error)
                    return
                }
                if let safeData = data{
                    if let book = self.parseJson(bookData: safeData){
                        delegate?.tapBooksData(self, book: book)
                    }
                        
                
                }
                
            }
            task.resume()
            
        }
        
    }
    
    func parseJson(bookData: Data) -> BookData?{
        
        let decoder = JSONDecoder()
        do{
            
            
            let decodedData = try decoder.decode(BookData.self, from: bookData)
            let bookTitle = decodedData.results.books[rank].title
            let authorName = decodedData.results.books[rank].author
            let description = decodedData.results.books[rank].description
            let bookImage = decodedData.results.books[rank].book_image
            let category = decodedData.results.list_name
            
            var bookFinal = BookData(results: Result(books: [Book(title: bookTitle, author: authorName, description: description,book_image: bookImage)], list_name: category))   
            
            let book = BookData(results: Result(books: [Book(title: bookTitle, author: authorName, description: description,book_image: bookImage)], list_name: category))
            
            return book
        }
        catch{
            print(error)
            return nil
        }
        
    }

    
}


