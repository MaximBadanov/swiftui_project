import Foundation

struct MovieParameters: Codable {
    let randomGenreID: String
    let page: String = "\(Int.random(in: 1...100))"
    
    enum CodingKeys: String, CodingKey  {
        case randomGenreID = "with_genres"
        case page
    }
}

struct RequestParameters<T: Codable> {
    let parameter: T
    
    func convertToDictionary() -> [String: Any]? {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(self.parameter)
            guard let dictionary = try
                    JSONSerialization.jsonObject(with: data,
                                                 options: .allowFragments) as? [String: Any]
            else {
                return nil
            }
            return dictionary
        } catch {
            print("Error converting struct to dictionary: \(error.localizedDescription)")
            return nil
        }
    }
}

