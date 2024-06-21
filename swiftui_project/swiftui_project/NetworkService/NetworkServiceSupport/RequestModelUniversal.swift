struct RequestModelUniversal<T: Decodable> {
    let urlString: String
    let httpMethod: HTTPMethods
    let header: [String: String]?
    let parameters: [String: Any]?
}
