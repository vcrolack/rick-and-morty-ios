//
//  CharacterRepositoryImpl.swift
//  rick-morty-app
//
//  Created by Victor rolack on 23-09-24.
//

import Foundation

final class CharacterRepositoryImpl: CharacterRepository {
    private let baseUrl = "https://rickandmortyapi.com/api/character"
    
    func fetchAllCharacters() async throws -> [Character] {
        guard let url = URL(string: baseUrl) else {
            throw APIError.invalidURL 
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        do {
            let decodedResponse = try JSONDecoder().decode(CharacterAPIResponse.self, from: data)
            return decodedResponse.results.map { $0.toDomain()}
        } catch {
            throw APIError.decodingError
        }
    }
    
    func fetchCharacterDetail(id: Int) async throws -> Character {
        let urlString = "\(baseUrl)/\(id)"
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        do {
            let decodedCharacter = try JSONDecoder().decode(CharacterDTO.self, from: data)
            return decodedCharacter.toDomain()
        } catch {
            throw APIError.decodingError
        }
    }
}
