//
//  Content-ViewModel.swift
//  MVVMPokedex
//
//  Created by Fredy on 01/29/2023.
//

import Foundation
import SwiftUI
import UIKit

@available(iOS 16.0, *)
class ViewModel: ObservableObject {
    private let pokemonManager = PokemonManager()
    
    @Published var pokemonList = [Pokemon]()
    @Published var searchText = ""
    @Published var navigationPath = NavigationPath()
    
    
    var imageCache = NSCache<Pokemon, UIImage>()
    
    // Used with searchText to filter Pokémon results
    var filteredPokemon: [Pokemon] {
                return searchText == "" ? pokemonList : pokemonList.filter { $0.name.contains(searchText.lowercased()) }
            }
    // play with below for pagin
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
    
    
    //TODO: make load 30 at a time
    // Get the index of a pokemon ( index + 1 = pokemon id)
//    func getPokemonIndex(pokemon: Pokemon) -> Int {
//        if let index = self.pokemonList.firstIndex(of: pokemon) {
//            return index + 1
//        }
//        return 0
//    }
//let id = getPokemonIndex(pokemon: pokemon),,
    
    
// Get specific details for a Pokemon
    func getDetails(pokemon: Pokemon) {

                
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
    
    func performCallback() {
        let scrollView = UIScrollView()
        let screen = UIScreen.main
        let screenWidth = screen.bounds.size.width
        let screenHeight = screen.bounds.size.height


        // Set the content size of the scroll view
        scrollView.contentSize = CGSize(width: screenWidth, height: screenHeight)

        // Calculate the maximum content offset
        let bottomOffset = CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.size.height)

        // Set the content offset to the maximum value
        scrollView.setContentOffset(bottomOffset, animated: true)

    }
}
