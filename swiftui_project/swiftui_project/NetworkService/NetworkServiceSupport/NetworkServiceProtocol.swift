import Combine

protocol NetworkServiceProtocol {
    func makeUniversalRequest<T: Decodable>(requestModel: RequestModelUniversal<T>) -> AnyPublisher<T, Error>
}
