import Combine
import SwiftUI

class DataManager: DataManagerProtocol {
    var network: NetworkServiceProtocol
    
    init() {
        guard let network = DIContainer.shared.injectDependency(dependency: NetworkService()) else {
            fatalError("Service not found in DI container")
        }
        self.network = network
    }
    
    func fetchData<T: Decodable>(requestModel: RequestModelUniversal<T>) -> AnyPublisher<T, Error> {
        return network.makeUniversalRequest(requestModel: requestModel)
    }
}
