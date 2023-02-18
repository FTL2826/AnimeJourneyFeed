//
//  ApiResponse.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /132/23.
// https://kitsu.io/api/edge/anime?page[limit]=20&page[offset]=0

struct ApiResponse: Decodable {
    let data: [TitleData]
    let meta: MetaInfo
    let links: Links
}

struct MetaInfo: Decodable {
    let count: Int
}

struct Links: Decodable {
    let first: String
    let next: String
    let last: String
}

struct TitleData: Decodable {
    let id: String
    let type: String
    let attributes: TitleAttributes
}

struct TitleAttributes: Decodable {
    let createdAt: String
    let updatedAt: String
    let synopsis: String
    let titles: Titles
    let canonicalTitle: String
    let averageRating: String
    let favoritesCount: Int
    let startDate: String?
    let endDate: String?
    let ageRatingGuide: String
    let subtype: String
    let status: String
    let posterImage: PosterImage
    let coverImage: CoverImage?
    let episodeCount: Int?
    let episodeLength: Int?
}

struct Titles: Decodable {
    let english: String?
    let romaji: String
    let japanese: String
    
    enum CodingKeys: String, CodingKey {
        case english = "en"
        case romaji = "en_jp"
        case japanese = "ja_jp"
    }
}

struct PosterImage: Decodable {
    let tiny: String
    let medium: String
}

struct CoverImage: Decodable {
    let tiny: String
}

