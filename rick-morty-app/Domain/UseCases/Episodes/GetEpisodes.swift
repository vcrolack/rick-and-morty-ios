//
//  GetEpisodesUseCase.swift
//  rick-morty-app
//
//  Created by Victor rolack on 23-09-24.
//

import Foundation

protocol GetEpisodesUseCase {
    func execute() async throws -> [Episode]
}
