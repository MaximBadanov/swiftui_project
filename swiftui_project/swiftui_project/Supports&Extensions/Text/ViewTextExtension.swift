import SwiftUI

extension View {
    func textStyle(size: CGFloat,
                   weight: Font.Weight) -> some View {
        modifier(TextStyle(size: size,
                           weight: weight))
    }
}
