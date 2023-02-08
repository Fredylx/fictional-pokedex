//
//  RootView.swift
//  MVVMPokedex
//
//  Created by Fredy lopez on 2/1/23.
//

import Foundation
import SwiftUI

@available(iOS 16.0, *)
struct RootNavigationView: View {
    
    
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        NavigationStack(path: $viewModel.navigationPath) {
            if let pokemon = viewModel.pokemonList.first {
                PokemonView(vm: viewModel, pokemon: pokemon)
            }
        }
    }
}
