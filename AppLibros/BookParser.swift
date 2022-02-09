
/*import Foundation

struct BookParser{
 
    
    func parse(comp : @escaping (BookFox)->()){
        let api = URL(string: "https://openlibrary.org/subjects/love.json")
        
        URLSession.shared.dataTask(with: api!){
            data, respond, error in
            if error != nil{
                print(error?.localizedDescription)
                return
            }
            do{
            let result = try JSONDecoder().decode(BookFox.self, from: data!)
                
                comp(result)
               // print("title1: \(result.works)")
                
            }catch{
                
            }
        }.resume()	
        
    }
    
}*/
