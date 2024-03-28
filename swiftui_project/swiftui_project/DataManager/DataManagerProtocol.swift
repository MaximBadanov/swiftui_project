import SwiftUI
import Combine


protocol DataManagerProtocol {
    func fetchGenres<T: Decodable>(requestModel: RequestModel<T>) -> AnyPublisher<T, Error>
}
