import Foundation

protocol CacheServiceProtocol {
    associatedtype T: AnyObject

    func getObject(forKey key: String) -> T?
    func saveObject(_ object: T, forKey key: String)
}
