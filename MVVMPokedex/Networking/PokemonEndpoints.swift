//
//  RocketsEndpoints.swift
//  Rockets
//
//  Created by Fredy Lopez on 1/23/23.
//
//https://pokeapi.co/api/v2/pokemon?offset=0&limit=30
//https://pokeapi.co/

import Foundation

struct PokemonEndpoint<Response: Decodable> {
    let url: URL
    let responseType: Response.Type
}

struct PokemonEndpoints {

    static func pokemon() -> PokemonEndpoint<[PokemonPage]> {
        PokemonEndpoint(url: URL(string: "https://pokeapi.co/api/v2/pokemon?offset=0&limit=151")!,
                        responseType: [PokemonPage].self)
    }

}



