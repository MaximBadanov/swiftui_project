import SwiftUI

struct GenreButtonStyle: ButtonStyle {
    let backgroundColor: Color
    let isSelected: Bool
    let size = UISize.size64
    let halfOpacity = 0.5
    let lineWidth: CGFloat = 4
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(
                width: size,
                height: size
            )
            .background(backgroundColor.opacity(halfOpacity))
            .cornerRadius(UISize.size8)
            .overlay(
                RoundedRectangle(cornerRadius: UISize.size8)
                    .stroke(
                        isSelected ? backgroundColor : Color.clear,
                        lineWidth: lineWidth
                    )
            )
    }
}

