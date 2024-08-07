import SwiftUI

enum WhileLoading {
    case loadingView
    case emptyGenresView
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .loadingView:
            LoadingView()
        case .emptyGenresView:
            EmptyScrollwWithGenres()
        }
    }
}
