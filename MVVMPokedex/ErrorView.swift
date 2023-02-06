//
//  ErrorView.swift
//  Rockets
//
//  Created by Fredy Lopez on 1/25/23.
//

import SwiftUI

struct ErrorView: View {
    let text: String
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                VStack(spacing: Device.isIpad ? 24.0 : 16.0) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .font(.system(size: Device.isIpad ? 80.0 : 54.0))
                        .tint(Color("cloud"))
                    
                    HStack {
                        Text(text)
                            .font(.system(size: Device.isIpad ? 24.0 : 16.0).bold())
                    }
                    .frame(maxWidth: 200.0)
                }
                .foregroundColor(Color("cloud"))
                Spacer()
            }
            
            Spacer()
        }
        .background(Color("gunmetal"))
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(text: "Unable to fetch Pokemon, please try again...")
    }
}
