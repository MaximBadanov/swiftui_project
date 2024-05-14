import SwiftUI

struct GenresScreen: View {
    @ObservedObject private var viewModelMain = GenreScreenViewModel()
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: UISize.size8) {
            Spacer(minLength: UISize.size8)
            Text("Choose Genres")
                .padding(.leading, UISize.size24)
                .textStyle(
                    size: UISize.size32,
                    weight: .bold
                )
            GenresViewWithScroll()
            Spacer(minLength: UISize.size8)
            HStack(spacing: UISize.size8) {
                Spacer(minLength: UISize.size8)
                    .padding(.horizontal, UISize.size24)
                //                от сюда
                Button(action: {
                    viewModelMain.fetchMoviesByGenre(
                        requestModel: RequestModel(
                            urlString: Urls.movieByGenres.rawValue,
                            header: Headers.movieDB.header,
                            httpMethod: HTTPMethods.get,
                            modelToParse: MovieResponse.self
                        ),
                        genreIDs: viewModelMain.genresId
                    )
                }) {
                    Text("Get Movie")
                }
                .buttonStyle(.primaryStyle)
                NavigationLink("Continue",
                               destination: ResultView())
                //                вот до сюда потом сделаю одной кнопкой
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
