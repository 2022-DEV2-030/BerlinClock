import SwiftUI

struct ClockView: View {

    @StateObject private var viewModel = ClockViewModel()

    var body: some View {
        VStack {
            LightView(light: $viewModel.secondsLight)
            LightsRowView(lights: $viewModel.fiveHoursLights)
            LightsRowView(lights: $viewModel.singleHoursLights)
            LightsRowView(lights: $viewModel.fiveMinutesLights)
            LightsRowView(lights: $viewModel.singleMinutesLights)
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
