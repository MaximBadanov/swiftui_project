import Combine
import SwiftUI


class DataManager: DataManagerProtocol {
    var network: NetworkServiceProtocol
    
    init(network: NetworkServiceProtocol) {
        self.network = network
    }
    
    func fetchGenres<T: Decodable>(requestModel: RequestModel<T>) -> AnyPublisher<T, Error> {
        return network.makeRequest(requestModel: requestModel)
    }
}
