//
//  PokemonManager.swift
//  MVVMPokedex
//
//  Created by Fredy on 01/29/2023.
// "https://pokeapi.co/api/v2/pokemon?offset=0&limit=151"
//


import Foundation
import UIKit

class PokemonManager {
    let limit = 150
    var start = 0
    
    init(limit: Int = 150, start: Int = 0) {
        self.start = start
    }
    
    var imageCache = NSCache<NSString, UIImage>()
    
    var nextBatch: String = "https://pokeapi.co/api/v2/pokemon?offset=0&limit=30"
    //offset is where you start and limit is how many Pokemon are shown

    
// MARK: - getPokemon
    func getPokemon(completion: @escaping(PokemonPage) -> Void) {
        fetchData(url: nextBatch, model: PokemonPage.self) { page in
            //Here you'll get the pokemon page
            self.nextBatch = page.next
            completion(page)
        } failure: { error in
            // Something went wrong
        }
    }
    
// MARK: - getSprite
    func getSprite(pokemon: Pokemon, completion: @escaping(UIImage) -> Void) {
        guard let detail = pokemon.detail, let frontDefault = detail.sprites.frontDefault else { return }
        
        if let cachedImage = imageCache.object(forKey: pokemon.name as NSString) {
            completion(cachedImage)
            return
        }
        
        guard let url = URL(string: frontDefault) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, let image = UIImage(data: data) else { return }
            self.imageCache.setObject(image, forKey: pokemon.name as NSString)
            completion(image)
        }
    }
    
    
// MARK: - fetchData
    func fetchData<T: Decodable>(url: String, model: T.Type, completion: @escaping(T) -> (), failure:@escaping(Error) -> ()) {
            guard let url = URL(string: url) else { return }
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else {
                    // If there is an error, return the error.
                    if let error = error { failure(error) }
                    return }
                
                do {
                    let serverData = try JSONDecoder().decode(T.self, from: data)
                    // Return the data successfully from the server
                    completion((serverData))
                } catch {
                    // If there is an error, return the error.
                    failure(error)
                }
            }.resume()
    }
    
// MARK: - getDetailedPokemon
    func getDetailedPokemon(pokemon: Pokemon, _ completion: @escaping (DetailPokemon) -> ()) {
        fetchData(url: pokemon.url, model: DetailPokemon.self) { detail in
            //Here you'll get the pokemon page
            //self.nextBatch = page.next
            completion(detail)
        } failure: { error in
            // Something went wrong
            print("Error: \(error)")
        }
    }
    
    
}

