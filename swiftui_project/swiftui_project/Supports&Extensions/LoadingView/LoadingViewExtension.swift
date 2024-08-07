import SwiftUI

extension View {
    @ViewBuilder
    func isLoading(isLoading: Bool, type: WhileLoading) -> some View {
        if isLoading {
            type.view
        } else {
            self
        }
    }
}
