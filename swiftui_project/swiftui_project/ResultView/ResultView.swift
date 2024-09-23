import SwiftUI

struct ResultView: View {
    let title: String
    let poster: String
    let genres: String

    var body: some View {
        MovieView(title: title, poster: poster, genres: genres)
    }
}
