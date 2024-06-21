import Foundation
import Combine

class NetworkService: NetworkServiceProtocol {    
    func makeUniversalRequest<T: Decodable>(requestModel: RequestModelUniversal<T>) -> AnyPublisher<T, Error> {
        let urlString = requestModel.urlString
        guard var urlComponents = URLComponents(string: urlString) else {
            print("Bad URL")
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        if let parameters = requestModel.parameters {
            urlComponents.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        }
        guard let url = urlComponents.url else {
            print("Failed to create URL")
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        var request = URLRequest(url: url)
        request.httpMethod = requestModel.httpMethod.rawValue
        request.allHTTPHeaderFields = requestModel.header
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
