//
//  APIError.swift
//  rick-morty-app
//
//  Created by Victor rolack on 23-09-24.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}
