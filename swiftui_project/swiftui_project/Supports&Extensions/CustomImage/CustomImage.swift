import SwiftUI

struct CustomImage: View {
    let imageName: String
    let renderingMode: Image.TemplateRenderingMode?
    let size: CGFloat
    let color: Color?
    var body: some View {
        Image(systemName: imageName)
            .renderingMode(renderingMode)
            .font(
             Font.system(
                 size: size))
            .foregroundColor(color)
    }
}
