//
//  GetLocation.swift
//  rick-morty-app
//
//  Created by Victor rolack on 23-09-24.
//

import Foundation

protocol GetLocationUseCase {
    func execute(id: Int) async throws -> Location
}
