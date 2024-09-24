//
//  CharacterDTO.swift
//  rick-morty-app
//
//  Created by Victor rolack on 23-09-24.
//

import Foundation

struct CharacterDTO: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let image: String
}

extension CharacterDTO {
    func toDomain() -> Character {
        return Character(
            id: id,
            name: name,
            status: status,
            species: species,
            type: type,
            gender: gender,
            image: image
        )
    }
}

struct CharacterAPIResponse: Decodable {
    let results: [CharacterDTO]
}
