//
//  PokemonView.swift
//  MVVMPokedex
//
//  Created by Fredy on 01/29/2023.

import SwiftUI



@available(iOS 16.0, *)
struct PokemonView: View {
    @ObservedObject var vm: ViewModel
    let pokemon: Pokemon
    let dimensions: Double = 110
    
    var body: some View {
        VStack {
            if let detail = pokemon.detail, let frontDefault = detail.sprites.frontDefault {
                AsyncImage(url: URL(string: frontDefault)) { image in
                    if let image = image {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: dimensions, height: dimensions)
                    }
                } placeholder: {
                    ProgressView()
                        .frame(width: dimensions, height: dimensions)
                }
                .background(.thinMaterial)
                .clipShape(Circle())
            }

            
            HStack {
                ZStack {
                    Text(" \(pokemon.name.capitalized) ") // Watch out for this, there is a space before and after the Pokémon name and it is necessary for the custom font to fit
                        .font(.custom("Pokemon Solid", size: 30))
                        .foregroundColor(.yellow)
                        .minimumScaleFactor(0.5)
                        .lineLimit(1) // limit the lineLimit
                        .minimumScaleFactor(0.7) // increased the minimumScaleFactor
                        .fixedSize(horizontal: false, vertical: false)

                        
                    Text(" \(pokemon.name.capitalized) ") // Watch out for this, there is a space before and after the Pokémon name and it is necessary for the custom font to fit
                        .font(.custom("Pokemon Hollow", size: 30))
                        .foregroundColor(.blue)
                        .minimumScaleFactor(0.5)
                        .lineLimit(1) // limit the lineLimit
                        .minimumScaleFactor(0.7) // increased the minimumScaleFactor
                        .fixedSize(horizontal: false, vertical: false)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                        )
                    
                    // TODO - Fix the vertical issue
                }
                
            }
            
            
        }

    }
}

struct FontWithLineHeight: ViewModifier {
    let font: UIFont
    let lineHeight: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(Font(font))
            .lineSpacing(lineHeight - font.lineHeight)
            .padding(.vertical, (lineHeight - font.lineHeight) / 2)
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 16.0, *) {
            PokemonView(vm: ViewModel(), pokemon: Pokemon.samplePokemon)
                .environmentObject(ViewModel())
        } else {
            // Fallback on earlier versions
        }
    }
}
