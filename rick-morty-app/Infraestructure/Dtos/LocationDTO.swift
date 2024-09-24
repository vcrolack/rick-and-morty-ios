//
//  LocationDTO.swift
//  rick-morty-app
//
//  Created by Victor rolack on 23-09-24.
//

import Foundation

struct LocationDTO: Decodable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
}

extension LocationDTO {
    func toDomain() -> Location {
        return Location(
            id: id,
            name: name,
            type: type,
            dimension: dimension,
            residents: residents,
            url: url
        )
    }
}

struct LocationAPIResponse: Decodable {
    let results: [LocationDTO]
}


