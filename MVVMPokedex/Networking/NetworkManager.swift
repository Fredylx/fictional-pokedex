//
//  NetworkManager.swift
//  Rockets
//
//  Created by Fredy Lopez on 1/23/23.
//

import Foundation

class NetworkManager {
    
    lazy var decoder: JSONDecoder = {
        JSONDecoder()
    }()
    
    func download<Response>(endpoint: PokemonEndpoint<Response>) async throws -> Response {
        let (data, response) = try await URLSession.shared.data(from: endpoint.url)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        guard (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        print("data = \(data)")
        
        return try decoder.decode(Response.self,
                                  from: data)
    }
}
