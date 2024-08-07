import SwiftUI

extension View {
    func genreButtonStyle(backgroundColor: Color, isSelected: Bool) -> some View {
        buttonStyle(
            GenreButtonStyle(
                backgroundColor: backgroundColor,
                isSelected: isSelected
            )
        )
    }
}
