//
//  Content-ViewModel.swift
//  MVVMPokedex
//
//  Created by Fredy on 01/29/2023.
//

import Foundation
import SwiftUI
import UIKit

class ViewModel: ObservableObject {
    private let pokemonManager = PokemonManager()
    
    @Published var pokemonList = [Pokemon]()
    @Published var searchText = ""
    
    var imageCache = NSCache<Pokemon, UIImage>()
    
    // Used with searchText to filter Pokémon results
    var filteredPokemon: [Pokemon] {
                return searchText == "" ? pokemonList : pokemonList.filter { $0.name.contains(searchText.lowercased()) }
            }
    
    init() {
        pokemonManager.getPokemon(completion: { (pokemonPage: PokemonPage) in
            DispatchQueue.main.async {
                self.pokemonList = pokemonPage.results
            }
            
            for pokemon in pokemonPage.results {
                self.getDetails(pokemon: pokemon)
            }
        })
    }
    
    
    
    // Get the index of a pokemon ( index + 1 = pokemon id)
//    func getPokemonIndex(pokemon: Pokemon) -> Int {
//        if let index = self.pokemonList.firstIndex(of: pokemon) {
//            return index + 1
//        }
//        return 0
//    }
    
    // Get specific details for a pokemon
    func getDetails(pokemon: Pokemon) {
        //let id = getPokemonIndex(pokemon: pokemon)
                
        pokemonManager.getDetailedPokemon(pokemon: pokemon) { data in
            DispatchQueue.main.async {
                pokemon.detail = data
            }
            
            self.pokemonManager.getSprite(pokemon: pokemon) { image in
                self.imageCache.setObject(image, forKey: pokemon)
            }
        }
    }
    
    // Formats the Height or the Weight of a given pokemon, also used for Exp & Order
    func formatHW(value: Int) -> String {
        let dValue = Double(value)
        let string = String(format: "%.2f", dValue / 10)
        
        return string
    }
    
//    // Formats an Array of a given pokemon
//    func formatA(value: [String]) -> String {
//        let aValue = [value]
//        let string = [String(format: "%.2f", aValue) ]
//
//        return string
//    }
}
