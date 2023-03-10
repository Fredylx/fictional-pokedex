//
//  ContentView.swift
//  MVVMPokedex
//
//  Created by Fredy on 01/29/2023.
//

import SwiftUI

@available(iOS 16.0, *)
struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 130))
    ]
    
    private let customFont = UIFont(name: "Pokemon solid", size: 20)
    
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Text("Pokedex")
                        .font(.custom("Pokemon Solid", size: 25))
                        .foregroundColor(.yellow)
                        .opacity(0.3)
                    ScrollView {
                        LazyVGrid(columns: adaptiveColumns, spacing: 5) {
                            ForEach(viewModel.filteredPokemon) { pokemon in
                                NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                                    PokemonView(vm: viewModel, pokemon: pokemon)
                                }
                                .onAppear {
                                    if pokemon == viewModel.pokemonList.last {
                                        viewModel.loadNext30()
                                    }
                                }
                            }
                        }
                        .animation(.easeInOut(duration: 0.3), value: viewModel.filteredPokemon.count)
                        .navigationTitle("Pokedexarino")
                        .navigationBarTitleDisplayMode(.inline)
                    }
                    .searchable(text: $viewModel.searchText)
                }
            }
        }
        
        .environmentObject(viewModel)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
