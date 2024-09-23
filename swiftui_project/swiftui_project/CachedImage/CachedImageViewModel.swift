import SwiftUI

class CachedImageViewModel: ObservableObject {
    @Published var downloadedImage: UIImage?
    @Published var isLoading: Bool = true
    @Published var hasError: Bool = false
    
    let cacheService = DIContainer.shared.injectDependency(dependency: CacheService<UIImage>())
    
    func loadImage(from urlString: String) {
        if let cachedImage = cacheService?.getObject(forKey: urlString) {
            self.downloadedImage = cachedImage
            self.isLoading = false
        } else {
            downloadedImage = nil
            downloadImage(from: urlString)
        }
    }
    
    private func downloadImage(from urlString: String) {
        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async {
                self.hasError = true
                self.isLoading = false
            }
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let self = self else { return }
            if error != nil  {
                DispatchQueue.main.async {
                    self.hasError = true
                    self.isLoading = false
                }
                return
            }
            guard let data = data,
                  let image = UIImage(data: data) else {
                DispatchQueue.main.async {
                    self.hasError = true
                    self.isLoading = false
                }
                return
            }
            DispatchQueue.main.async {
                self.cacheService?.saveObject(image, forKey: urlString)
                self.downloadedImage = image
                self.isLoading = false
            }
        }
        task.resume()
    }
}
