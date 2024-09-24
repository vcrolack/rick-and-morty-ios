//
//  Locations.swift
//  rick-morty-app
//
//  Created by Victor rolack on 23-09-24.
//

import Foundation

protocol LocationRepository {
    func fetchAllLocations() async throws -> [Location]
    func fetchLocationDetail(by id: Int) async throws -> Location
}
