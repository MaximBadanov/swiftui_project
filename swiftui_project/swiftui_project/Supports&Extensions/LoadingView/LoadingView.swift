import SwiftUI

struct LoadingView: View {
    private let scaleSize: CGFloat = 2
    
    var body: some View {
        Spacer(minLength: UISize.size8)
        ProgressView()
            .textStyle(
                size: UISize.size8,
                weight: .light
            )
            .scaleEffect(scaleSize)
            .tint(Color.customGray)
        Spacer(minLength: UISize.size8)
    }
}

#Preview {
    LoadingView()
}




