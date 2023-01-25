import SwiftUI

struct LightView: View {

    // MARK: - Public properties

    @Binding var light: Light

    // MARK: - View

    var body: some View {
        Circle()
            .strokeBorder(.black, lineWidth: 2)
            .background(Circle().fill(lightColor(light: light)))
            .frame(width: 25, height: 25)
    }
}

// MARK: - Private methods

private extension LightView {

    func lightColor(light: Light) -> Color {
        switch light {
        case .red:
            return .red
        case .yellow:
            return .yellow
        default:
            return .clear
        }
    }
}

// MARK: - Preview

struct LightView_Previews: PreviewProvider {

    @State static var light = Light.off

    static var previews: some View {
        LightView(light: $light)
    }
}
