import Combine
import SwiftUI

class GenresWithScrollViewModel: ObservableObject {
    @Published var fetchedGenres: [GenreResponseModel] = []
    @Published var selectedGenres: [String] = []
    @Published var isLoading: Bool = true
    
    private var subscriber: AnyCancellable?
    private let dataManager: DataManager
    
    init() {
        dataManager = DataManager()
    }
    
    func isSelected(_ id: String) -> Bool {
        selectedGenres.contains(id)
    }
    
    func toggleSelection(_ id: String) {
        if isSelected(id) {
            selectedGenres.removeAll(where: { $0 == id })
        } else {
            selectedGenres.append(id)
        }
        print("Selected genres IDs: \(selectedGenres)")
    }
}

extension GenresWithScrollViewModel: GenresViewWithScrollViewModelProtocol {    
    func fetchGenres() {
        let requestModel = RequestModelUniversal<GenresResponse>(urlString: Urls.moviedbGenres.rawValue,
                                                                 httpMethod: HTTPMethods.get,
                                                                 header: Headers.movieDB.header,
                                                                 parameters: nil)
        subscriber = dataManager.fetchData(requestModel: requestModel)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Genres successfully loaded")
                case .failure(let error):
                    print("Finished with error: \(error)")
                }
            }, receiveValue: { data in
                self.fetchedGenres = data.genres
                self.isLoading = false
            })
    }
}
