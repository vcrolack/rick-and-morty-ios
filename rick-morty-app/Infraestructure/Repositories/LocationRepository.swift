//
//  LocationRepository.swift
//  rick-morty-app
//
//  Created by Victor rolack on 23-09-24.
//

import Foundation

final class LocationRepositoryImpl: LocationRepository {
    private let baseUrl = "https://rickandmortyapi.com/api/location"
    
    func fetchAllLocations() async throws -> [Location] {
        guard let url = URL(string: baseUrl) else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        do {
            let decodedResponse = try JSONDecoder().decode(LocationAPIResponse.self, from: data)
            return decodedResponse.results.map { $0.toDomain() }
        } catch {
            throw APIError.decodingError
        }
    }
    
    func fetchLocationDetail(by id: Int) async throws -> Location {
        let stringUrl = "\(baseUrl)/\(id)"
        
        guard let url = URL(string: stringUrl) else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        do {
            let decodedLocation = try JSONDecoder().decode(LocationDTO.self, from: data)
            return decodedLocation.toDomain()
        } catch {
            throw APIError.decodingError
        }
    }
}
