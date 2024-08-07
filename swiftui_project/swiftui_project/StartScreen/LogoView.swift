import SwiftUI

struct LogoView: View {
    var body: some View {
        VStack(spacing: UISize.size24) {
            HStack(spacing: UISize.size8) {
                Text(Logo.movy.name)
                    .foregroundColor(.customGray)
                Text(".")
                    .foregroundColor(.customRed)
            }
            .textStyle(size: UISize.size64,
                       weight: .bold)
            VStack(spacing: UISize.size8) {
                Text("Choose your best movie for")
                Text("tonight quickly.")
            }
            .textStyle(size: UISize.size24,
                       weight: .regular)
        }
    }
}

#Preview {
    LogoView()
}
