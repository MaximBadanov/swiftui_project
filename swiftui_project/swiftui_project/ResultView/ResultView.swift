import SwiftUI

struct ResultView: View {
    @State private var isLoading: Bool = true
    private let scaleSize: CGFloat = 2

    var body: some View {
        if isLoading {
            ProgressView()
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity)
                .scaleEffect(scaleSize)
                .onAppear() {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            isLoading = false
                        }
                    }
                }
        } else {
            Text("Your movie for today")
                .textStyle(size: UISize.size24,
                           weight: .bold)
            Spacer(minLength: UISize.size8)
            MovieView()
            Spacer(minLength: UISize.size8)
            Text("This movie is showed for you just once")
                .textStyle(size: UISize.size16,
                           weight: .light)
        }
    }
}

#Preview {
    ResultView()
}
