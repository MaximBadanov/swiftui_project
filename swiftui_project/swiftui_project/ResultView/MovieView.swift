import SwiftUI

struct MovieView: View {
    let title: String
    let poster: String
    let genres: String
    
    private let lineLimit: Int = 3
    
    @State private var scaleEffect: Double = 1
    
    var body: some View {
        AsyncImage(url: URL(
            string: Urls.posterURL.rawValue + poster)
        ) { phase in
            switch phase {
            case .empty:
                LoadingView()
                    .scaleEffect(scaleEffect)
                    .onAppear {
                        withAnimation {
                            scaleEffect = 0.5
                        }
                    }
            case .success(let image):
                VStack(spacing: UISize.size8) {
                    Text("Your movie for today")
                        .textStyle(
                            size: UISize.size24,
                            weight: .bold
                        )
                        .padding(.bottom, UISize.size16)
                    Spacer()
                    image.resizable()
                        .frame(maxWidth: .infinity)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(UISize.size16)
                    Spacer()
                    Text(title)
                        .textStyle(
                            size: UISize.size24,
                            weight: .heavy
                        )
                        .lineLimit(lineLimit)
                        .padding(.horizontal, UISize.size16)
                    Text(genres)
                        .textStyle(
                            size: UISize.size16,
                            weight: .medium
                        )
                        .foregroundColor(.customGray)
                    Spacer()
                    Text("This movie is showed for you just once")
                        .textStyle(
                            size: UISize.size16,
                            weight: .light
                        )
                }
                .padding(.horizontal, UISize.size32)
                
            case .failure(_):
                NoPosterScreen(title: title, genres: genres)
            @unknown default:
                NoPosterScreen(title: title, genres: genres)
            }
        }
    }
}
