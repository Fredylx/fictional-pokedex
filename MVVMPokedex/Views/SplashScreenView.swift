//
//  SplashScreenView.swift
//  MVVMPokedex
//
//  Created by Fredy lopez on 1/30/23.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                VStack {
                    Text("Pokedex")
                        .font(.custom("Pokemon Solid", size: 50))
                        .foregroundColor(.yellow.opacity(0.80))
                    Text("Pokedex")
                        .font(.custom("Pokemon Hollow", size: 50))
                        .foregroundColor(.blue.opacity(0.80))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.00
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}

    
        
