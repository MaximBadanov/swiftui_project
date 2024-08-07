import SwiftUI

struct EmptyScrollwWithGenres: View {
    private let sequence = 0 ..< 10
    
    var body: some View {
        ForEach(sequence, id: \.self) { _ in
            GenreButton(
                title: "Loading",
                emoji: "🔄",
                backgroundColor: Color.customGray,
                isSelected: false,
                toggleSelection: { }
            )
            .redacted(reason: .placeholder)
        }
    }
}
