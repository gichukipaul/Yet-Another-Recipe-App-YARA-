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
    
    func searchAndGetRecipes(for name: String, completion: @escaping (Result<[Recipe], YARAError>) -> Void) {
        
        
            // query parameters
        let page = 1
        let queryString: String = name
        var components = URLComponents(string: baseUrl)
        
        components?.queryItems = [
            URLQueryItem(name: "page", value: String(page)),
            URLQueryItem(name: "query", value: queryString)
        ]
        
        guard let url = components?.url else {
            completion(.failure(.badUrl))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(token, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print("ERROR: \(error)")
                completion(.failure(.serverError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decodedResponse: RecipeCatalogResponse = try JSONDecoder().decode(RecipeCatalogResponse.self, from: data)
                
                guard let recipes = decodedResponse.results else {
                    completion(.failure(.noData))
                    return
                }
                
                completion(.success(recipes))
            } catch (let error) {
                print(error)
                completion(.failure(.decodingError))
                return
            }
            
        }.resume()
    }
}

enum YARAError: Error {
    case badUrl
    case serverError
    case noData
    case decodingError
}
