import SwiftUI

struct StartScreen: View {
    @State private var goNextScreen = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: UISize.size8) {
                HStack(alignment: .firstTextBaseline,
                       spacing: UISize.size8) {
                    CustomImage(imageName: Icons.tv.icon,
                                renderingMode: .original,
                                size: UISize.size24,
                                color: nil)
                    CustomImage(imageName: Icons.tvWithWifi.icon,
                                renderingMode: .template,
                                size: UISize.size24,
                                color: nil)
                    CustomImage(imageName: Icons.tvAndHiFiSpeaker.icon,
                                renderingMode: .original,
                                size: UISize.size24,
                                color: nil)
                }
                       .textStyle(size: UISize.size24,
                                  weight: .regular)
                Spacer()
                LogoView()
                Spacer()
                Button("Continue", action: {
                    goNextScreen.toggle()
                })
                .buttonStyle(.primaryStyle)
                .padding(.horizontal, UISize.size40)
                .navigationDestination(
                    isPresented: $goNextScreen,
                    destination: { GenresScreen() }
                )
            }
            .padding(.bottom, UISize.size16)
        }
    }
}

#Preview {
    StartScreen()
}


