import SwiftUI
import Combine

protocol DataManagerProtocol {
    func fetchData<T: Decodable>(requestModel: RequestModelUniversal<T>) -> AnyPublisher<T, Error>
}
