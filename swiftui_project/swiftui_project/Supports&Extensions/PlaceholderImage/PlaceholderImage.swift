import SwiftUI

struct PlaceholderImage: View {
    private let opacity: Double = 0.1
    
    var body: some View {
        Image(systemName: "movieclapper")
            .resizable()
            .frame(maxWidth: .infinity)
            .cornerRadius(UISize.size8)
            .aspectRatio(contentMode: .fit)
            .opacity(opacity)
            .foregroundColor(.customGray)
    }
}
