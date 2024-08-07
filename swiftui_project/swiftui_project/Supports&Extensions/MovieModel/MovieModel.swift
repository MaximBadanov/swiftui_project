struct MovieResponse: Decodable {
    let results: [MovieResponseModel]
}

struct MovieResponseModel: Decodable {
    let title: String
    let poster: String
    let genres: [Int]
    
    enum CodingKeys: String, CodingKey {
        case title
        case poster = "poster_path"
        case genres = "genre_ids"
    }
}
