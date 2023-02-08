//
//  Pokemon.swift
//  MVVMPokedex
//
//  Created by Fredy lopez on 1/25/23.
//
// https://pokeapi.co/api/v2/pokemon?limit=151

import Foundation

struct PokemonResult : Codable {
    var results: [Pokemon]
}

class PokeApi {
    var counter = 0
    
    func getData(completion: @escaping ([Pokemon]) -> ()) { 
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?offset=0&limit=151") else {
            
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error ) in
            guard let data = data else { return }
            
            let pokemonList = try! JSONDecoder().decode(PokemonResult.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonList.results)
            }
            
        }.resume()
    }
}
