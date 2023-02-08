//
//  PillBox.swift
//  Rockets
//
//  Created by Fredy Lopez on 1/23/23.
//

import SwiftUI

struct PillBox: ViewModifier {
    
    let backgroundColor: Color
    let strokeColor: Color
    let cornerRadius: CGFloat
    let strokeWidth: CGFloat
    
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { geometry in
                    ZStack {
                        RoundedRectangle(cornerRadius: cornerRadius + strokeWidth)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .foregroundColor(strokeColor)
                        
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .frame(width: geometry.size.width - (strokeWidth * 2),
                                   height: geometry.size.height - (strokeWidth * 2))
                            .foregroundColor(backgroundColor)
                    }
                }
            )
    }
}

extension View {
    func pillBox(backgroundColor: Color,
                 strokeColor: Color,
                 cornerRadius: CGFloat,
                 strokeWidth: CGFloat) -> some View {
        modifier(PillBox(backgroundColor: backgroundColor,
                         strokeColor: strokeColor,
                         cornerRadius: cornerRadius,
                         strokeWidth: strokeWidth))
    }
}
