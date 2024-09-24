//
//  Episode.swift
//  rick-morty-app
//
//  Created by Victor rolack on 24-09-24.
//

import Foundation

struct EpisodeDTO: Decodable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
}

extension EpisodeDTO {
    func toDomain() -> Episode {
        return Episode(
            id: id,
            name: name,
            airDate: air_date,
            episode: episode,
            characters: characters,
            url: url
        )
    }
}

struct EpisodeAPIResponse: Decodable {
    let results: [EpisodeDTO]
}
