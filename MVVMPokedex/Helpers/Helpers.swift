//
//  Helpers.swift
//  MVVMPokedex
//
//  Created by Fredy on 01/29/2023.
///Users/fredylopez/Documents/EnhanceIT/MVVMPokedex-main/MVVMPokedex/Helpers/Helpers.swift:            URLSession.shared.dataTask(with: url) { (data, response, error) in

import Foundation

extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) from bundle.")
        }
        
        return loadedData
    }
}
