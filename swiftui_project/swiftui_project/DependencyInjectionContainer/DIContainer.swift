final class DIContainer {
    static let shared = DIContainer()
    private lazy var dependecies = [String: Any]()
    
    private init() {}

    func injectDependency<Service>(dependency: Service) -> Service? {
        let key = String(describing: Service.self)
        dependecies[key] = dependency
        return dependecies[key] as? Service
    }
}


