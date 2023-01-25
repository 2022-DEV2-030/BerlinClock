import SwiftUI

struct LightsRowView: View {

    @Binding var lights: [Light]

    var body: some View {
        HStack {
            ForEach($lights) { $light in
                LightView(light: $light)
            }
        }
    }
}

// MARK: - Preview

struct LightsRowView_Previews: PreviewProvider {

    @State static var light = [Light.red, Light.yellow, Light.off]

    static var previews: some View {
        LightsRowView(lights: $light)
    }
}
