import Foundation

struct DescriptionData : Codable{
    let descriptionDataDescription: Created
    
    
}

struct Created: Codable {
    let type, value: String
}
