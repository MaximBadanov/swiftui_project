import SwiftUI

struct NoPosterScreen: View {
    let title: String
    let genres: String
    
    private let opacity: Double = 0.1
    private let lineLimit: Int = 3
    
    var body: some View {
        VStack(spacing: UISize.size8) {
            Text("Your movie for today")
                .textStyle(
                    size: UISize.size24,
                    weight: .bold
                )
                .padding(.bottom, UISize.size16)
            Spacer()
            Image(systemName: "movieclapper")
                .resizable()
                .frame(maxWidth: .infinity)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(UISize.size16)
                .opacity(opacity)
            Spacer()
            Text(title)
                .textStyle(
                    size: UISize.size24,
                    weight: .heavy
                )
                .lineLimit(lineLimit)
                .padding(.horizontal, UISize.size16)
            Text(genres)
                .textStyle(
                    size: UISize.size16,
                    weight: .medium
                )
                .foregroundColor(.customGray)
            Spacer()
            Text("This movie is showed for you just once")
                .textStyle(
                    size: UISize.size16,
                    weight: .light
                )
        }
        .padding(.horizontal, UISize.size32)
    }
}
