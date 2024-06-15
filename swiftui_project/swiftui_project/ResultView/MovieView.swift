import SwiftUI

struct MovieView: View {
    let title: String
    let poster: String
<<<<<<< HEAD
    
    private let aspectRatioPoster: Double = 2.0/3.0
    private let opacity: Double = 0.1
=======
    let genres: String
    
    private let opacity: Double = 0.1
    private let lineLimit: Int = 3
>>>>>>> task_k_work
    
    var body: some View {
        VStack(spacing: UISize.size8) {
            Text("Your movie for today")
                .textStyle(
                    size: UISize.size24,
                    weight: .bold
                )
                .padding(.bottom, UISize.size16)
<<<<<<< HEAD
            AsyncImage(url: URL(string: Urls.posterURL.rawValue + poster)) { image in
                image.resizable()
                    .frame(maxWidth: .infinity)
                    .cornerRadius(UISize.size16)
                    .aspectRatio(aspectRatioPoster, contentMode: .fit)
            } placeholder: {
                Spacer(minLength: UISize.size16)
=======
            Spacer()
            AsyncImage(url: URL(
                string: Urls.posterURL.rawValue + poster)
            ) { image in
                image.resizable()
                    .frame(maxWidth: .infinity)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(UISize.size16)
            } placeholder: {
>>>>>>> task_k_work
                Image(systemName: "movieclapper")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .cornerRadius(UISize.size8)
                    .aspectRatio(contentMode: .fit)
                    .opacity(opacity)
                    .foregroundColor(.customGray)
<<<<<<< HEAD
                Spacer(minLength: UISize.size8)

            }
            .padding(.horizontal, UISize.size32)
=======
            }
            Spacer()
>>>>>>> task_k_work
            Text(title)
                .textStyle(
                    size: UISize.size32,
                    weight: .heavy
                )
<<<<<<< HEAD
                .padding(.horizontal, UISize.size16)
            Text(GenreButtonViewModel.shared.genres.joined(separator: " "))
=======
                .lineLimit(lineLimit)
                .padding(.horizontal, UISize.size16)
            Text(genres)
>>>>>>> task_k_work
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
<<<<<<< HEAD
    MovieView(title: "Movie Title", poster: "Movie Poster")
=======
    MovieView(title: "Movie Title", poster: "Movie Poster", genres: "Genres")
>>>>>>> task_k_work
}

