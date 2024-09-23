import SwiftUI

struct CachedImage: View {
    let url: String
    
    @StateObject private var viewModel = CachedImageViewModel()
    
    var body: some View {
        if let cachedImage = viewModel.downloadedImage {
            Image(uiImage: cachedImage)
                .resizable()
                .frame(maxWidth: .infinity)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(UISize.size16)
        } else if viewModel.isLoading {
            PlaceholderImage()
                .onAppear {
                    viewModel.loadImage(from: url)
                }
        } else if  viewModel.hasError {
            PlaceholderImage()
        }
    }
}
