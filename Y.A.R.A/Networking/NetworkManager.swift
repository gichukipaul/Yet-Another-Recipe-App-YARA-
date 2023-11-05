//
//  NetworkManager.swift
//  Y.A.R.A - Yet Another Recipe App
//
//  Created by Gichuki on 29/10/2023.
//

import Foundation
import SwiftUI

final class NetworkManager {
    static let shared = NetworkManager()
    private init(){}
    
    
    private let baseUrl = "https://food2fork.ca/api/recipe/search/"
    private let token = "Token 9c8b06d329136da358c2d00e76946b0111ce2c48" // HIDE THIS
    
    func  getRecipes(for name: String) async throws -> [Recipe] {
        
            // query parameters
        let page = 1
        let queryString: String = name
        var components = URLComponents(string: baseUrl)
        
        components?.queryItems = [
            URLQueryItem(name: "page", value: String(page)),
            URLQueryItem(name: "query", value: queryString)
        ]
        
        guard let url = components?.url else {
            throw YARAError.badUrl
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(token, forHTTPHeaderField: "Authorization")
        
        let (data, response) =  try await URLSession.shared.data(for: request)
        
        guard response is HTTPURLResponse else {
            throw YARAError.serverError
        }
        
        do {
            let decodedResponse: RecipeCatalogResponse = try JSONDecoder().decode(RecipeCatalogResponse.self, from: data)
            
            guard let recipes = decodedResponse.results else {
                throw YARAError.noData
            }
            
            return recipes
        } catch (let error) {
            print(error)
            throw YARAError.decodingError
        }
    }
}

enum YARAError: Error {
    case badUrl
    case serverError
    case noData
    case decodingError
}
