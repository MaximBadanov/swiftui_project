import SwiftUI

struct MovieView: View {
    let title: String
    let poster: String
    let genres: String
    
    private let opacity: Double = 0.1
    private let lineLimit: Int = 3
    
    var body: some View {
        VStack(spacing: UISize.size8) {
            Text("Your movie for today")
                .textStyle(
                    size: UISize.size24,
                    weight: .bold
                )
                .padding(.bottom, UISize.size16)
            Spacer()
            AsyncImage(url: URL(
                string: Urls.posterURL.rawValue + poster)
            ) { image in
                image.resizable()
                    .frame(maxWidth: .infinity)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(UISize.size16)
            } placeholder: {
                Image(systemName: "movieclapper")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .cornerRadius(UISize.size8)
                    .aspectRatio(contentMode: .fit)
                    .opacity(opacity)
                    .foregroundColor(.customGray)
            }
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

    }
}

#Preview {
    MovieView(title: "Movie Title", poster: "Movie Poster", genres: "Genres")
}
