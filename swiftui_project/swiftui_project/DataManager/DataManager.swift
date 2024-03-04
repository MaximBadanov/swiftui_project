import Combine
import SwiftUI


struct DataManager: DataManagerProtocol {
    var network: NetworkServiceProtocol
    
    func fetchGenres<T: Decodable>(requestModel: RequestModel<T>) -> AnyCancellable {
        return network.makeRequest(requestModel: requestModel)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Finished")
                case .failure(let error):
                    print("Finished with error: \(error)")
                }
            }, receiveValue: { data in
                if let data = data as? GenresResponse {
                    data.genres.forEach { print("\($0.name) _______ id: \($0.id)")
                    }
                }
            })
    }
}