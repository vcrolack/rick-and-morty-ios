//
//  GetEpisode.swift
//  rick-morty-app
//
//  Created by Victor rolack on 23-09-24.
//

import Foundation

protocol GetEpisodeUseCase {
    func execute(id: Int) async throws -> Episode
}
