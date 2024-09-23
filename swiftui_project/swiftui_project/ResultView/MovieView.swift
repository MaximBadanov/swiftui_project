import SwiftUI

struct MovieView: View {
    let title: String
    let poster: String
    let genres: String
    
    private let lineLimit: Int = 3
    
    var body: some View {
        VStack(spacing: UISize.size8) {
            Text("Your movie for today")
                .textStyle(
                    size: UISize.size24,
                    weight: .bold
                )
            Spacer()
            CachedImage(url: Urls.posterURL.rawValue + poster)
            Text(title)
                .lineLimit(lineLimit)
                .textStyle(
                    size: UISize.size40,
                    weight: .heavy
                )
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
        .onAppear {
            print(poster)
        }
    }
}
