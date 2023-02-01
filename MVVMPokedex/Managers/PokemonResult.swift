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
    
    func getData(completion: @escaping ([Pokemon]) -> ()) { //getData is a func that allows you to use again in ContentView
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?offset=0&limit=151") else { //TODO: make load 30 at a time
            return
        }
        
        //Lazy Load
        
        
        URLSession.shared.dataTask(with: url) { (data, response, error ) in
            guard let data = data else { return }
            
            let pokemonList = try! JSONDecoder().decode(PokemonResult.self, from: data) //try! in this allows the code to know, this can throw an error. OK DON'T freakout
            
            DispatchQueue.main.async {
                completion(pokemonList.results)
            }
            
        }.resume()
    }
}
