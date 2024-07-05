//
//  CardView.swift
//  employeesApp
//
//  Created by Edgar Tobón Sosa on 04/07/24.
//

import SwiftUI


struct CardView: ViewModifier {
    
    let percentWidth: CGFloat?
    let height: CGFloat?
    let cornerRadius: CGFloat
    let cardColor: Color
    let shadowColor: Color
    let shadowRadious: CGFloat
    let shadowX: CGFloat
    let shadowY: CGFloat
    init(percentWidth: CGFloat? = nil, height: CGFloat? = nil, cornerRadius: CGFloat = 8, cardColor: Color = Color.white, shadowRadious: CGFloat = 5, shadowColor: Color = Color.black.opacity(0.1), shadowX:CGFloat = 0, shadowY:CGFloat = 2) {
        self.percentWidth = percentWidth
        self.height = height
        self.cornerRadius = cornerRadius
        self.cardColor = cardColor
        self.shadowColor = shadowColor
        self.shadowRadious = shadowRadious
        self.shadowX = shadowX
        self.shadowY = shadowY
    }
    
    func body(content: Content) -> some View {
    
        content
            .background {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(
                        width: percentWidth,
                        height: height
                    )
                    .foregroundColor(cardColor)
                    .shadow(color: shadowColor, radius: shadowRadious, x: 0, y: 0)
            }
    }
}



#Preview {
    Text("aslgjhakklhjdgkahdgdg")
        .cardStyle()
}

extension View {
    func cardStyle() -> some View {
        modifier(CardView())
    }
}
