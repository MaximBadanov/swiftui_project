import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding(.vertical, UISize.size16)
            .frame(maxWidth: .infinity)
            .background(.customRed)
            .cornerRadius(UISize.size16)
    }
}
