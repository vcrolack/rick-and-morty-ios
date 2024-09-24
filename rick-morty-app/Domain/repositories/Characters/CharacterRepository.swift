//
//  CharacterRepository.swift
//  rick-morty-app
//
//  Created by Victor rolack on 23-09-24.
//

import Foundation

protocol CharacterRepository {
    func fetchAllCharacters() async throws -> [Character]
    func fetchCharacterDetail(id: Int) async throws -> Character
}
