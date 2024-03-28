import Combine

protocol NetworkServiceProtocol {
    func makeRequest<T: Decodable>(requestModel: RequestModel<T>) -> AnyPublisher<T,Error>
}
