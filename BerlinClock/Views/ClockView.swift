import SwiftUI

struct ClockView: View {

    @State private var light = Light.off
    @State private var lights = [Light.off, Light.off, Light.off, Light.off ]

    var body: some View {
        VStack {
            LightView(light: $light)
            LightsRowView(lights: $lights)
            LightsRowView(lights: $lights)
            LightsRowView(lights: $lights)
            LightsRowView(lights: $lights)
            Text("12:12:12")
        }
    }
}

// MARK: - Preview

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
    }
}
