//
//  EpisodeRepository.swift
//  rick-morty-app
//
//  Created by Victor rolack on 23-09-24.
//

import Foundation

protocol EpisodeRepository {
    func fetchAllEpisodes() async throws -> [Character]
    func fetchEpisodeDetail(by id: Int) async throws -> Character
}
