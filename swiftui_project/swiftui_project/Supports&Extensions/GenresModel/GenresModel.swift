struct GenresResponse: Decodable {
    let genres: [GenreResponseModel]
}

struct GenreResponseModel: Decodable, Identifiable {
    let id: Int
    let name: String
}
