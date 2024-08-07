import SwiftUI

struct TextStyle: ViewModifier {
    var size: CGFloat
    var weight: Font.Weight
    
    func body(content: Content) -> some View {
        content
            .font(
                Font.system(
                    size: size,
                    weight: weight))
    }
}
