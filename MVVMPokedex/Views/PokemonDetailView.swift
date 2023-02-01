//
//  PokemonDetailView.swift
//  MVVMPokedex
//
//  Created by Fredy on 01/29/2023.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            PokemonView(vm: vm, pokemon: pokemon)
            
            VStack(spacing: 10) {
                Text("**ID**: \(pokemon.detail?.id ?? 0)")
                Text("**Weight**: \(vm.formatHW(value: pokemon.detail?.weight ?? 0)) KG")
                Text("**Height**: \(vm.formatHW(value: pokemon.detail?.height ?? 0)) M")
                Text("**Base Experience**: \(vm.formatHW(value: pokemon.detail?.baseExperience ?? 0))")
                Text("**Order**: \(vm.formatHW(value: pokemon.detail?.order ?? 0))")
//                Text("**stats**: \(vm.formatHW(value: vm.pokemonDetails?.stats ?? 0))")
//                Text("**forms**: \(vm.formatHW(value: vm.pokemonDetails?.forms ?? 0))")
//                Text("**forms**: \(vm.formatHW(value: vm.pokemonDetails?.moves ?? 0))")
                
                
            }
            .padding()
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
            
    }
}

