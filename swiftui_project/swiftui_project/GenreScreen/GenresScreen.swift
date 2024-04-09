import SwiftUI

struct GenresScreen: View {
    @ObservedObject private var viewModel = GenreViewViewModel()
    @State private var genres: [String] = ["27", "12"]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: UISize.size8) {
            Spacer(minLength: UISize.size8)
            Text("Choose Genres")
                .padding(.leading, UISize.size24)
                .textStyle(
                    size: UISize.size32,
                    weight: .bold
                )
            GenresViewWithScroll()
                .onAppear {
                    viewModel.fetchMoviesByGenre(
                        requestModel: RequestModel(
                            urlString: Urls.moviesByGenres.rawValue,
                            header: Headers.movieDB.header,
                            httpMethod: HTTPMethods.get,
                            modelToParse: MovieResponse.self
                        ),
                        genres: genres
                    )
                }
            Spacer(minLength: UISize.size8)
            HStack(spacing: UISize.size8) {
                Spacer(minLength: UISize.size8)
                    .padding(.horizontal, UISize.size24)
                NavigationLink("Continue",
                               destination: ResultView(
                                title: viewModel.movie?.title ?? "no title",
                                poster: viewModel.movie?.poster ?? "no poster"
                               ))
                .buttonStyle(.primaryStyle)
                .padding(.trailing, UISize.size24)
            }
        }
        .padding(.bottom, UISize.size16)
    }
}

#Preview {
    GenresScreen()
}
