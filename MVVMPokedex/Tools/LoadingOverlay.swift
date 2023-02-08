//
//  LoadingOverlay.swift
//  Rockets
//
//  Created by Fredy Lopez on 1/25/23.
//

import SwiftUI

struct LoadingOverlay: View {
    
    let text: String
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                VStack(spacing: Device.isIpad ? 24.0 : 16.0) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(CGSize(width: 1.65, height: 1.65))
                        .tint(Color("cloud"))
                    
                    HStack {
                        Text(text)
                            .font(.system(size: Device.isIpad ? 24.0 : 16.0).bold())
                            .foregroundColor(Color("cloud"))
                    }
                    .frame(maxWidth: 200.0)
                }
                Spacer()
            }
            
            Spacer()
        }
        .background(Color.black.opacity(0.86))
    }
}

struct LoadingOverlay_Previews: PreviewProvider {
    static var previews: some View {
        LoadingOverlay(text: "Loading Launch Details")
    }
}
