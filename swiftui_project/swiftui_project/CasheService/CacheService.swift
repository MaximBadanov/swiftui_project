import Foundation
import SwiftUI

final class CacheService<T: AnyObject>: CacheServiceProtocol {
    private let cache = NSCache<NSString, T>()
    
    func getObject(forKey key: String) -> T? {
        let cacheKey = NSString(string: key)
        return cache.object(forKey: cacheKey)
    }
    
    func saveObject(_ object: T, forKey key: String) {
        let cacheKey = NSString(string: key)
        cache.setObject(object, forKey: cacheKey)
    }
}
